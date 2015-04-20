function energy = solarInsolation(lat, tilt, hr, day)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es): Michael Keller Pradyuman Vig
%  Devashish and Ben
%  1. , keller77@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Name login@purdue.edu
%
%  Section #: 13     Team #:18
%  Assignment: nanoHUB Simulation Suite
%
%  Academic Integrity Statement:
%       I/We have not used source code obtained from
%       any other unauthorized source, either modified
%       or unmodified.  Neither have I/we provided access
%       to my/our code to another. The project I/we am/are 
%       submitting is my/our own original work.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

declination = 23.45 * sind(360 / 365 * (284 + day));
dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination)));
energy = 10.436 * sind(90 - lat + declination + tilt) * sind(180 / dayLength * (hr - 12 + (dayLength / 2)));
if energy > 0
else
    energy = 0;
end
end
