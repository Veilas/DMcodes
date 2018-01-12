function  [rjesenje,min_duzina] = prim(veze)

   height = length(veze);
   rjesenje = zeros(height, 3);
   duzine = inf*ones(1, height);
   duzine(1) = 0;
   from = -ones(1,height);
   from(1) = 1;
   rjesenje(1,1) = 1;
   rjesenje(1,2) = 0;
   rjesenje(1,3) = 1;
   
   while (1 == 1)
    next = duzine;
    for i = 1:height
        if(rjesenje(i,1) ~= 0)
            for j = 1:height
                if( veze(i,j) ~= 0 )
                    if(veze(i,j) < next(j))
                        next(j) = veze(i,j);
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
        elseif rjesenje(i,1) == 0 && next(i) < next(min)
            min = i;
        end
    end
    
    rjesenje(min, 1) = min;
    rjesenje(min, 2) = next(min);
    rjesenje(min, 3) = from(min); 
    duzine = next;
    if any(rjesenje(:,1) == 0) == false
        break
    end
   end
   min_duzina = 0;
    for i = 1:height
       min_duzina = rjesenje(i,2) + min_duzina;
    end
end

