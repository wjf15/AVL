function HeaderCreate(versionNum,MainFile)
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
    
   
    %Header
    fprintf(TextFile,formatComment,breaking);
    fprintf(TextFile,formatComment,title);
    fprintf(TextFile,formatVersion,versionNum);
    fprintf(TextFile,formatComment,breaking);
    fclose(TextFile)
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(MainFile,'at');
    assert(fid>=3,msg)
    fprintf(fid,'\n%s',st2);
    fclose(fid)
end




