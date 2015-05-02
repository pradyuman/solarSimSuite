function varargout = citation(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es): 
%  1. Ben Staniewicz bstaniew@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Michael Keller keller77@purdue.edu
%  2. Devashish Chopra chopra5@purdue.edu
%  3. Pradyuman Vig pvig@purdue.edu
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
%  Program Description: This GUI displays the references used for all of
%  each GUI in the simulation suite. To ensure proper formatting, the
%  refernces are in the form of an image.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% CITATION MATLAB code for citation.fig
%      CITATION, by itself, creates a new CITATION or raises the existing
%      singleton*.
%
%      H = CITATION returns the handle to a new CITATION or the handle to
%      the existing singleton*.
%
%      CITATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CITATION.M with the given input arguments.
%
%      CITATION('Property','Value',...) creates a new CITATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before citation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to citation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help citation

% Last Modified by GUIDE v2.5 21-Apr-2015 00:41:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @citation_OpeningFcn, ...
                   'gui_OutputFcn',  @citation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before citation is made visible.
function citation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to citation (see VARARGIN)

% Choose default command line output for citation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes citation wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.refImg_ax); %Sets to current axes
imshow('citations.jpg');


% --- Outputs from this function are returned to the command line.
function varargout = citation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit_pb.
function exit_pb_Callback(hObject, eventdata, handles)
% hObject    handle to exit_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close citation %Close current window
