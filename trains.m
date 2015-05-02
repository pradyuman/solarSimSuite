function varargout = trains(varargin)
%TRAINS M-file for trains.fig
%      TRAINS, by itself, creates a new TRAINS or raises the existing
%      singleton*.
%
%      H = TRAINS returns the handle to a new TRAINS or the handle to
%      the existing singleton*.
%
%      TRAINS('Property','Value',...) creates a new TRAINS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to trains_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TRAINS('CALLBACK') and TRAINS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TRAINS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trains

% Last Modified by GUIDE v2.5 30-Apr-2015 03:05:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trains_OpeningFcn, ...
                   'gui_OutputFcn',  @trains_OutputFcn, ...
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
 

% --- Executes just before trains is made visible.
function trains_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for trains
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trains wait for user response (see UIRESUME)
% uiwait(handles.figure1);

if(~isempty(varargin))
    data = varargin{1};
    if(data(1) >= 0)
        set(handles.enterStartZip_et, 'String', num2str(data(1)));
    end
    set(handles.day_pm, 'Value', data(2));
    set(handles.month_pm, 'Value', data(3));
end

%Presetting for presentation purposes
set(handles.startTime_et, 'String', '8:00');
set(handles.endTime_et, 'String', '14:00');
set(handles.cars_et, 'String', '10');
set(handles.panelEff_et, 'String', '14');

% --- Outputs from this function are returned to the command line.
function varargout = trains_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in moreInfo_pb.
function moreInfo_pb_Callback(hObject, eventdata, handles)
% hObject    handle to moreInfo_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
descMessage = 'This GUI is intended to be used to simulate solar panels on the rooves of trains. Based on the train''s start and end location, the amount of solar energy captured is graphed for each section of the trip. Graphs are shown for both daily and annual generation. This can be used to help optimize which trains receive solar panels as some routes would be better suited than others.';
inputMessage = 'Inputs: Location (start and end zipcode), Time (start and end), day to be graphed, panel efficiency, and number of train cars.';
outputMessage = 'Graph of energy generation if the train took the route once a day for a year, graph of energy generation for a single day of the train''s route, total annual energy generation';
mathMessage = 'area = 60 * 10 * numCars. This is the total area of the solar panels. This is multiplied by the solar energy for 10 equally spaced points along the trip (each with different energy). Each has different energy as the time of day and location changes each new point';
appHelp(descMessage, inputMessage, outputMessage, mathMessage);

% --- Executes on button press in mainMenu_pb.
function mainMenu_pb_Callback(hObject, eventdata, handles)
% hObject    handle to mainMenu_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%This code block sets the zipcode, day, and month as passthrough variables
%to other GUIs
%If the end zipcode was entered, set the passthrough zipcode to the end
%zipcode, otherwise set it to the start zipcode
if str2num(get(handles.enterEndZip_et,'String'))
    zipcode = str2num(get(handles.enterEndZip_et,'String'));
else
    zipcode = str2num(get(handles.enterStartZip_et,'String'));
end

%If zipcode is empty, set zipcode to -1
if(isempty(zipcode))
    zipcode = -1;
end
%Set day passthrough variable
day = get(handles.day_pm, 'Value');
%Set month passthrough variable
month = get(handles.month_pm, 'Value');
%Call the main GUI with the appropriate passthrough variables
nanohub([zipcode day month]);
close trains


% --- Executes on button press in closeGUI_pb.
function closeGUI_pb_Callback(hObject, eventdata, handles)
% hObject    handle to closeGUI_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close trains

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


function enterStartZip_et_Callback(hObject, eventdata, handles)
% hObject    handle to enterStartZip_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enterStartZip_et as text
%        str2double(get(hObject,'String')) returns contents of enterStartZip_et as a double


% --- Executes during object creation, after setting all properties.
function enterStartZip_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enterStartZip_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dateHelp_pb.
function dateHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to dateHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help('Enter the current date through the drop down menus (12 | January)')

% --- Executes on button press in startZipHelp_pb.
function startZipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to startZipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help('Enter the 5 digit zip code of the origin (XXXXX | 47906)')

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Getting starting zipcode from handles
start_zip = str2double(get(handles.enterStartZip_et,'String'));
%Getting ending zipcode from handles
end_zip = str2double(get(handles.enterEndZip_et,'String'));
%Loading zipcode data from file
data = csvread('zipcode.csv');

%If the start time was given with a colon, parse the input and obtain start time
%in minutes since 0:00
if length(strfind(get(handles.startTime_et,'String'), ':')) == 1
    num1 = str2double(strsplit(get(handles.startTime_et,'String'), ':'));
    start_time =  num1(1) + num1(2)/60;
%Otherwise, just take in the input and directly make it a number
else
    start_time = str2num(get(handles.startTime_et,'String'));
end

%If the ending time was given with a colon, parse the input and obtain start time
%in minutes since 0:00
if length(strfind(get(handles.endTime_et,'String'), ':')) == 1
    num2 = str2double(strsplit(get(handles.endTime_et,'String'), ':'));
    end_time =  num2(1) + num2(2)/60;
%Otherwise, just take in the input and directly make it a number
else
    end_time = str2num(get(handles.endTime_et,'String'));
end

efficiency = str2num(get(handles.panelEff_et,'String')) / 100;
%Get number of train cars
numCars = str2num(get(handles.cars_et,'String'));
%Get day of the month
day = get(handles.day_pm, 'Value') - 1;
%Get month of the year
month = get(handles.month_pm, 'Value') - 1;
%Find the latitude and longitude indexes of starting zipcode
[rowStart, colStart] = find(data(:,1) == start_zip);
%Find the latitude and longitude indexes of ending zipcode
[rowEnd, colEnd] = find(data(:,1) == end_zip);

%Array of number of days in a month (index corresponds to the number of the
%month in the year
daysOfMonth = [31 28 31 30 31 30 31 31 30 31 30 31];

%%%%%%%%%%%%%%%%INPUT VALIDATION%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(start_zip) | isempty(end_zip)
    error('Error! All fields must have valid entries!');
elseif isempty(start_time) | isempty(end_time) | ~day | ~month | isempty(numCars) | isempty(efficiency)
    error('Error! All fields must have valid entries!');
elseif ~isscalar(start_zip) | ~isscalar(end_zip) | ~isscalar(numCars) | ~isscalar(efficiency)
    error('Error! All inputs must be scalar!');
elseif isempty(rowStart) | isempty(colStart)
    error('Error! Starting zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.');
elseif isempty(rowEnd) | isempty(colEnd) | ~isscalar(rowEnd) | ~isscalar(colEnd)
    error('Error! Ending zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.');
elseif length(strfind(get(handles.startTime_et,'String'), ':')) > 1
    error('Error! Make sure your start time is in the correct format (XX:XX)');
elseif length(strfind(get(handles.endTime_et,'String'), ':')) > 1
    error('Error! Make sure your end time is in the correct format (XX:XX)');
elseif efficiency <= 0 | efficiency > 1
    error('Error! Efficiency must be between 0 and 100%');
elseif start_time > 24 | end_time > 24 | end_time < 0 | start_time < 0
    error('Error! Please enter times in 24 hour format (XX:XX)');
elseif start_time == end_time
    error('Error! Starting and ending zip codes are the same. Enter in different zipcodes for start and end.');
elseif start_time > end_time
    error('Error! Please enter a start time that is smaller than the end time (in 24 hour format).');
elseif numCars <= 0
    error('Error! There must be at least one train car!');
elseif daysOfMonth(month) < day
    error('Error! The day is not a day of the chosen month!');
else

time = 0:23; %Time vector for hours
tics = linspace(start_time, end_time, 10); %evenly spaced time increments
area = 60 * 10 * numCars; %Area of an average train
latStart = data(rowStart, 2); %starting latitude
latEnd = data(rowEnd, 2); %ending latitude

%If the start and end zipcodes are the same, then make a 10 element vector
%with the same latitude
if(latStart == latEnd)
    latitude = zeros(10);
    latitude = latitude + latStart;
%Otherwise, create an evenly spaces 10 element vector in between the start
%and end latitude
else
    latitude = latStart:((latEnd-latStart)/9):latEnd; %average latitude
end
%Calculate energy for the trip
for k = 1:10
    energy(k) = area * solarInsolation(latitude(k), 0, tics(k), dayYear(month,day)) * efficiency;
end
%Plot energy for the trip
plot(handles.dayEnergy_ax, tics, energy);
axis([start_time end_time 0 1.1 * max(energy)]) 
set(handles.dayEnergy_ax,'xtick',0:2:24);
xlabel(handles.dayEnergy_ax,'Hour of the Day')
ylabel(handles.dayEnergy_ax,'Power Generation (kW)')

%Calculate energy for the trip for every month of the year
for j = 0:11
    energy = [];
    for k = 1:10
        energy(k) = area * solarInsolation(latitude(k), 0, k, 30 * j + 15) * efficiency;
    end
    %Calculate average energy
    avrgEnergy(j + 1) = mean(energy);
end

%Plot energy for the year
time = 1:12;
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
avrgEnergy = avrgEnergy .* daysInMonth;
totalEnergy = sum(avrgEnergy);
plot(handles.yearEnergy_ax, time, avrgEnergy);
axis([1 12 0 1.1 * (max(avrgEnergy))]) ;
set(handles.yearEnergy_ax,'xtick',1:12);
set(handles.yearEnergy_ax,'xticklabel',['Jan'; 'Feb'; 'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'])
xlabel(handles.yearEnergy_ax,'Month of the Year');
ylabel(handles.yearEnergy_ax,'Total Monthly Energy Generation (kWh)');
set(handles.annualEnergy, 'String',['Total Annual Energy Generated: ', num2str(totalEnergy/10^6), ' GWh']);

end

% --- Executes on button press in reset_pb.
function reset_pb_Callback(hObject, eventdata, handles)
% hObject    handle to reset_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Resetting edit text values to blank
set(handles.enterStartZip_et,'String','')
set(handles.enterEndZip_et,'String','')
set(handles.startTime_et,'String','')
set(handles.endTime_et,'String','')
set(handles.annualEnergy, 'String','');
set(handles.cars_et, 'String','');
set(handles.panelEff_et, 'String','');
%Resetting month/day values to 1 ("Enter Day" | "Enter Month")
set(handles.day_pm,'Value',1)
set(handles.month_pm,'Value',1)
%Resetting axes to blank
cla(handles.yearEnergy_ax,'reset')
cla(handles.dayEnergy_ax,'reset')


function enterEndZip_et_Callback(hObject, eventdata, handles)
% hObject    handle to enterEndZip_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enterEndZip_et as text
%        str2double(get(hObject,'String')) returns contents of enterEndZip_et as a double


% --- Executes during object creation, after setting all properties.
function enterEndZip_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enterEndZip_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in endZipHelp_pb.
function endZipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to endZipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help('Enter the 5 digit zip code of the destination (XXXXX | 47906)')


function endTime_et_Callback(hObject, eventdata, handles)
% hObject    handle to endTime_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endTime_et as text
%        str2double(get(hObject,'String')) returns contents of endTime_et as a double


% --- Executes during object creation, after setting all properties.
function endTime_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endTime_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in endTimeHelp_pb.
function endTimeHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to endTimeHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help('Enter the end time of your trip in 24 hour format (XX:XX | 18:00)')


function startTime_et_Callback(hObject, eventdata, handles)
% hObject    handle to startTime_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startTime_et as text
%        str2double(get(hObject,'String')) returns contents of startTime_et as a double


% --- Executes during object creation, after setting all properties.
function startTime_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startTime_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startTimeHelp_pb.
function startTimeHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to startTimeHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help('Enter the time of day in 24 hour format (XX:XX | 14:00)')



function cars_et_Callback(hObject, eventdata, handles)
% hObject    handle to cars_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cars_et as text
%        str2double(get(hObject,'String')) returns contents of cars_et as a double


% --- Executes during object creation, after setting all properties.
function cars_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cars_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in carHelp_pb.
function carHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to carHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help('Enter the number of train cars on the train being used');


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
help('Enter the efficiency of the solar panels being used on the train. A common efficiency factor is 14% but varies based on materials used.');
