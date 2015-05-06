function [num] = dayYear(month, day)
%Array of the days in each month corresponding to the number of the month
%in the year
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
%Calculates the number of the year
num = sum(daysInMonth(1:(month - 1))) + day;
end