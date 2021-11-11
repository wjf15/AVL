function RunCreate(RunFile,CaseNum,CaseName,runCons,runConsVals,vel,extraVars)
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
    runVars = ["alpha","beta","pb/2V","qc/2V","rb/2V",extraVars];
    Test = [runVars;runCons; runConsVals];
    VELConst = ["velocity", vel; "grav.acc.",32.17]';
    class(CaseNum)
    %SurfaceData
    
    fprintf(TextFile,runbreak);
    fprintf(TextFile,formatTab);
    fprintf(TextFile,formatRun, CaseNum);
    fprintf(TextFile,formatFile, CaseName);
    fprintf(TextFile,formatTab);
    fprintf(TextFile,formatRunVar, Test);
    fprintf(TextFile,formatTab);
    fprintf(TextFile,formatConstants, VELConst);

    
    %APPEND
    fclose(TextFile);
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(RunFile,'at');
    assert(fid>=3,msg)
    fprintf(fid,'%s\n',st2);

end




