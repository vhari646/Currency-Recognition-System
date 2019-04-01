function num=findpoint(bwpattern)
num=0
for ii=1:size(bwpattern,1)
    for jj=1:size(bwpattern,2)
        if(bwpattern(ii,jj)==1)
            num=num+1;
        end
    end
end