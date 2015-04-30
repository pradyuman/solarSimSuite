function varargout = roadsGUI_bstaniew(varargin)
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
%  Program Description: This GUI receives user input for their zip code (5
%  digits), road width (m), the road length(km), the road width margins
%  (m, the distance on ea. side that has no solar panels), the number of
%  cars that pass the road in an hr, and the average speed of the cars
%  (m/s). Those are all input in the form of edit text boxes. There is also
%  a date input which is a drop down menu for month and day. 
%
%  A compute button is pushed and which plots energy generation throughout
%  the day for the sample day and throughout the year. This is calculated
%  by finding the amount of solar radiation that reaches the road based on
%  the road's dimensions and traffic. (more cars, slightly less light
%  reaches the road)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ROADSGUI_BSTANIEW M-file for roadsGUI_bstaniew.fig
%      ROADSGUI_BSTANIEW, by itself, creates a new ROADSGUI_BSTANIEW or raises the existing
%      singleton*.
%
%      H = ROADSGUI_BSTANIEW returns the handle to a new ROADSGUI_BSTANIEW or the handle to
%      the existing singleton*.
%
%      ROADSGUI_BSTANIEW('Property','Value',...) creates a new ROADSGUI_BSTANIEW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to roadsGUI_bstaniew_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ROADSGUI_BSTANIEW('CALLBACK') and ROADSGUI_BSTANIEW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ROADSGUI_BSTANIEW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help roadsGUI_bstaniew

% Last Modified by GUIDE v2.5 29-Apr-2015 19:07:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @roadsGUI_bstaniew_OpeningFcn, ...
                   'gui_OutputFcn',  @roadsGUI_bstaniew_OutputFcn, ...
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


% --- Executes just before roadsGUI_bstaniew is made visible.
function roadsGUI_bstaniew_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for roadsGUI_bstaniew
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes roadsGUI_bstaniew wait for user response (see UIRESUME)
% uiwait(handles.figure1);

if(~isempty(varargin)) %If input argument exists
    data = varargin{1}; %Set the variable 'data' to the input argument
    if(data(1) >= 0) %Activates if valid zip code is supplied
        set(handles.zipInput_et, 'String', sprintf('%05d', data(1))); %Updates zip code
    end %Ends if statement
    set(handles.day_pm, 'Value', data(2)); %Updates day
    set(handles.month_pm, 'Value', data(3)); %Updates month
    
end %Ends if statement
%Presetting for presentation purposes
 set(handles.widthInput_et, 'String', '7.4');
 set(handles.marginInput_et, 'String', '0.5');
 set(handles.lengthInput_et, 'String', '2');
 
 set(handles.trafficInput_et, 'String', '50');
 set(handles.carSpeed_et, 'String', '15');

% --- Outputs from this function are returned to the command line.
function varargout = roadsGUI_bstaniew_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in appHelp_pb.
function appHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to appHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('This GUI receives input of zip code, road width, road width margin, road length, traffic levels, and an example day. It then calculates the energy output for the example day and each month of the year and outputs these on to two graphs.');

% --- Executes on button press in openMenu_pb.
function openMenu_pb_Callback(hObject, eventdata, handles)
% hObject    handle to openMenu_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zipcode = str2num(get(handles.zipInput_et,'String')); %Gets zip code
if(isempty(zipcode)) %Activates if zip code is blank
    zipcode = -1; %Sets it to -1 if empty
end %Ends if statement
day = get(handles.day_pm, 'Value'); %Finds day
month = get(handles.month_pm, 'Value'); %Finds month
nanohubGUI_sec13_team18([zipcode day month]); %Sends zip, day, and month inputs to main menu so that it can output those to GUIs opened in the future
close roadsGUI_bstaniew; %Close current GUI

% --- Executes on button press in closeGUI_pb.
function closeGUI_pb_Callback(hObject, eventdata, handles)
% hObject    handle to closeGUI_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all; %Close current GUI

% --- Executes on selection change in day_pm.
function day_pm_Callback(hObject, eventdata, handles)
% hObject    handle to day_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns day_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from day_pm


% --- Executes during object creation, after setting all properties.
function day_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in month_pm.
function month_pm_Callback(hObject, eventdata, handles)
% hObject    handle to month_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns month_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from month_pm


% --- Executes during object creation, after setting all properties.
function month_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function widthInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to widthInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of widthInput_et as text
%        str2double(get(hObject,'String')) returns contents of widthInput_et as a double


% --- Executes during object creation, after setting all properties.
function widthInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lengthInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to lengthInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lengthInput_et as text
%        str2double(get(hObject,'String')) returns contents of lengthInput_et as a double


% --- Executes during object creation, after setting all properties.
function lengthInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lengthInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zipInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to zipInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zipInput_et as text
%        str2double(get(hObject,'String')) returns contents of zipInput_et as a double


% --- Executes during object creation, after setting all properties.
function zipInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zipInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dayMonthHelp_pb.
function dayMonthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to dayMonthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Find the day and month of the year using the drop down menus. Make sure that the day exists for the given month. ie.: February 31st does not exist.'); %Sends string of help message

% --- Executes on button press in zipHelp_pb.
function zipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to zipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Please enter your 5 digit zipcode. ie.: West Lafayette, IN = 47906.'); %Sends string of help message

% --- Executes on button press in widthHelp_pb.
function widthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to widthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Enter the width of the road width solar panels in meters. 1 lane is approximately 3.7 meters wide.'); %Sends string of help message

% --- Executes on button press in lengthHelp_pb.
function lengthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to lengthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Enter the length of the road with solar panels in kilometers.'); %Sends string of help message

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zip = str2num(get(handles.zipInput_et, 'String')); %Finds zip code
data = csvread('zipcode.csv'); %Imports list of zip codes and longitudes/latitudes
length = str2num(get(handles.lengthInput_et, 'String')); %Find road length
width = str2num(get(handles.widthInput_et, 'String')); %Find road width
margin = str2num(get(handles.marginInput_et, 'String')); %Find road margin
area = length * 1000 * (width - 2 * margin); %Calculate road area
day = get(handles.day_pm, 'Value') - 1; %Find the day of the month 
month = get(handles.month_pm, 'Value') - 1; %Find the month
traffic = str2num(get(handles.trafficInput_et, 'String')); %Find cars/hr
speed = abs(str2num(get(handles.carSpeed_et, 'String'))); %Find avrg speed
daysOfMonth = [31 28 31 30 31 30 31 31 30 31 30 31]; %Vector of the days in each month

if ~isempty(zip) %If there is a user input zip code
    [row, col] = find(data(:,1) == zip); %Find the index of the zip code
end %Ends if statement

% ------------ INPUT VALIDATION ---------------
if isempty(zip) | ~isscalar(zip) %If zip is not a scalar
    errorGUI_sec13_team18('Error! Please enter a valid zipcode'); %Open error menu
elseif isempty(width) | isempty(length) | isempty(margin) | isempty(traffic) | ~day | ~month | isempty(speed)
    errorGUI_sec13_team18('Error! All fields must have entries!'); %Open error menu
elseif ~isscalar(width) | ~isscalar(length) | ~isscalar(margin) | ~isscalar(traffic) | ~isscalar(speed)
    errorGUI_sec13_team18('Error! All edit text fields must have scalar inputs!'); %Open error menu
elseif isempty(row) | isempty(col) %If zip code is not found
    errorGUI_sec13_team18('Error! Zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.'); %Open error menu
elseif width < 3 %If width is too small to fit a car
    errorGUI_sec13_team18('Error! Road must be at least the width of one lane'); %Open error menu
elseif length <= 0 %If length is negative
    errorGUI_sec13_team18('Error! Length input must be positive!'); %Open error menu
elseif width - 2 * margin <= 0 %If margins are larger than width
    errorGUI_sec13_team18('Error! Margins must be less than 1/2 of the road width!'); %Open error menu
elseif traffic < 0 %If traffic is negative
    errorGUI_sec13_team18('Error! Traffic must be nonnegative!'); %Open error menu
elseif (speed == 0 & traffic ~= 0) %If speed is 0 but traffic is moving (logical contradiction)
    errorGUI_sec13_team18('Speed must be greater than 0 if traffic is nonzero'); %Open error menu
elseif length * 200 * speed < traffic %If roads are completely covered at all times
    errorGUI_sec13_team18('Error! Traffic cannot be so large that the roads are completely covered!'); %Open error menu
elseif daysOfMonth(month) < day %If day doesn't exist (Ex: February 31st)
    errorGUI_sec13_team18('Error! The day is not a day of the chosen month!'); %Open error menu
else %End Input validation
    
% -------------- CALCULATIONS -----------    
latitude = data(row, 2); %Find the latitude 
time = 0:23; %Create vector of hours of the day
efficiency = .14; %Estimated efficiency factor
day = dayYear(month, day); %Find day in the year (dec 31 is day 365)
timeCovered = length * 1000 / speed; %Amount of time that there are cars on the road (assuming continuous driving)
if timeCovered > 3600 %Max time is 1 hr
    timeCovered = 3600 %Sets to max time if over max
end %Ends if statement
area = length * 1000 * (width - 2 * margin) - (traffic * 9 * timeCovered) / (3600); %Calculates avrg area exposed to light

for k = 0:23 %For ea. hour of the day
    energy(k + 1) = area * solarInsolation(latitude, 0, k, day) * efficiency; %Calculate energy generated
    if energy(k + 1) < 0 %If negative energy (b/c sun is on other side of the world)
        energy(k + 1) = 0; %Energy is 0
    end %End if statement
end %End for loop

plot(handles.dayGraph_ax, time, energy); %Plot energy generation throughout the day
axis([0 24 0 1.1 * max(energy)]) %Set axes
set(handles.dayGraph_ax,'xtick',0:2:24); %Set x tick marks
xlabel(handles.dayGraph_ax,'Hour of the Day') %Add x axis title
ylabel(handles.dayGraph_ax,'Power Generation (kW)') %Add y axis title

for k = 0:11 %For each month of the year
    energy = []; %Energy is empty at the start of ea. iteration
    for j = 0:23 %For each hour of the day
        energy(j + 1) = efficiency * area * solarInsolation(latitude, 0, j, 30 * k + 15); %Calculate energy generated in the middle day of ea. month
        if energy(j + 1) < 0 %If energy is negative (b/c sun is on opp. side of the world)
            energy(j + 1) = 0; %Set energgy to 0
        end %End if statement
    end %End inner for loop
    avrgEnergy(k + 1) = mean(energy); %Calculate avrg energy for the month
end %End outer for loop

time = 1:12; %Create time vector for hrs of the day
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31]; %Create vector for days in each month
avrgEnergy = avrgEnergy .* daysInMonth; %Calculate energy in ea. month
plot(handles.yearGraph_ax, time, avrgEnergy); %Plot energy througohut the year
axis([1 12 0 1.1 * (max(avrgEnergy))]); %Change axes
set(handles.yearGraph_ax,'xtick',1:12); %Set xticks
xlabel(handles.yearGraph_ax,'Month of the year'); %Add x axis title
ylabel(handles.yearGraph_ax,'Total Monthly Energy Generation(kWh)'); %Add y axis title
end %End of input validation

% --- Executes on button press in reset_pb.
function reset_pb_Callback(hObject, eventdata, handles)
% hObject    handle to reset_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set edit text boxes to empty
set(handles.zipInput_et,'String','')
set(handles.widthInput_et,'String','')
set(handles.lengthInput_et,'String','')
set(handles.marginInput_et,'String','')
set(handles.trafficInput_et,'String','')
set(handles.carSpeed_et,'String','')
%Set drop down menus to defualt
set(handles.day_pm,'Value',1)
set(handles.month_pm,'Value',1)
%Reset plots
cla(handles.yearGraph_ax,'reset')
cla(handles.dayGraph_ax,'reset')


function marginInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to marginInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of marginInput_et as text
%        str2double(get(hObject,'String')) returns contents of marginInput_et as a double


% --- Executes during object creation, after setting all properties.
function marginInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to marginInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in marginsHelp_pb.
function marginsHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to marginsHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Please enter a positive road margin. The road margin is the length on each side of the road that does not contain any solar panels.');


function trafficInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to trafficInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trafficInput_et as text
%        str2double(get(hObject,'String')) returns contents of trafficInput_et as a double


% --- Executes during object creation, after setting all properties.
function trafficInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trafficInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in trafficHelp_pb.
function trafficHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to trafficHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Enter the average number of cars that pass over this road in one hour. About 50 cars pass over a medium sized two lane road in an hour.');



function carSpeed_et_Callback(hObject, eventdata, handles)
% hObject    handle to carSpeed_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carSpeed_et as text
%        str2double(get(hObject,'String')) returns contents of carSpeed_et as a double


% --- Executes during object creation, after setting all properties.
function carSpeed_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carSpeed_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in speedHelp_pb.
function speedHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to speedHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpGUI_sec13_team18('Enter the expected average speed of cars on this road in meters per second. 1 m/s = 3.6 kph ~ 2.2369 mph.');
