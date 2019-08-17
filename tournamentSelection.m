function iSelected = TournamentSelect(fitness,tournamentSelectionParameter);
populationSize = size(fitness,1);
iTmp1 = 1 + fix(rand*populationSize);
iTmp2 = 1 + fix(rand*populationSize);
r = rand;
if (r < tournamentSelectionParameter)
    if (fitness(iTmp1) > fitness(iTmp2))
        iSelected = iTmp1;
    else
        iSelected = iTmp2;
    end
else
    if (fitness(iTmp1) > fitness(iTmp2))
        iSelected = iTmp2;
    else
        iSelected = iTmp1;
    end
end