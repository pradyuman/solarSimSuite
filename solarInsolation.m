function energy = solarInsolation(lat, tilt, hr, day, rotate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Function Definition Line: function energy = solarInsolation(lat, tilt, hr, day)
%  
%
%  Inputs: list each input argument variable name and 
%          comment with units (as appropriate):
%  1. lat (latitude)
%  2. tilt (degrees)
%  3. hr (hours)
%  4. day
%
%  Outputs: list each output argument variable name and 
%           comment with units (as appropriate):
%  1. energy (kW / m^2)
%
%  Function Description: This function calculates solar insolation at a
%  particular location and day of the year.
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es): 
%  1. Ben Staniewicz bstaniew@purdue.edu
%  2. Pradyuman Vig pvig@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Michael Keller keller77@purdue.edu
%  2. Devashish Chopra chopra5@purdue.edu
%
%  Section #: 13     Team #: 18
%
%  Assignment: nanoHUB Simulation Suite
%
%  Academic Integrity Statement:
%       I/We have not used source code obtained from
%       any other unauthorized source, either modified
%       or unmodified.  Neither have I/we provided access
%       to my/our code to another. The project I/we am/are 
%       submitting is my/our own original work.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Re = 6371 * 10 ^3; %Radius of the earth(m)
Ra = 100 * 10 ^ 3; %Max. Altitude in the atmosphere (Kármán line) (m)
Rt = Re + Ra; %Total earth-atmospher radius

%Determine if it is rotating or not
%If there are 5 arguments, it is the special case of a rotating panel
%If there are 4 arguments, it is the normal case
if nargin == 4
    %Calculates declination angle
    declination = 23.45 * sind(360 / 365 * (284 + day));
    %Calculates length of the day
    dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination)));
    %Calculates energy
    energy = 10.436 * sind(90 - lat + declination + tilt) * sind(180 / dayLength * (hr - 12 + (dayLength / 2)));
    %Adjust for atmospheric effects
    theta = 180 / dayLength * (hr - 12 + (dayLength / 2));
    atmos = ((Re * cosd(theta + 90)) + sqrt(Rt ^ 2 - Re ^ 2 * (sind(theta + 90)^2)))/(Rt-Re);
    energy = energy / atmos;
    %If energy is negative, set energy to 0
    if energy <= 0
        energy = 0;
    end
else
    %Calculates declination angle
    declination = 23.45 * sind(360 / 365 * (284 + day));
    %Calculates length of the day
    dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination)));
    %Calculates energy
    energy = 10.436;
    %Adjust for atmospheric effects
    theta = 180 / dayLength * (hr - 12 + (dayLength / 2));
    atmos = ((Re * cosd(theta + 90)) + sqrt(Rt ^ 2 - Re ^ 2 * (sind(theta + 90)^2)))/(Rt-Re);
    energy = energy / atmos;
    %If energy is negative, set energy to 0
    if energy <= 0
        energy = 0;
    end
end
