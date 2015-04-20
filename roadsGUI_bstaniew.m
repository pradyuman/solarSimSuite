function varargout = roadsGUI_bstaniew(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Spring 2015
%  Programmer(s) and Purdue Email Address(es): Michael Keller Pradyuman Vig
%  Devashish and Ben
%  1. , keller77@purdue.edu
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

% Last Modified by GUIDE v2.5 14-Apr-2015 00:01:22

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
helpGUI_sec13_team18('This GUI receives input of Zip code, road width, road width margin, road length, traffic levels, and an example day. It then calculates the energy output for the example day and each month of the year and outputs these on to two graphs.');

% --- Executes on button press in openMenu_pb.
function openMenu_pb_Callback(hObject, eventdata, handles)
% hObject    handle to openMenu_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nanohubGUI_sec13_team18;
close roadsGUI_bstaniew;

% --- Executes on button press in closeGUI_pb.
function closeGUI_pb_Callback(hObject, eventdata, handles)
% hObject    handle to closeGUI_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

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
helpGUI_sec13_team18('Find the day and month of the year using the drop down menus. Make sure that the day exists for the given month. ie.: February 31st does not exist.');

% --- Executes on button press in zipHelp_pb.
function zipHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to zipHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Please enter your 5 digit zipcode. ie.: West Lafayette, IN = 47906');

% --- Executes on button press in widthHelp_pb.
function widthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to widthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Enter the width of the road width solar panels, in meters.');

% --- Executes on button press in lengthHelp_pb.
function lengthHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to lengthHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18('Enter the length of the road width solar panels in meters');

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zip = str2num(get(handles.zipInput_et, 'String'));
data = csvread('zipcode.csv');
length = str2num(get(handles.lengthInput_et, 'String'));
width = str2num(get(handles.widthInput_et, 'String'));
margin = str2num(get(handles.marginInput_et, 'String'));
area = length * (width - 2 * margin);
day = get(handles.day_pm, 'Value') - 1;
month = get(handles.month_pm, 'Value') - 1;
traffic = str2num(get(handles.trafficInput_et, 'String'));
if ~isempty(zip)
    [row, col] = find(data(:,1) == zip)
end
if isempty(zip)
    errorGUI_sec13_team18('Error! All fields must have entries!');
elseif isempty(width) | isempty(length) | isempty(margin) | isempty(traffic) | ~day | ~month
    errorGUI_sec13_team18('Error! All fields must have entries!');
elseif isempty(row) | isempty(col)
    errorGUI_sec13_team18('Error! Zip code is invalid. If zip code is valid, please enter a 5 digit zip code of a nearby major city.');
elseif width <= 0
    errorGUI_sec13_team18('Error! Width input must be positive!');
elseif length <= 0
    errorGUI_sec13_team18('Error! Length input must be positive!');
elseif width - 2*margin <= 0
    errorGUI_sec13_team18('Error! Margins must be less than 1/2 of the road width!');
elseif traffic < 0
    errorGUI_sec13_team18('Error! Traffic must be nonnegaive!');
elseif area - 9 * traffic < 0
    errorGUI_sec13_team18('Error! Traffic cannot be so large that the roads are completely covered!');
else
latitude = data(row, 2);
time = 0:23;
efficiency = .14;
day = dayYear(month, day);

for k = 0:23
    energy(k + 1) = area * solarInsolation(latitude, 0, k, day) * efficiency - str2num(get(handles.trafficInput_et, 'String')) * 9;
    if energy(k + 1) < 0
        energy(k + 1) = 0;
    end
end
plot(handles.dayGraph_ax, time, energy);
axis([0 24 0 1.1 * max(energy)]) 
set(handles.dayGraph_ax,'xtick',0:2:24);
xlabel(handles.dayGraph_ax,'Time (days)')
ylabel(handles.dayGraph_ax,'Power Generation (kW)')

for k = 0:11
    energy = [];
    for j = 0:23
        energy(j + 1) = efficiency * (area * solarInsolation(latitude, 0, j, 30 * k + 15) - traffic * 9);
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

% --- Executes on button press in reset_pb.
function reset_pb_Callback(hObject, eventdata, handles)
% hObject    handle to reset_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.zipInput_et,'String','')
set(handles.widthInput_et,'String','')
set(handles.lengthInput_et,'String','')
set(handles.marginInput_et,'String','')
set(handles.trafficInput_et,'String','')
set(handles.day_pm,'Value',1)
set(handles.month_pm,'Value',1)
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
helpGUI_sec13_team18('Enter the average number of cars that pass over this road in one hour.');
