function [num] = dayYear(month, day)
    daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
    num = sum(daysInMonth(1:(month - 1))) + day;
end