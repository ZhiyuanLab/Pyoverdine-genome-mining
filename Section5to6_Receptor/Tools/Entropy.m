function [entro,maxentro]=Entropy(distribution)
%distribution don't have to be normalized

entro=0;
    % 1. normalizaition: 
    summation=sum(distribution);
    if summation>0;
        distribution=distribution/summation; 
    end
    
    
    for i=1:length(distribution)
        p=distribution(i);
        if p>0
            entro=entro - p*log2(p);
        end
    end
    
    maxentro=-log2(1/length(distribution));