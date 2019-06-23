BA example start, x nodes, y new connections added in every step

seed =[0 1 0 0 1;1 0 0 1 0;0 0 0 1 0;0 1 1 0 0;1 0 0 0 0]
Net = SFNG(x, y, seed)
PL_Equation = PLplot(Net)
CNet(Net)


ER example start, x nodes, y prob

Net = ER(x, y)
PL_Equation = PLplot(Net)
CNet(Net)