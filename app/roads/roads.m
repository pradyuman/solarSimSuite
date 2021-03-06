function varargout = roads(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
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
%ROADS M-file for roads.fig
%      ROADS, by itself, creates a new ROADS or raises the existing
%      singleton*.
%
%      H = ROADS returns the handle to a new ROADS or the handle to
%      the existing singleton*.
%
%      ROADS('Property','Value',...) creates a new ROADS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to roads_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ROADS('CALLBACK') and ROADS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ROADS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help roads

% Last Modified by GUIDE v2.5 06-May-2015 00:14:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @roads_OpeningFcn, ...
                   'gui_OutputFcn',  @roads_OutputFcn, ...
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


% --- Executes just before roads is made visible.
function roads_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for roads
handles.output = hObject;

% UIWAIT makes roads wait for user response (see UIRESUME)
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
set(handles.widthInput_et, 'String', '14.8'); 
set(handles.marginInput_et, 'String', '0.5');
set(handles.lengthInput_et, 'String', '2');
set(handles.trafficInput_et, 'String', '100');
set(handles.carSpeed_et, 'String', '45');
set(handles.panelEff_et, 'String', '14');

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = roads_OutputFcn(hObject, eventdata, handles)
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
descMessage = 'This application is for use of solar panels on roadways. Panels are to be placed on roads of the input dimensions at the location given by the input zip code. The program then calculates and plots energy generation throughout a sample day and an entire year. This can be used to coordinate with cities/towns to find the optimal stretch of road to place solar roadways.';
inputMessage = 'Inputs:  Location (zip code), Road dimensions (Length, width, margins), Panel efficiency, Traffic levels (cars/hour, car speed)';
outputMessage = 'Outputs: Graph of energy generation throughout each month of the year, Graph of energy generation throughout given sample day, total annual energy generation';
mathMessage = 'area = length * 1000 * (width - 2 * margin) - (traffic * 9 * timeCovered) / (3600) where timeCovered = length * 1000 / speed. This is the average area exposed to sunlight at a given moment. This is then multiplied by the solar radiation (kW/m^2) to find the total energy generation. See the main menu for description on how the solar insolation is calculated.';
appHelp(descMessage, inputMessage, outputMessage, mathMessage);


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
main([zipcode day month]); %Sends zip, day, and month inputs to main menu so that it can output those to GUIs opened in the future
close roads; %Close current GUI

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
guiHelp('Find the day and month of the year using the drop down menus. Make sure that the day exists for the given month. ie.: February 31st does not exist.'); %Sends string of help message

% --- Executes on button press in zipHelp_pb.
function zipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to zipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiHelp('Please enter your 5 digit US zipcode. ie.: West Lafayette, IN = 47906.'); %Sends string of help message

% --- Executes on button press in widthHelp_pb.
function widthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to widthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiHelp('Enter the width of the road width solar panels in meters. 1 lane is approximately 3.7 meters wide. The unit can be selected from the popup menu to the right.'); %Sends string of help message

% --- Executes on button press in lengthHelp_pb.
function lengthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to lengthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiHelp('Enter the length of the road with solar panels. The unit can be selected from the popup menu to the right.'); %Sends string of help message

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

zip = str2num(get(handles.zipInput_et, 'String')); %Finds zip code
data = csvread('zipcode.csv'); %Imports list of zip codes and longitudes/latitudes
if get(handles.widthUnit_pm, 'Value') == 1 %Unit selected: meters
    width = str2num(get(handles.widthInput_et, 'String')); %Find road length
else %Unit selected: feet
    width = .3048 * str2num(get(handles.widthInput_et, 'String')); %Convert to meters
end
if get(handles.marginUnit_pm, 'Value') == 1 %Unit selected: meters
    margin = str2num(get(handles.marginInput_et, 'String')); %Find road length
else %Unit selected: feet
    margin = .3048 * str2num(get(handles.marginInput_et, 'String'));; %Convert to meters
end
if get(handles.lengthUnit_pm, 'Value') == 1 %Unit selected: km
    length = 1000 * str2num(get(handles.lengthInput_et, 'String')); %Find road length (m)
else %Unit selected: mi
    length = 1609.34 * str2num(get(handles.lengthInput_et, 'String')); %Convert to meters (m)
end
if get(handles.speedUnit_pm, 'Value') == 1 %Unit selected: kph
    speed = 0.2777778 * abs(str2num(get(handles.carSpeed_et, 'String'))); %Find avrg speed (m/s)
elseif get(handles.speedUnit_pm, 'Value') == 2 %Unit selected: mph 
    speed = 0.44704 * abs(str2num(get(handles.carSpeed_et, 'String'))); %Find avrg speed (m/s)
elseif get(handles.speedUnit_pm, 'Value') == 3 %Unit selected: m/s
    speed = abs(str2num(get(handles.carSpeed_et, 'String'))); %Find avrg speed (m/s)
else %Unit selected: ft/s
    speed = 0.3048 * abs(str2num(get(handles.carSpeed_et, 'String'))); %Find avrg speed (m/s)
end
    
area = length * (width - 2 * margin); %Calculate road area (m^2)
day = get(handles.day_pm, 'Value') - 1; %Find the day of the month 
month = get(handles.month_pm, 'Value') - 1; %Find the month
traffic = str2num(get(handles.trafficInput_et, 'String')); %Find cars/hr
daysOfMonth = [31 28 31 30 31 30 31 31 30 31 30 31]; %Vector of the days in each month
efficiency = str2num(get(handles.panelEff_et, 'String'));

if ~isempty(zip) %If there is a user input zip code
    [row, col] = find(data(:,1) == zip); %Find the index of the zip code
end %Ends if statement

% ------------ INPUT VALIDATION ---------------
if isempty(zip) | ~isscalar(zip) %If zip is not a scalar
    errorGUI('ERROR! Please enter a valid zipcode'); %Open errorGUI menu
elseif isempty(width) | isempty(length) | isempty(margin) | isempty(traffic) | ~day | ~month | isempty(speed) |isempty(efficiency)
    errorGUI('ERROR! All fields must have entries!'); %Open errorGUI menu
elseif ~isscalar(width) | ~isscalar(length) | ~isscalar(margin) | ~isscalar(traffic) | ~isscalar(speed) | ~isscalar(efficiency)
    errorGUI('ERROR! All edit text fields must have scalar inputs!'); %Open errorGUI menu
elseif isempty(row) | isempty(col) %If zip code is not found
    errorGUI('ERROR! Zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.'); %Open errorGUI menu
elseif width < 3 %If width is too small to fit a car
    errorGUI('ERROR! Road must be at least the width of one lane'); %Open errorGUI menu
elseif length <= 0 %If length is negative
    errorGUI('ERROR! Length input must be positive!'); %Open errorGUI menu
elseif width - 2 * margin <= 0 %If margins are larger than width
    errorGUI('ERROR! Margins must be less than 1/2 of the road width!'); %Open errorGUI menu
elseif efficiency <= 0 | efficiency > 100
    errorGUI('ERROR! Efficiency must be less than or equal to 100% and greater than 0%');
elseif traffic < 0 %If traffic is negative
    errorGUI('ERROR! Traffic must be nonnegative!'); %Open errorGUI menu
elseif (speed == 0 & traffic ~= 0) %If speed is 0 but traffic is moving (logical contradiction)
    errorGUI('ERROR! Speed must be greater than 0 if traffic is nonzero'); %Open errorGUI menu
elseif length * 200 * speed < traffic %If roads are completely covered at all times
    errorGUI('ERROR! Traffic cannot be so large that the roads are completely covered!'); %Open errorGUI menu
elseif daysOfMonth(month) < day %If day doesn't exist (Ex: February 31st)
    errorGUI('ERROR! The day is not a day of the chosen month!'); %Open errorGUI menu
else %End Input validation
    
% -------------- CALCULATIONS -----------    
latitude = data(row, 2); %Find the latitude 
time = 0:23; %Create vector of hours of the day
day = dayYear(month, day); %Find day in the year (dec 31 is day 365)
timeCovered = length * 1000 / speed; %Amount of time that there are cars on the road (assuming continuous driving)
if timeCovered > 3600 %Max time is 1 hr
    timeCovered = 3600; %Sets to max time if over max
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
xlabel(handles.dayGraph_ax,'Hour of the Day', 'FontSize', 9) %Add x axis title
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
totalEnergy = sum(avrgEnergy);
plot(handles.yearGraph_ax, time, avrgEnergy); %Plot energy througohut the year
axis([1 12 0 1.1 * (max(avrgEnergy))]); %Change axes
set(handles.yearGraph_ax,'xtick',1:12); %Set xticks
xlabel(handles.yearGraph_ax,'Month of the year', 'FontSize', 9); %Add x axis title
ylabel(handles.yearGraph_ax,'Total Monthly Energy Generation(kWh)'); %Add y axis title
set(handles.yearGraph_ax,'xticklabel',['Jan'; 'Feb'; 'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'])
set(handles.annualEnergy, 'String',['Total Annual Energy Generated: ', num2str(totalEnergy/10^6), ' GWh']);
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
set(handles.panelEff_et,'String','')
set(handles.annualEnergy, 'String','');
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
guiHelp('Please enter a positive road margin. The road margin is the length on each side of the road that does not contain any solar panels.');


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
guiHelp('Enter the average number of cars that pass over this road in one hour. About 50 cars pass over a medium sized two lane road in an hour.');



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

guiHelp('Enter the expected average speed of cars on this road in the desired units. Units can be selected using the pop up menu to the right.');



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
guiHelp('Please enter the efficiency of the panels being used. A typical efficiency is 14%');

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


% --- Executes on selection change in marginUnit_pm.
function marginUnit_pm_Callback(hObject, eventdata, handles)
% hObject    handle to marginUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns marginUnit_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from marginUnit_pm


% --- Executes during object creation, after setting all properties.
function marginUnit_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to marginUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in speedUnit_pm.
function speedUnit_pm_Callback(hObject, eventdata, handles)
% hObject    handle to speedUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns speedUnit_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from speedUnit_pm


% --- Executes during object creation, after setting all properties.
function speedUnit_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speedUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
delete(hObject);
