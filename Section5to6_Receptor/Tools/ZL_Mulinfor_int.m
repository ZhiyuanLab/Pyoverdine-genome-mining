function [H1,H2,CH1_given2,CH2_given1,mulin]=ZL_Mulinfor_int(data1,data2)

% get the good data1 and 2
datanum=length(data1);
data1=reshape(data1,datanum,1);
data2=reshape(data2,datanum,1);

goodlist=find(~isnan(data1) & ~isnan(data2) & ~isinf(data1) & ~isinf(data2));
data1=data1(goodlist);
data2=data2(goodlist);


if length(data1)>3

% mutual information for two intergals
tab1=tabulate(data1);
tab1=tab1(tab1(:,2)>0,[1,3]);tab1(:,2)=tab1(:,2)/100;

tab2=tabulate(data2);
tab2=tab2(tab2(:,2)>0,[1,3]);tab2(:,2)=tab2(:,2)/100;

H1=Entropy(tab1(:,2));
H2=Entropy(tab2(:,2));

% conditional entropy of CH1 if the other is known
CH1_given2=0;
for i=1:size(tab2,1)
    v2_freq=tab2(i,2);
    v2=tab2(i,1);
    v1list=data1(data2==v2);
    tab1_given2=tabulate(v1list);
    freq=tab1_given2(:,3)/100;
    CH1_given2=CH1_given2+v2_freq*Entropy(freq);
end


% conditional entropy of CH1 if the other is known
CH2_given1=0;
for i=1:size(tab1,1)
    v1_freq=tab1(i,2);
    v1=tab1(i,1);
    v2list=data2(data1==v1);
    tab2_given1=tabulate(v2list);
    freq=tab2_given1(:,3)/100;
    CH2_given1=CH2_given1+v1_freq*Entropy(freq);
end


mul1=H1-CH1_given2;
mul2=H2-CH2_given1;
if abs(mul1-mul2)<0.01
    mulin=mean([mul1,mul2]);
else
    perror('wrong calculation');
end
else
    H1=nan;
    H2=nan;
    CH1_given2=nan;
    CH2_given1=nan;
    mulin=nan;
end
