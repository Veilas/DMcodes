function [rjesenje] = dijkstra(veze,pocetni)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   height = length(veze);
   rjesenje = zeros(height, 3);
   duzine = inf*ones(1, height);
   duzine(pocetni) = 0;
   from = -ones(1,height);
   from(pocetni) = pocetni;
   rjesenje(pocetni,1) = pocetni;
   rjesenje(pocetni,2) = 0;
   rjesenje(pocetni,3) = pocetni;
   
   while (1 == 1)
    next = duzine;
    for i = 1:height
        if(rjesenje(i,1) ~= 0)
            for j = 1:height
                if( veze(i,j) ~= 0 )
                    if(next(i) + veze(i,j) < next(j))
                        next(j) = next(i) + veze(i,j);
                        from(j) = i;
                    end
                end
            end
        end
    
    end
    min = -1;
    for i = 1:height
        if min == -1 && rjesenje(i,1) == 0 && from(i) ~= -1
            min = i;   
        elseif min ~= -1 && rjesenje(i,1) == 0 && next(i) < next(min)
            min = i;
        end
    end
    next
    from
    rjesenje(min, 1) = min;
    rjesenje(min, 2) = next(min);
    rjesenje(min, 3) = from(min); 
    duzine = next;
    if any(rjesenje(:,1) == 0) == false
        break
    end
   end
end

