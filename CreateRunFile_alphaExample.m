clear
clc
%%
fileNAME = 'C:\Users\User\Documents\Fall2021\402A\AVL\RunFiles\OURPLANEV1alphas_5Flap.run';
fileID = fopen(fileNAME,'w+');
versionNum = 1;
runCons = ["alpha","beta","pb/2V","qc/2V","rb/2V", "Flaps"];
A = linspace(-10,10,21);
B = zeros(1,21);
C = zeros(1,21);
D = zeros(1,21);
E = zeros(1,21);
F = ones(1,21) * 5;
runConsVals = [A', B',C',D',E', F'];
NAMES = ["alpha: -10","alpha: -9","alpha: -8","alpha: -7","alpha: -6","alpha: -5"...
         "alpha: -4","alpha: -3","alpha: -2","alpha: -1","alpha: 0","alpha: 1",...
         "alpha: 2","alpha: 3","alpha: 4","alpha: 5","alpha: 6","alpha: 7"...
         "alpha: 8","alpha: 9","alpha: 10"];
%%
intv = size(runConsVals);
extraVars = "Flaps";
for i = 1:intv(1)
    runVal = i;
    RunCreate(fileNAME,runVal,NAMES(i),runCons,runConsVals(i,:), 100,extraVars);
end