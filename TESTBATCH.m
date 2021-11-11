clear
clc

%%
%edit area
%avl location is just executable location on laptop
avlLoc = "C:\AVL\avl.exe";
%Any arbitrary name
RUNNAME = 'NACATEST3';
%plane location in executable location on laptop
planefile = "C:\Users\User\Documents\Fall2021\402A\AVL\Planes\OURPLANE_AFNACA2412_Controls.avl";
%funfile location in executable location on laptop
runfile = "C:\Users\User\Documents\Fall2021\402A\AVL\RunFiles\OURPLANEV1alphas_15Flap.run";
%Location where batch file is created to. Edit file location but leave
%everything to the right of the last \
RunFile =  ['C:\Users\User\Documents\Fall2021\402A\AVL\Batches\' RUNNAME '.run'];
% Number of runs in the run file
runCount = 21;
%This is the location you want the folder to made into. Don't forget the \
%at the end!
makeFolderSt = 'C:\Users\User\Documents\Fall2021\402A\AVL\STfiles\';
makeFolderForce = 'C:\Users\User\Documents\Fall2021\402A\AVL\Forces\';
%%
%Don't need to edit
%This section actually runs avl in and outputs the files. The code will create a folder in your pc at the
%Make sure you
%delete the folder if you are rerunning something. The code doesn't like it
%when there is already a file existing. I can fix that at a later time.
%Also recommend
[status,results, foldNameForce] = createForceOut(avlLoc,RUNNAME,planefile, runfile, RunFile, runCount,makeFolderForce);
[statusST,resultsST, foldNameST] = createSTOut(avlLoc,RUNNAME,planefile, runfile, RunFile, runCount,makeFolderSt);

%
% foldNameForce = 'C:\Users\User\Documents\Fall2021\402A\AVL\Forces\NACATEST3';
% foldNameST = 'C:\Users\User\Documents\Fall2021\402A\AVL\STfiles\NACATEST3';

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
%Plot Examples
figure(1)
plot([run.alpha],[run.CL])
figure(2)
plot([run.alpha],[run.CD])



