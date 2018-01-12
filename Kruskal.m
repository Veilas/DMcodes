function [T V] = Kruskal( E )
    [height, width] = size(E);
    vertexcount = length(unique([E(:,1) E(:,2)]).');
    
    unionfind = zeros(1,vertexcount);
    for i = 1:vertexcount
        unionfind(i) = i;
    end
    function root = findroot(element)
        if element == unionfind(element)
            root = element;
            return;
        end
        unionfind(element) = findroot(unionfind(element));
        root = unionfind(element);
    end
    function [] = union(first, second)
        unionfind(findroot(first)) = unionfind(findroot(second));
    end
    function bool = connected(first,second)
        bool = (findroot(first) == findroot(second));
    end
    edges = sortrows(E,3);
    T = [0 0];
    V = 0;
    for i = 1:height
        if(connected(edges(i,1),edges(i,2)) == false)
            T = [T; edges(i,1:2)];
            V = V + edges(i,3);
            union(edges(i,1), edges(i,2));
        end
    end
    T = T(2:end,:);
end

