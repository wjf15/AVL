function SectionCreate(MainFile,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor)
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
    
   
    %SectionData
    fprintf(TextFile,formatText,"SECTION");
    fprintf(TextFile,formatComment, SecData);
    fprintf(TextFile,formatRowVal, SecDataVal);
    fprintf(TextFile,formatInt, SecNumSVor);
    fprintf(TextFile,formatInt, SecSpaceSVor);
    fprintf(TextFile,formatTab);

if NACA 
    fprintf(TextFile,formatComment,"AIRFOIL");
    fprintf(TextFile,formatText,"NACA");
    fprintf(TextFile,formatNACA, SecAirFoil);
elseif afile
    fprintf(TextFile,formatComment,"AIRFOIL");
    fprintf(TextFile,formatText,"AFILE");
    fprintf(TextFile,formatFile, SecAirFoil);
end


    
    %APPEND
    fclose(TextFile);
    st2 = fileread('Delete.txt');
    [fid,msg] = fopen(MainFile,'at');
    assert(fid>=3,msg)
    fprintf(fid,'%s\n',st2);

end




