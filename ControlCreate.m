function ControlCreate(MainFile, ConName,ControlDataVal, ConSgDup)
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
    symmetry = "IYsym   IZsym   Zsym";
    refAreas = "Sref   Cref   Bref";
    refLoc = "Xref   Yref   Zref";
    VortexData = "Nchord    CSpace  NSpan(o)   Sspace(o)";
    SecData = "Xle      Yle         Zle         Chord       Ainc    Nspanwise   Sspace";
    ConData = "name      gain         xhinge         xhv       yhv    zhv   SgnDup";
    
    %ControlData
    fprintf(TextFile,formatText,"CONTROL");
    fprintf(TextFile,formatComment, ConData);
    fprintf(TextFile,formatControl, ConName);
    fprintf(TextFile,formatRowVal, ControlDataVal);
    fprintf(TextFile,formatInt, ConSgDup);


    
    %APPEND
    fclose(TextFile);
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(MainFile,'at');
    assert(fid>=3,msg)
    fprintf(fid,'%s\n',st2);

end




