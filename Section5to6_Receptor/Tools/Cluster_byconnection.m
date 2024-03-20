function [node_groupid,totalgnum,changedleaforder_bygroups] = Cluster_byconnection(distm,distthresh,optleaforder)
% seperate the connections by distance therehold
datanum=size(distm,1);

if nargin<3
    optleaforder=1:datanum;
end
connect_m=distm(optleaforder,optleaforder)<distthresh;

%figureimagesc(connect_m)

totalgnum=1;
node_used=zeros(1,datanum); % already used for search
node_groupid_aloneleaf=zeros(1,datanum);

currentnode=1;
currentgroupmembers=currentnode;

while min(node_groupid_aloneleaf)==0 % not all of them are assigned
    newmembers=find(connect_m(currentnode,:)==1 & node_groupid_aloneleaf==0);
    node_groupid_aloneleaf(newmembers)=totalgnum;
    node_used(currentnode)=1;
    currentgroupmembers=[currentgroupmembers,newmembers];
    nexttouse=min(currentgroupmembers(node_used(currentgroupmembers)==0));
    
    if ~isempty(nexttouse)
        currentnode=nexttouse;
    else
        totalgnum=totalgnum+1;
        currentnode=min(find(node_groupid_aloneleaf==0));
        % switch to another group
        currentgroupmembers=currentnode;
    end
end



node_groupid=0*node_groupid_aloneleaf;
node_groupid(optleaforder)=node_groupid_aloneleaf;



changedleaforder_bygroups=[];
for i=1:totalgnum
    membersinorder=find(node_groupid(optleaforder)==i);
    changedleaforder_bygroups=[changedleaforder_bygroups,optleaforder(membersinorder)];
end

end



