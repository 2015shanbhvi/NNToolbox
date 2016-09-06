
function pop = makePop(population, percentage);

pop = rand(1,population);
for i = 1:population 
    %for 40%
    if (pop(i) <= (percentage/100))
        val = 0
        pop(i) = val;
    else
        val = 1
        pop(i) = val;
    end
    
    disp(val);
    
    
end

