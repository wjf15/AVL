clear
clc

%%
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

%%
%Entering
breaking = '************************';
titlesCom = 'Aerospace Engineering Capstone 402A';
symmetry = "IYsym   IZsym   Zsym";
refAreas = "Sref   Cref   Bref";
refLoc = "Xref   Yref   Zref";
VortexData = "Nchord    CSpace  NSpan(o)   Sspace(o)";
SecData = "Xle      Yle         Zle         Chord       Ainc    Nspanwise   Sspace";
ConData = "name      gain         xhinge         xhv       yhv    zhv   SgnDup";

%%
%EDIT
fileNAME = 'C:\Users\User\Documents\Fall2021\402A\AVL\Planes\OURPLANE_AFNACA2412_Controls.avl';
fileID = fopen(fileNAME,'w+');
versionNum = 1;
title = "AERSP 402A Bushplane V" + string(versionNum) + ": NACA 2412: Controls";
%
fprintf(fileID,formatComment,breaking);
fclose(fileID);


%%
%Data for Header
Mach = 0;
planesOfSym = [0, 0, 0]';       %"IYsym   IZsym   Zsym"
refAreasV = [147, 4.2,35];    %"Area   Chord   Span"
locDefRef = [0,0,0];          %default location about which moments and rotation rates are defined

HeaderCreate(fileNAME,versionNum);
SubHeaderCreate(fileNAME,versionNum,Mach,planesOfSym,refAreasV,locDefRef);

%%
%Surface 1 Data
nameSurface = "Main Wing";
VorSurData = [6 1];        % Nchord    CSpace  NSpan(o)   Sspace(o)
yDup = 0;
translation = [0,0,0];

SurfaceCreate(fileNAME,nameSurface,VorSurData,yDup, translation)



%%
%Section 1.1 Data
SecXYZLoc = [0,0,0]; %xle yle zle
SecChord = 4.2; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);


ConName = "Flaps";
Gain = 1;
xhinge = 0.25;
xyzhvec = [0,0,0];
ConSgDup = 1;
ControlDataVal = [Gain, xhinge,xyzhvec];
ControlCreate(fileNAME, ConName,ControlDataVal, ConSgDup)

%%
%Section 1.2 Data
SecXYZLoc = [0,17.5,0]; %xle yle zle
SecChord = 4.2; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);

ConName = "Flaps";
Gain = 1;
xhinge = 0.25;
xyzhvec = [0,0,0];
ConSgDup = 1;
ControlDataVal = [Gain, xhinge,xyzhvec];
ControlCreate(fileNAME, ConName,ControlDataVal, ConSgDup)

%%
%Surface 2 Data
nameSurface = "Horizontal Stabilizer";
VorSurData = [6 1];        % Nchord    CSpace  NSpan(o)   Sspace(o)
yDup = 0;
translation = [22,0,0];

SurfaceCreate(fileNAME,nameSurface,VorSurData,yDup, translation)


%%
%Section 2.1 Data
SecXYZLoc = [0,0,0]; %xle yle zle
SecChord = 3.25; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);

%%
%Section 2.2 Data
SecXYZLoc = [0,3.25,0]; %xle yle zle
SecChord = 3.25; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(true, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);


%%
%Surface 3 Data
nameSurface = "Vertical Stabilizer";
VorSurData = [6 1];        % Nchord    CSpace  NSpan(o)   Sspace(o)
yDup = 0;
translation = [22,0,0];

VSurfaceCreate(fileNAME,nameSurface,VorSurData, translation)

%%
%Section 3.1 Data
SecXYZLoc = [0,0,0]; %xle yle zle
SecChord = 3.25; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(false, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);

%%
%Section 3.2 Data
SecXYZLoc = [1.25,0,5]; %xle yle zle
SecChord = 1; %Chord Length
SecIncAng = 0; %Angle of whole section
SecNumSVor = 8; %Number of span wise vortices ONlY IF NOT IN SURFACE DATA
SecSpaceSVor = 1; % Spanwise Spacing of Vortices ONlY IF NOT IN SURFACE DATA
[NACA, afile] = deal(false, false); %One must true
SecAirFoil = 2412; %4 or 5 digit number if NACA and file location if AFile
SecDataVal = [SecXYZLoc, SecChord, SecIncAng];

SectionCreate(fileNAME,SecDataVal,NACA,afile,SecAirFoil, SecNumSVor, SecSpaceSVor);