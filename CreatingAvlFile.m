fileID = fopen('Test.txt','w');
%%Values
%Data for Header
versionNum = 1;
Mach = 0;
planesOfSym = [0, 0, 0]';       %"IYsym   IZsym   Zsym"
refAreasV = [8.1, 0.81, 10];    %"Area   Chord   Span"
locDefRef = [0.5,0,0];                %default location about which moments and rotation rates are defined

%Surface Data
nameSurface = "Main Wing";
VorSurData = [6 1];        % Nchord    CSpace  NSpan(o)   Sspace(o)
yDub = 0;

%Section Data
SecXYZLoc = [0,0,0]; %xle yle zle
SecChord = 1; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
SecDataVal = [SecXYZLoc, SecChord, SecIncAng, SecNumSVor, SecSpaceSVor];
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile

ConName = "elevator";
ConGain = 1;
ConXHinge = 0.6;
Conhv = [0,0,0];
ConSgDup = 1;
                            %"name      gain         xhinge         xhv       yhv    zhv   SgnDup"
ControlDataVal = [ConGain, ConXHinge, Conhv, ConSgDup];



%%Header Data
%Formats
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
fprintf(fileID,formatComment,breaking);
fprintf(fileID,formatComment,title);
fprintf(fileID,formatVersion,versionNum);
fprintf(fileID,formatComment,breaking);

%HeaderData
fprintf(fileID,formatText,title);
fprintf(fileID,formatComment,"Mach");
fprintf(fileID,formatVal, Mach)

fprintf(fileID,formatComment,symmetry);
fprintf(fileID,formatInt, planesOfSym);
fprintf(fileID,formatTab);

fprintf(fileID,formatComment,refAreas);
fprintf(fileID,formatRowVal, refAreasV);
fprintf(fileID,formatTab);

fprintf(fileID,formatComment,refLoc);
fprintf(fileID,formatRowVal, locDefRef);
fprintf(fileID,formatTab);

fprintf(fileID,formatTab);
fprintf(fileID,formatComment,breaking);
%SurfaceData
fprintf(fileID,formatText,"SURFACE");
fprintf(fileID,formatText,nameSurface);

fprintf(fileID,formatComment,VortexData);
fprintf(fileID,formatInt, VorSurData);
fprintf(fileID,formatTab);

if yDub ~= 0 
    fprintf(fileID,formatComment,"Y Duplication");
    fprintf(fileID,formatText,"YDUPLICATE");
    fprintf(fileID,formatRowVal, yDub);
    fprintf(fileID,formatTab);
end

fprintf(fileID,formatComment,breaking);
%SectionData
fprintf(fileID,formatText,"SECTION");
fprintf(fileID,formatComment, SecData);
fprintf(fileID,formatRowVal, SecDataVal);
fprintf(fileID,formatTab);

if NACA 
    fprintf(fileID,formatComment,"AIRFOIL");
    fprintf(fileID,formatText,"NACA");
    fprintf(fileID,formatNACA, SecAirFoil);
    fprintf(fileID,formatTab);
elseif afile
    fprintf(fileID,formatComment,"AIRFOIL");
    fprintf(fileID,formatText,"AFILE");
    fprintf(fileID,formatFile, SecAirFoil);
    fprintf(fileID,formatTab);
end

% %ControlData
% fprintf(fileID,formatText,"CONTROL");
% fprintf(fileID,formatComment, SecData);
% fprintf(fileID,formatControl, ConName);
% fprintf(fileID,formatRowVal, ControlDataVal);
% fprintf(fileID,formatTab);




%Section Data
SecXYZLoc = [0.5,0,0]; %xle yle zle
SecChord = 0.8; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
SecDataVal = [SecXYZLoc, SecChord, SecIncAng, SecNumSVor, SecSpaceSVor];
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile

ConName = "elevator";
ConGain = 1;
ConXHinge = 0.6;
Conhv = [0,0,0];
ConSgDup = 1;

fprintf(fileID,formatComment,breaking);
%SectionData
fprintf(fileID,formatTab);

fprintf(fileID,formatText,"SECTION");
fprintf(fileID,formatComment, SecData);
fprintf(fileID,formatRowVal, SecDataVal);
fprintf(fileID,formatTab);

if NACA 
    fprintf(fileID,formatComment,"AIRFOIL");
    fprintf(fileID,formatText,"NACA");
    fprintf(fileID,formatNACA, SecAirFoil);
    fprintf(fileID,formatTab);
elseif afile
    fprintf(fileID,formatComment,"AIRFOIL");
    fprintf(fileID,formatText,"AFILE");
    fprintf(fileID,formatFile, SecAirFoil);
    fprintf(fileID,formatTab);
end

% %ControlData
% fprintf(fileID,formatText,"CONTROL");
% fprintf(fileID,formatComment, SecData);
% fprintf(fileID,formatControl, ConName);
% fprintf(fileID,formatRowVal, ControlDataVal);
% fprintf(fileID,formatTab);

%fprintf(fileID,formatText,"END");
fclose(fileID)