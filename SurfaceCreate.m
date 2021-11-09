function SurfaceCreate(MainFile,nameSurface,VorSurData,yDub, translation)
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
    TranData = "dx dy dz";
    
   
    %SurfaceData
    fprintf(TextFile,formatText,"SURFACE");
    fprintf(TextFile,formatText,nameSurface);

    fprintf(TextFile,formatComment,VortexData);
    fprintf(TextFile,formatInt, VorSurData);
    fprintf(TextFile,formatTab);


    fprintf(TextFile,formatComment,"Y Duplication");
    fprintf(TextFile,formatText,"YDUPLICATE");
    fprintf(TextFile,formatY, yDub);
    fprintf(TextFile,formatTab);
    
    if translation(1) ~= 0 || translation(2) ~= 0 || translation(3) ~= 0
    fprintf(TextFile,formatText,"TRANSLATE");
    fprintf(TextFile,formatComment,TranData);
    fprintf(TextFile,formatRowVal, translation);
    fprintf(TextFile,formatTab);
    end


    
    %APPEND
    fclose(TextFile);
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(MainFile,'at');
    assert(fid>=3,msg)
    fprintf(fid,'%s\n',st2);

end




