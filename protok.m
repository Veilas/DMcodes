function [X, V] = protok( C )
    [height,width] = size(C);
    function [put, gotovo] = BFS(pocetni, krajni)
        visited = zeros(1,height);
        visited(pocetni) = -1;
        queue = [pocetni];
        while( 1 == 1 )
            curr = queue(1);
            queue = queue(2:end);
            for i = 1:width
                if C(curr,i) ~= 0 && visited(i) == 0
                    queue = [queue i];
                    visited(i) = curr;
                end
            end
            if isempty(queue)
                break;
            end
        end
        visited
        put = [krajni];
        if visited(krajni) == 0
            gotovo = 1;
            return;
        end
        gotovo = 0;
        while visited(put(1)) ~= -1 
            put = [visited(put(1)) put];
        end
    end
    function delta =  mincost(put)
        delta = inf;
        for i = 1: (length(put) -1)
            if delta > C(put(i), put(i + 1))
                delta = C(put(i), put(i + 1));
            end
        end
    end
    V = 0;
    Ccopy = C;
    C
    while(1 == 1)
        [put, gotovo] = BFS(1,height);
        if gotovo == 1
            break;
        end
        put
        delta = mincost(put)
        V = V + delta;
        for i = 1: (length(put) -1)
            C(put(i), put(i +1)) = C(put(i), put(i +1)) - delta;
            C(put(i+1),put(i)) = C(put(i+1),put(i)) + delta; 
        end
        C
    end
    X = 0.*Ccopy;
    for i = 1:height
        for j = 1:width
            if Ccopy(i,j) ~= 0
                X(i,j) = C(j,i);
            end
        end
    end
    
end

