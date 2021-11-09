function SubHeaderCreate(MainFile,versionNum,Mach,planesOfSym,refAreasV,locDefRef)
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
    
    %Entering
    breaking = '************************';
    titlesCom = 'Aerospace Engineering Capstone 402A';
    title = "AERSP 402A Bushplane V" + string(versionNum);
    symmetry = "IYsym   IZsym   Zsym";
    refAreas = "Sref   Cref   Bref";
    refLoc = "Xref   Yref   Zref";
    VortexData = "Nchord    CSpace  NSpan(o)   Sspace(o)";
    SecData = "Xle      Yle         Zle         Chord       Ainc    Nspanwise   Sspace";
    ConData = "name      gain         xhinge         xhv       yhv    zhv   SgnDup";
    
   
    %HeaderData
    fprintf(TextFile,formatText,title);
    fprintf(TextFile,formatComment,"Mach");
    fprintf(TextFile,formatVal, Mach);

    fprintf(TextFile,formatComment,symmetry);
    fprintf(TextFile,formatInt, planesOfSym);
    fprintf(TextFile,formatTab);

    fprintf(TextFile,formatComment,refAreas);
    fprintf(TextFile,formatRowVal, refAreasV);
    fprintf(TextFile,formatTab);

    fprintf(TextFile,formatComment,refLoc);
    fprintf(TextFile,formatRowVal, locDefRef);
    fprintf(TextFile,formatTab);

    
    %APPEND
    fclose(TextFile);
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(MainFile,'at');
    assert(fid>=3,msg)
    fprintf(fid,'%s\n',st2);

end




