function varargout = rotateGUI_chopra5(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es): Michael Keller Pradyuman Vig
%  Devashish and Ben Staniewicz
%  1. chopra5@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Name login@purdue.edu
%
%  Section #: 13     Team #:18
%  Assignment: nanoHUB Simulation Suite
%
%  Academic Integrity Statement:
%       I/We have not used source code obtained from
%       any other unauthorized source, either modified
%       or unmodified.  Neither have I/we provided access
%       to my/our code to another. The project I/we am/are 
%       submitting is my/our own original work.
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

% Last Modified by GUIDE v2.5 14-Apr-2015 05:22:21

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
helpGUI_sec13_team18

% --- Executes on button press in openMenu_pb.
function openMenu_pb_Callback(hObject, eventdata, handles)
% hObject    handle to openMenu_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nanohubGUI_sec13_team18
close rotateGUI_chopra5

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
helpGUI_sec13_team18 ('Enter the date and month in the provided area')

% --- Executes on button press in zipHelp_pb.
function zipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to zipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Type in your 5 digit postal code (ex: 47906)');


% --- Executes on button press in widthHelp_pb.
function widthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to widthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Enter your solar panel width (in meters)');

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


zip = str2num(get(handles.zipInput_et, 'String'));
data = csvread('zipcode.csv');
length = str2num(get(handles.lengthInput_et, 'String'));
width = str2num(get(handles.widthInput_et, 'String'));

area = length * width;
day = get(handles.day_pm, 'Value') - 1;
month = get(handles.month_pm, 'Value') - 1;
if ~isempty(zip)
    [row, col] = find(data(:,1) == zip)
    latitude = data(row, 2);
    time = 0:23;
    efficiency = .14;
    day = dayYear(month, day);
    tilt = str2num(get(handles.angleUpDownInput_et ,'String'));
    AngleUpDown = str2double(get(handles.angleUpDownInput_et,'String'));
    AngleNSEW = str2double(get(handles.angleNSEWInput_et,'String'));
else
    errorGUI_sec13_team18('Error! All fields must have entries!');
end



if isempty(width) | isempty(length) | isempty(AngleUpDown) | isempty(AngleNSEW) | ~day | ~month
    errorGUI_sec13_team18('Error! All fields must have entries!');
elseif isempty(row) | isempty(col)
    errorGUI_sec13_team18('Error! Zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.');
elseif width <= 0
    errorGUI_sec13_team18('Error! Width input must be positive!');
elseif length <= 0
    errorGUI_sec13_team18('Error! Length input must be positive!');    

elseif AngleUpDown < 0 | AngleUpDown > 90 
    errorGUI_sec13_team18('Error! Please enter an angle between 0 to 90 degress');

elseif AngleNSEW < 0 | AngleNSEW > 360
    errorGUI_sec13_team18('Error! Please enter an angle between 0 to 90 degress');
else
latitude = data(row, 2);
time = 0:23;
efficiency = .14;
day = dayYear(month, day);

for k = 0:23
    energyStat(k + 1) = area * solarInsolation(latitude, tilt, k, day) * efficiency;
    if energyStat(k + 1) < 0
        energyStat(k + 1) = 0;
    end
end

for k = 0:23
    energyRot(k + 1) = area * 10.4 * efficiency;
    if energyStat(k + 1) == 0
        energyRot(k + 1) = 0;
    end
end
cla(handles.dayGraph_ax,'reset')
plot(handles.dayGraph_ax, time, energyStat,'g');
hold(handles.dayGraph_ax, 'on')
plot(handles.dayGraph_ax, time, energyRot,'r');
axis([0 24 0 1.1 * max(energyStat)]) 
set(handles.dayGraph_ax,'xtick',0:2:24);
xlabel(handles.dayGraph_ax,'Time (hours)')
ylabel(handles.dayGraph_ax,'Power Generation (kW)')

for k = 0:11
    energy = [];
    for j = 0:23
        energy(j + 1) = efficiency * area * solarInsolation(latitude, tilt, j, 30 * k + 15);
        if energy(j + 1) < 0
            energy(j + 1) = 0;
        end
    end
    avrgEnergy(k + 1) = mean(energy);
end

time = 1:12;
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
avrgEnergy = avrgEnergy .* daysInMonth;
plot(handles.yearGraph_ax, time, avrgEnergy);
axis([1 12 0 1.1 * (max(avrgEnergy))]) ;
set(handles.yearGraph_ax,'xtick',1:12);
xlabel(handles.yearGraph_ax,'Month of the year');
ylabel(handles.yearGraph_ax,'Total Monthly Energy Generation(kWh)');
end

% 
% 
% % Error Checking 
% 
% if width < 1 
%     errorGUI_sec13_team18('Error! Please enter a value that is greater than 0');
% end
% 
% if length < 1 
%     errorGUI_sec13_team18('Error! Please enter a value that is greater than 0');
% end
% 
% AngleUpDown = str2double(get(handles.angleUpDownInput_et,'String'));
% if AngleUpDown < 0 | AngleUpDown > 90 
%     errorGUI_sec13_team18('Error! Please enter an angle between 0 to 90 degress');
% end
% 
% AngleNSEW = str2double(get(handles.angleNSEWInput_et,'String'));
% if AngleNSEW < 0 | AngleNSEW > 360
%     errorGUI_sec13_team18('Error! Please enter an angle between 0 to 90 degress');
% end
% 
% if isempty(width) | isempty(length) | isempty(AngleUpDown) | isempty(AngleNSEW)
%     errorGUI_sec13_team18('Please enter all required fields');
% end
% 










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
helpGUI_sec13_team18 ('Enter your solar panel length (in meters)')


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
helpGUI_sec13_team18 ('Enter the angle of the stationary solar panel range from 0 to 90 where 0 is parallel and 90 is perpendicular');


function angleNSEWInput_et_Callback(hObject, eventdata, handles)
% hObject    handle to angleNSEWInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angleNSEWInput_et as text
%        str2double(get(hObject,'String')) returns contents of angleNSEWInput_et as a double


% --- Executes during object creation, after setting all properties.
function angleNSEWInput_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleNSEWInput_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in angleNSEWHelp_pb.
function angleNSEWHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to angleNSEWHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18 ('Enter the angle of rotation, this angle corresponds to the direction the top edge of the panel points towards (0 points towards North, 90 Points towards East etc.)');

