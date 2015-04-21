function [num] = dayYear(month, day)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Function Definition Line: function energy = solarInsolation(lat, tilt, hr, day)
%  
%
%  Inputs: list each input argument variable name and 
%          comment with units (as appropriate):
%  1. month
%  2. day
%
%  Outputs: list each output argument variable name and 
%           comment with units (as appropriate):
%  1. [num] Day of the Year (December 31 - 365)
%
%  Function Description: This function calculates the day of the year given
%  the month and the day (does not account for leap years)
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
%Array of the days in each month corresponding to the number of the month
%in the year
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
%Calculates the number of the year
num = sum(daysInMonth(1:(month - 1))) + day;
end