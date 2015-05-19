function [ output_args ] = startSimSuite( input_args )
%STARTSIMSUITE Summary of this function goes here
%   Detailed explanation goes here
addpath([cd,'/support/error']);
addpath([cd,'/support/help']);
addpath([cd,'/app/zipcode']);
addpath([cd,'/support/citations']);
addpath([cd,'/app/trains']);
addpath([cd,'/app/roads']);
addpath([cd,'/app/splash']);
addpath([cd,'/app/lightpole']);
addpath([cd,'/app/rotate']);
addpath([cd,'/app/functions']);
main
end

