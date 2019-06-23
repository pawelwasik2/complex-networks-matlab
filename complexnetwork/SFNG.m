function SFNet = SFNG(Nodes, mlinks, seed)
seed = full(seed); %zabezpieczenie, zapisuje w postaci macierzy
pos = length(seed); %ilosc wezlow w macierzy seed
Net = zeros(Nodes, Nodes, 'single'); %tworzy macierz zerowa
Net(1:pos,1:pos) = seed; %przypisuje seed do glownej macierzy, by zaczac od tego miejsca
sumlinks = sum(sum(Net)); %suma po³¹czen wez³ów
while pos < Nodes %warunek wejscia do petli
    pos = pos + 1; %iteracja, numer wezla dla ktorego tworzone jest polaczenie
    linkage = 0; %zmienna pomocnicza do tworzenia polaczenia dla nowego wezla
    while linkage ~= mlinks
        rnode = ceil(rand * (pos-1)); %losuje wezel, do ktorego ma byc stworzone polaczenie
        deg = sum(Net(:,rnode)) * 2; %obliczanie stopnia wierzcholka
        
        rlink = rand * 1;
        if rlink < deg / sumlinks && Net(pos,rnode) ~= 1 && Net(rnode,pos) ~= 1
            %zasada przypisywania polaczen (bogaty staje sie bogatszy) &&
            %nie ma polacznia miedzy tymi wezlami
            Net(pos,rnode) = 1;
            Net(rnode,pos) = 1;
            linkage = linkage + 1;
            sumlinks = sumlinks + 2;
        end
    end
end
clear Nodes deg linkage pos rlink rnode sumlinks mlinks %czyszczenie zmiennych
SFNet = Net;