function ERNet = ER(Nodes, prob)
Net = zeros(Nodes, Nodes, 'single'); %%tworzenie glownej macierzy
Net2 = zeros(Nodes, Nodes, 'single'); %%tworzenie macierzy pomocniczej
for pos1 = 1:Nodes 
    for pos2 = 1:Nodes
        rvar = rand; %%losowanie liczby
        if rvar < prob && Net2(pos1,pos2) ~= 1 && Net2(pos2,pos1) ~= 1
            %%sprawdzanie czy losowa liczba jest mniejsza od
            %%prawdopodobienstwa, jesli tak, tworzy polaczenie miedzy
            %%wezlami oraz zaznacza w macierzy pomocniczej ze polaczenie
            %%bylo juz sprawdzane, jesli nie, zaznacza tylko w macierzy
            %%pomocniczej nie tworzac polaczenia
            Net(pos1,pos2) = 1;
            Net(pos2,pos1) = 1;
        end
         Net2(pos1,pos2) = 1;
         Net2(pos2,pos1) = 1;
    end
end
ERNet = Net;