clear
clc
%The folders that contain the force and St data. Create using the
%ExacutionAVL.m file!
foldNameForce = 'C:\Users\User\Documents\Fall2021\402A\AVL\Forces\NACATEST3';
foldNameST = 'C:\Users\User\Documents\Fall2021\402A\AVL\STfiles\NACATEST3';
OutputExcel = true;
locationOfExcelFile = 'C:\Users\User\Documents\Fall2021\402A\AVL\ExcelOutputs\';
nameOfExcelFile = 'NACATEST3';
runCount = 21;


%Ignore this for loop unless you want more data than just the onces listed
%below
for i = 1:runCount
    fileIDForce = [foldNameForce '\run' num2str(i)  '.ft'];
    fileIDHn = [foldNameST '\run' num2str(i)  '.st'];
    run(i).run = i;
    run(i).alpha = parseFTDATA(strcat(fileIDForce), 'Alpha');
    run(i).flaps = parseFTDATA(strcat(fileIDForce), 'Flaps');
    run(i).CL = parseFTDATA(strcat(fileIDForce), 'CLtot');
    run(i).CD = parseFTDATA(strcat(fileIDForce), 'CDtot');
    run(i).hn = parseSTDATA(strcat(fileIDHn), 'Xnp');
end
runTable = struct2table(run);
if OutputExcel
    filename = [locationOfExcelFile nameOfExcelFile '.xlsx'];
    writetable(runTable,filename)
end
%Plot Examples
figure(1)
plot([run.alpha],[run.CL])
figure(2)
plot([run.alpha],[run.CD])