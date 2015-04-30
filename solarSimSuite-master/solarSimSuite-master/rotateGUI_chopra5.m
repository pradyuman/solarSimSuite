function varargout = rotateGUI_chopra5(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es): 
%  1. Devashish Chopra chopra5@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Michael Keller keller77@purdue.edu
%  2. Ben Staniewicz bstaniew@purdue.edu
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
%  Program Description: This GUI takes a solar panel's dimension, location
%  (zip code) and day. It then graphs the energy generation throughout the 
%  day for both a stationary and rotating solar panel. The rotating solar 
%  panel moves and always looks directly at the sun. It also plots the 
%  energy generation of this throughout the year.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ROTATEGUI_CHOPRA5 M-file for rotateGUI_chopra5.fig
%      ROTATEGUI_CHOPRA5, by itself, creates a new ROTATEGUI_CHOPRA5 or raises the existing
%      singleton*.
%
%      H = ROTATEGUI_CHOPRA5 returns the handle to a new ROTATEGUI_CHOPRA5 or the handle to
%      the existing singleton*.
%
%      ROTATEGUI_CHOPRA5('Property','Value',...) creates a new ROTATEGUI_CHOPRA5 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to rotateGUI_chopra5_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ROTATEGUI_CHOPRA5('CALLBACK') and ROTATEGUI_CHOPRA5('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ROTATEGUI_CHOPRA5.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rotateGUI_chopra5

% Last Modified by GUIDE v2.5 29-Apr-2015 22:26:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rotateGUI_chopra5_OpeningFcn, ...
                   'gui_OutputFcn',  @rotateGUI_chopra5_OutputFcn, ...
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


% --- Executes just before rotateGUI_chopra5 is made visible.
function rotateGUI_chopra5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for rotateGUI_chopra5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rotateGUI_chopra5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Set previously entered values on to the GUI
if(~isempty(varargin)) %Activate if there is an input argument
    data = varargin{1}; %Makes input data vector
    if(data(1) >= 0) %If there is a zipcode
        set(handles.zipInput_et, 'String', sprintf('%05d', data(1))); %Display the zip code
    end %End if statement
    set(handles.day_pm, 'Value', data(2)); %Set edit text box
    set(handles.month_pm, 'Value', data(3)); %Set edit text box
end %End if statement

%Presetting values for presentation purposes
set(handles.widthInput_et, 'String', '2');
set(handles.lengthInput_et, 'String', '3');
set(handles.angleUpDownInput_et, 'String', '30');
set(handles.panelEff_et, 'String', '14');
set(handles.numPanels_et, 'String', '1');

% --- Outputs from this function are returned to the command line.
function varargout = rotateGUI_chopra5_OutputFcn(hObject, eventdata, handles)
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
helpGUI_sec13_team18('This GUI takes a solar panel''s dimension, location(zip code) and day. It then graphs the energy generation throughout the day for both a stationary and rotating solar panel. The rotating solar panel moves and always looks directly at the sun. It also plots the energy generation of this throughout the year.')

% --- Executes on button press in openMenu_pb.
function openMenu_pb_Callback(hObject, eventdata, handles)
% hObject    handle to openMenu_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Output data to main menu to be used by other GUIs
zipcode = str2num(get(handles.zipInput_et,'String')); %Find zip code
if(isempty(zipcode)) %If there is no zip entered
    zipcode = -1; %Set zip to -1 if it hasn't been entered
end %End if statement
day = get(handles.day_pm, 'Value'); %Find day
month = get(handles.month_pm, 'Value'); %Find month
nanohubGUI_sec13_team18([zipcode day month]); %Open main with data
close rotateGUI_chopra5 %Close current GUI

% --- Executes on button press in closeGUI_pb.
function closeGUI_pb_Callback(hObject, eventdata, handles)
% hObject    handle to closeGUI_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close rotateGUI_chopra5

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
function dayMonthHelp_pb_Callback(hObject, eventdata, ~)
% hObject    handle to dayMonthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Enter the date and month in the provided area') %Open help menu

% --- Executes on button press in zipHelp_pb.
function zipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to zipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Type in your 5 digit US postal code (ex: 47906)'); %Open help menu


% --- Executes on button press in widthHelp_pb.
function widthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to widthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Enter your solar panel width in either feet or meters. The units can be adjusted using the popup menu to the right'); %Open help menu

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zip = str2num(get(handles.zipInput_et, 'String')); %Find zip code
data = csvread('zipcode.csv'); %Create zip, lat, and longitude matrix
if get(handles.lengthUnit_pm, 'Value') == 1
    length = str2num(get(handles.lengthInput_et, 'String')); %Find length (in meters)
else
    length = .3048 * str2num(get(handles.lengthInput_et, 'String')); %Find length (in meters)
end
if get(handles.widthUnit_pm, 'Value') == 1
    width = str2num(get(handles.widthInput_et, 'String')); %Find width (in meters)
else
    width = .3048 * str2num(get(handles.widthInput_et, 'String')); %Find width (in meters)
end
tilt = str2num(get(handles.angleUpDownInput_et ,'String')); %Find angle of panel
day = get(handles.day_pm, 'Value') - 1; %Find day of the month
month = get(handles.month_pm, 'Value') - 1; %Find month
efficiency = str2num(get(handles.panelEff_et, 'String')) / 100;
numPanels = str2num(get(handles.numPanels_et, 'String'));

daysOfMonth = [31 28 31 30 31 30 31 31 30 31 30 31]; %Create vector of days in ea. month
area = length * width * numPanels; %Find the area of all panels

if ~isempty(zip) %If there is a zip code
    [row, col] = find(data(:,1) == zip); %Find index that zip is located
end %End if statement

%------------------ INPUT VALIDATION ----------------------
if isempty(zip) | ~isscalar(zip) %If zip is not a scalar
    errorGUI_sec13_team18('Error! Please enter a valid zipcode'); %Open error menu
elseif isempty(width) | isempty(length) | isempty(tilt) | ~day | ~month | isempty(numPanels) | isempty(efficiency)
    errorGUI_sec13_team18('Error! All fields must have entries!'); %Open error menu
elseif ~isscalar(width) | ~isscalar(length) | ~isscalar(tilt) | ~isscalar(numPanels) | ~isscalar(efficiency)
    errorGUI_sec13_team18('Error! All edit text fields must have scalar inputs!'); %Open error menu
elseif isempty(row) | isempty(col) %If zip code is not found
    errorGUI_sec13_team18('Error! Zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.'); %Open error menu
elseif width <= 0 | length <= 0 | numPanels <= 0
    errorGUI_sec13_team18('Error! Length and width must be positive!');
elseif efficiency > 1 | efficiency <= 0
    errorGUI_sec13_team18('Error! Efficiency must be less than or equal to 100% and greater than 0%');
elseif tilt > 90 | tilt < -90
    errorGUI_sec13_team18('Error! Angle must be between -90 and 90 degrees. -90 degrees is when the panel faces south, 0 when it faces to the sky, and 90 when it faces directly north');
elseif daysOfMonth(month) < day %If day doesn't exist (Ex: February 31st)
    errorGUI_sec13_team18('Error! The day is not a day of the chosen month!'); %Open error menu
else %End Input validation
   
% ------------ CALCULATIONS -------------
latitude = data(row, 2); %Find latitude
time = 0:23; %Create hours of day vector
day = dayYear(month, day); %Finds day of the year (Dec 31 = 365)

for k = 0:23 %For ea. hour of the day
    energyRot(k + 1) = area * solarInsolation(latitude, 0, k, day, 'rotate') * efficiency; %Calculate energy of rotating pane;
    if energyRot(k + 1) == 0 
        energyRot(k + 1) = 0; %If negative (because of sun on opp. side of world) energy is 0
    end
    energyStat(k + 1) = area * solarInsolation(latitude, tilt, k, day) * efficiency; %Calculate energy of stationary panel
    if energyStat(k + 1) < 0
        energyStat(k + 1) = 0; %If negative (because of sun on opp. side of world) energy is 0
    end
end

cla(handles.dayGraph_ax,'reset') %Clears graph
plot(handles.dayGraph_ax, time, energyStat,'g'); %Plots energy throughout the day
hold(handles.dayGraph_ax, 'on') %Holds current plot
plot(handles.dayGraph_ax, time, energyRot,'r'); %Plots rotating panel on same graph
axis([0 24 0 1.1 * max(energyStat)]) %Sets axes
set(handles.dayGraph_ax,'xtick',0:2:24); %Sets x tick marks
xlabel(handles.dayGraph_ax,'Hour of the day', 'FontSize', 9) %Adds x axis title
ylabel(handles.dayGraph_ax,'Power Generation (kW)') %Adds y axis title
legend(handles.dayGraph_ax,'Stationary', 'Rotating', 'location', 'NE'); %Adds legend

for k = 0:11 %For ea. month of the year
    energyRot = []; %Resets energy each iteration
    for j = 0:23 %For each hour of the day
        energyRot(j + 1) = efficiency * area * solarInsolation(latitude, 0, j, 30 * k + 15, 'rotate'); %Calculates energy (stationary)
        energyStat(j + 1) = efficiency * area * solarInsolation(latitude, tilt, j, 30 * k + 15); %Calculates energy (rotating)
        if energyRot(j + 1) < 0
            energyRot(j + 1) = 0; %If negative, sets to 0
        end
        if energyStat(j + 1) < 0
            energyStat(j + 1) = 0; %If negative, sets to 0
        end
    end
    avrgEnergyRot(k + 1) = mean(energyRot); %Sets avrg as the average of that day
    avrgEnergyStat(k + 1) = mean(energyStat); %Sets avrg as the average of that day
end

cla(handles.yearGraph_ax,'reset') %Clears graph
time = 1:12; %Creates vector of months of the year
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31]; %Creates days in month vector
avrgEnergyRot = avrgEnergyRot .* daysInMonth; %Calculates total energy in a month
avrgEnergyStat = avrgEnergyStat .* daysInMonth; %Calculates total energy in a month
plot(handles.yearGraph_ax, time, avrgEnergyStat, 'g'); %Plot monthly energy for stat
hold on
plot(handles.yearGraph_ax, time, avrgEnergyRot, 'r'); %Plots total monthly energy
axis([1 12 0 1.5 * max((max(avrgEnergyRot)), (max(avrgEnergyStat)))]); %Sets axis
set(handles.yearGraph_ax,'xtick',1:12); %Sets x tick marks
xlabel(handles.yearGraph_ax,'Month of the year', 'FontSize', 9); %Adds x axis title
ylabel(handles.yearGraph_ax,'Total Monthly Energy Generation(kWh)'); %Sets y axis title
legend(handles.yearGraph_ax,'Stationary', 'Rotating', 'location', 'NE'); %Adds legend
set(handles.yearGraph_ax,'xticklabel',['Jan'; 'Feb'; 'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'])
end %Ends input validation

% --- Executes on button press in updateLoc_pb.
function updateLoc_pb_Callback(hObject, eventdata, handles)
% hObject    handle to updateLoc_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset_pb.
function reset_pb_Callback(hObject, eventdata, handles)
% hObject    handle to reset_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Resetting edit text values to blank
set(handles.zipInput_et,'String','')
set(handles.widthInput_et,'String','')
set(handles.lengthInput_et,'String','')
set(handles.angleUpDownInput_et,'String','')
set(handles.panelEff_et,'String','')
set(handles.numPanels_et,'String','')
%Resetting month/day values to 1 ("Enter Day" | "Enter Month")
set(handles.day_pm,'Value',1)
set(handles.month_pm,'Value',1)
%Resetting axes to blank
cla(handles.yearGraph_ax,'reset')
cla(handles.dayGraph_ax,'reset')

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


% --- Executes on button press in lengthHelp_pb.
function lengthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to lengthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Enter your solar panel length in either feet or meters. The units can be adjusted using the popup menu to the right') %Open help menu


function angleUpDownInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to angleUpDownInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angleUpDownInput_et as text
%        str2double(get(hObject,'String')) returns contents of angleUpDownInput_et as a double


% --- Executes during object creation, after setting all properties.
function angleUpDownInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleUpDownInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in angleUpDownHelp_pb.
function angleUpDownHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to angleUpDownHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Enter the angle of the stationary solar panel. -90 degrees is when the panel faces south, 0 is when it faces to sky, and 90 when is it faces directly north'); %Open help menu



function numPanels_et_Callback(hObject, eventdata, handles)
% hObject    handle to numPanels_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numPanels_et as text
%        str2double(get(hObject,'String')) returns contents of numPanels_et as a double


% --- Executes during object creation, after setting all properties.
function numPanels_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numPanels_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in numHelp_pb.
function numHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to numHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Please enter the number of solar panels you wish to test. All panels are assumed to be rectangles.');


function panelEff_et_Callback(hObject, eventdata, handles)
% hObject    handle to panelEff_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of panelEff_et as text
%        str2double(get(hObject,'String')) returns contents of panelEff_et as a double


% --- Executes during object creation, after setting all properties.
function panelEff_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panelEff_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in effHelp_pb.
function effHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to effHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Please enter the solar panel''efficiency as a percentage from 0 to 100. A typical panel would have an efficiency of 14% but this may vary depending on model.');


% --- Executes on selection change in lengthUnit_pm.
function lengthUnit_pm_Callback(hObject, eventdata, handles)
% hObject    handle to lengthUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lengthUnit_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lengthUnit_pm


% --- Executes during object creation, after setting all properties.
function lengthUnit_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lengthUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in widthUnit_pm.
function widthUnit_pm_Callback(hObject, eventdata, handles)
% hObject    handle to widthUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns widthUnit_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from widthUnit_pm


% --- Executes during object creation, after setting all properties.
function widthUnit_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
