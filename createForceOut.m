function [status,results, foldName] = createForceOut(avlLoc,RUNNAME,planefile, runfile, RunFile, runCount,makefolder)
    %Formats
    TextFile = fopen('Delete.txt','w');
    
    formatComment = '! %s \n';
    formatVersion = '! Version:  %d \n';
    formatText = '%s \n';
    formatVal = '%1.3f \n';
    formatInt = '%d     ';
    formatY = '%1.1f';
    formatNACA = '%4.0f \n';
    formatFile = '%s\n';
    formatRowVal = '%1.3f   ';
    formatControl =  '%s    ';
    formatTab = '\n';
    formatRun = 'Run case %d :  ';
    formatRunVar = '%s      ->  %s      =   %2.5f \n';
    formatConstants = '%s       =      %2.5f \n';
    
    %Entering
    breaking = '************************';
    runbreak = '----------------------------';
    titlesCom = 'Aerospace Engineering Capstone 402A';
    symmetry = "IYsym   IZsym   Zsym";
    refAreas = "Sref   Cref   Bref";
    refLoc = "Xref   Yref   Zref";
    VortexData = "Nchord    CSpace  NSpan(o)   Sspace(o)";
    SecData = "Xle      Yle         Zle         Chord       Ainc    Nspanwise   Sspace";
    ConData = "name      gain         xhinge         xhv       yhv    zhv   SgnDup";
    TranData = "dx dy dz";
    runVars = ["alpha","beta","pb/2V","qc/2V","rb/2V"];
    
    %%
    fprintf(TextFile,'LOAD %s\n',planefile);
    fprintf(TextFile,'%s\n',    'OPER');
    fprintf(TextFile,'%s\n',    'f');
    fprintf(TextFile,'%s\n',    runfile);
    foldName = [makefolder char(RUNNAME)];
    
    mkdir(string(foldName))
    for i=1:runCount
        fprintf(TextFile,'%d\n',    i);
        fprintf(TextFile,'%s\n',    'x');
        fprintf(TextFile,'%s\n',    'ft');
        title = [foldName '\run' num2str(i)  '.ft'];
        fprintf(TextFile,'%s\n',    title);
    end
    
    
    fprintf(TextFile,'%s\n',    '');
    fprintf(TextFile,'%s\n',    'Quit\n');
    
    
    %APPEND
    fclose(TextFile);
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(RunFile,'w');
    assert(fid>=3,msg)
    fprintf(fid,'%s\n',st2);
    
    [status,results] = dos(strcat(avlLoc, ' < ', RunFile));

end