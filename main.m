function varargout = nanohubGUI_sec13_team18(varargin)
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
%  Program Description: This set of GUIs can be accessed by typing in the 
%  file name. This will open up a main menu (this GUI). This GUI has links
%  to access the 4 sub GUIs, a help page, and a references page. Each of
%  the sub GUIs is a different application of solar panels. The 4
%  applications are as follows: use on the roof of a train, solar panels in
%  roadways, around lightpoles, and ones that rotate and face towards the
%  sun. It is intended that the name alone will be used to start this GUI.
%  However, sub GUIs may pass data to this one through an input argument
%  which this can then pass to the individual GUIs when opened.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%NANOHUBGUI_SEC13_TEAM18 M-file for nanohubGUI_sec13_team18.fig
%      NANOHUBGUI_SEC13_TEAM18, by itself, creates a new NANOHUBGUI_SEC13_TEAM18 or raises the existing
%      singleton*.
%
%      H = NANOHUBGUI_SEC13_TEAM18 returns the handle to a new NANOHUBGUI_SEC13_TEAM18 or the handle to
%      the existing singleton*.
%
%      NANOHUBGUI_SEC13_TEAM18('Property','Value',...) creates a new NANOHUBGUI_SEC13_TEAM18 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to nanohubGUI_sec13_team18_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      NANOHUBGUI_SEC13_TEAM18('CALLBACK') and NANOHUBGUI_SEC13_TEAM18('CALLBACK',hObject,...) call the
%      local function named CALLBACK in NANOHUBGUI_SEC13_TEAM18.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nanohubGUI_sec13_team18

% Last Modified by GUIDE v2.5 30-Apr-2015 07:26:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nanohubGUI_sec13_team18_OpeningFcn, ...
                   'gui_OutputFcn',  @nanohubGUI_sec13_team18_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before nanohubGUI_sec13_team18 is made visible.
function nanohubGUI_sec13_team18_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for nanohubGUI_sec13_team18
handles.output = hObject;

if(~isempty(varargin)) %Activates only if there is an input argument
    data = varargin{1}; %Saves input argument
    if(length(data) == 3) %Activates if input is not empty
        handles.inputData = varargin{1}; %Assigns the input to the handles structure
    end %Ends if statement
else %Activates if varargin is empty
    handles.inputData = []; %Assigns the variable in handles to be empty
end %Ends if statement

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nanohubGUI_sec13_team18 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = nanohubGUI_sec13_team18_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in train_pb.
function train_pb_Callback(hObject, eventdata, handles)
% hObject    handle to train_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.inputData) %If there is previous user data stored
    trainsGUI_pvig(handles.inputData); %Open sub GUI with user input data
else %Activates if there is no input data
    trainsGUI_pvig; %Open sub GUI without user input data
end %Ends if else statements
close nanohubGUI_sec13_team18; %Closes main menu

% --- Executes on button press in road_pb.
function road_pb_Callback(hObject, eventdata, handles)
% hObject    handle to road_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.inputData) %If there is previous user data stored
    roadsGUI_bstaniew(handles.inputData); %Open sub GUI with user input data
else %Activates if there is no input data
    roadsGUI_bstaniew; %Open sub GUI without user input data
end %Ends if else statements
close nanohubGUI_sec13_team18; %Closes main menu

% --- Executes on button press in light_pb.
function light_pb_Callback(hObject, eventdata, handles)
% hObject    handle to light_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.inputData) %If there is previous user data stored
    lightpoleGUI_keller77(handles.inputData); %Opens sub GUI with user input data
else %Activates if there is no input data
    lightpoleGUI_keller77; %Opens sub GUI without user input data
end %Ends if else statement
close nanohubGUI_sec13_team18; %Closes main menu

% --- Executes on button press in rotate_pb.
function rotate_pb_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.inputData) %If there is previous user data stored
    rotateGUI_chopra5(handles.inputData); %Opens sub GUI with user input data
else %activates if there is no input data
    rotateGUI_chopra5; %Opens sub GUI without user input data
end %Ends if else statement
close nanohubGUI_sec13_team18; %Closes main menu

% --- Executes on button press in moreAbout_pb.
function moreAbout_pb_Callback(hObject, eventdata, handles)
% hObject    handle to moreAbout_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
descMessage = 'This GUI has links to access the 4 sub GUIs, a help page, and a references page. Each of the sub GUIs is a different application of solar panels. The 4 applications are as follows: use on the roof of a train, solar panels in roadways, around lightpoles, and ones that rotate and face towards the sun. ';
inputMessage = 'Direct user: Research and development companies such as 3M and Siemens. ';
outputMessage = 'Goal of the simulation suite: to allow such companies to model renewable energy applications for use of their many customers.';
mathMessage =  'By using this simulation suite, they could quickly determine if a certain application is feasible for the customer based on factors such as geographical location and current infrastructure (road size, train size, etc.)';
appHelpGUI_sec13_team18(descMessage, inputMessage, outputMessage, mathMessage);

% --- Executes on button press in references_pb.
function references_pb_Callback(hObject, eventdata, handles)
% hObject    handle to references_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
citationGUI_sec13_team18; %Opens a window with the references used


% --- Executes on button press in close_pb.
function close_pb_Callback(hObject, eventdata, handles)
% hObject    handle to close_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all; %Closes any open GUIs


% --- Executes on button press in mathMod_pb.
function mathMod_pb_Callback(hObject, eventdata, handles)
% hObject    handle to mathMod_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
descMessage = 'There are two main calculations that are used in all GUIs in addition to individual calculations that are unique to each GUI';
inputMessage = 'Latitude is used for all of the calculations. This is determined by a user input zip code (limited to US)';
outputMessage = 'This is found by using a csv file with approximately 50,000 US zip codes. Matlab then searches this file for the zip code and finds the associated latitude.';
mathMessage =  'solarInsolation: This function first calculates the length of the day, then the declination angle, and then accounts for atmospheric effects. dayLength = 2 / 15 * acosd(-1 *(sind(lat)*sind(declination))/(cosd(lat) * cosd(declination))); declination = 23.45 * sind(360 / 365 * (284 + day)); energy = 10.436 * sind(90 - lat + declination + tilt) * sind(180 / dayLength * (hr - 12 + (dayLength / 2))); These can all be derived from geometry and are experimentally verified.';
appHelpGUI_sec13_team18(descMessage, inputMessage, outputMessage, mathMessage);