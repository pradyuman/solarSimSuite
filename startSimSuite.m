function [ output_args ] = startSimSuite( input_args )
%STARTSIMSUITE Summary of this function goes here
%   Detailed explanation goes here
addpath([cd,'/error']);
addpath([cd,'/help']);
addpath([cd,'/zipcodes']);
addpath([cd,'/citations']);
addpath([cd,'/trains']);
addpath([cd,'/roads']);
addpath([cd,'/main']);
addpath([cd,'/lightpoles']);
addpath([cd,'/rotate']);
addpath([cd,'/functions']);
main
end

