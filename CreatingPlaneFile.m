fileNAME = 'Test.txt';
fileID = fopen(fileNAME,'w+');
fprintf(fileID,formatComment,breaking);
fclose(fileID);

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


%%
%Data for Header
versionNum = 1;
Mach = 0;
planesOfSym = [0, 0, 0]';       %"IYsym   IZsym   Zsym"
refAreasV = [8.1, 0.81, 10];    %"Area   Chord   Span"
locDefRef = [0.5,0,0];                %default location about which moments and rotation rates are defined

HeaderCreate(fileNAME,versionNum);
SubHeaderCreate(fileNAME,versionNum,Mach,planesOfSym,refAreasV,locDefRef);

%%
%Surface 1 Data
nameSurface = "Main Wing";
VorSurData = [6 1];        % Nchord    CSpace  NSpan(o)   Sspace(o)
yDub = 0;
translation = [0,0,0];

SurfaceCreate(fileNAME,nameSurface,VorSurData,yDub, translation)

%%
%Section 1.1 Data
SecXYZLoc = [0,0,0]; %xle yle zle
SecChord = 1; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);

%%
%Control 1.1.1
ConName = "flap";
ConGain = 1;
ConXHinge = 0.7;
Conhv = [0,0,0];
ConSgDup = 1;
                            %"name      gain         xhinge         xhv       yhv    zhv   SgnDup"
ControlDataVal = [ConGain, ConXHinge, Conhv];

ControlCreate(fileNAME, ConName,ControlDataVal, ConSgDup);

%%
%Section 1.2 Data
SecXYZLoc = [0.2,3.5,0]; %xle yle zle
SecChord = 0.8; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 7; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile

SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);

%%
%Control 1.2.1
ConName = "flap";
ConGain = 1;
ConXHinge = 0.7;
Conhv = [0,0,0];
ConSgDup = 1;
                            %"name      gain         xhinge         xhv       yhv    zhv   SgnDup"
ControlDataVal = [ConGain, ConXHinge, Conhv];

ControlCreate(fileNAME, ConName,ControlDataVal, ConSgDup);

%%
%Section 1.3
SecXYZLoc = [0.6,5,0]; %xle yle zle
SecChord = 0.4; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 0; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 0; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile

SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);


%%
%Surface 2 Data
nameSurface = "Horizontal Stabilizer";
VorSurData = [5 1];        % Nchord    CSpace  NSpan(o)   Sspace(o)
yDub = 0;
translation = [4.0,0,0];

SurfaceCreate(fileNAME,nameSurface,VorSurData,yDub, translation)

%%
%Section 2.1
SecXYZLoc = [0.6,0,0.9]; %xle yle zle
SecChord = 0.6; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 7; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 0; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(false, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);

%%
ConName = "elevator";
ConGain = 1;
ConXHinge = 0.6;
Conhv = [0,0,0];
ConSgDup = 1;
                            %"name      gain         xhinge         xhv       yhv    zhv   SgnDup"
ControlDataVal = [ConGain, ConXHinge, Conhv];

ControlCreate(fileNAME, ConName,ControlDataVal, ConSgDup);

%Section 2.2
SecXYZLoc = [0.8,1,0.9]; %xle yle zle
SecChord = 0.4; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 0; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 0; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(false, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile

SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);


ConName = "elevator";
ConGain = 1;
ConXHinge = 0.6;
Conhv = [0,0,0];
ConSgDup = 1;
ControlDataVal = [ConGain, ConXHinge, Conhv];
ControlCreate(fileNAME, ConName,ControlDataVal, ConSgDup);
