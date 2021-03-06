function varargout = lightpole(varargin)
%LIGHTPOLE M-file for lightpole.fig
%      LIGHTPOLE, by itself, creates a new LIGHTPOLE or raises the existing
%      singleton*.
%
%      H = LIGHTPOLE returns the handle to a new LIGHTPOLE or the handle to
%      the existing singleton*.
%
%      LIGHTPOLE('Property','Value',...) creates a new LIGHTPOLE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to lightpole_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      LIGHTPOLE('CALLBACK') and LIGHTPOLE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in LIGHTPOLE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES


% Edit the above text to modify the response to help lightpole

% Last Modified by GUIDE v2.5 06-May-2015 00:15:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lightpole_OpeningFcn, ...
                   'gui_OutputFcn',  @lightpole_OutputFcn, ...
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


% --- Executes just before lightpole is made visible.
function lightpole_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for lightpole
handles.output = hObject;

% UIWAIT makes lightpole wait for user response (see UIRESUME)
% uiwait(handles.figure1);
if(~isempty(varargin))
    data = varargin{1};
    if(data(1) >= 0)
        set(handles.zipcode_et, 'String', sprintf('%05d', data(1)));
    end
    set(handles.day_pm, 'Value', data(2));
    set(handles.month_pm, 'Value', data(3));
end

%Presets for presentation purposes
set(handles.poleDiameter_et, 'String', '20');
set(handles.poleHeight_et, 'String', '8.07');
set(handles.numPoles_et, 'String', '1');
set(handles.panelEff_et,'String','14');

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = lightpole_OutputFcn(hObject, eventdata, handles)
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
descMessage = 'This simulation is designed to test the effectiveness of lightpoles with flexible solar panels wrapped around them. Based on pole dimensions and loations, energy generated is calculated and plotted on two graphs. This can be useful to see if self sustaining light poles are a viable option for certain locations';
inputMessage = 'Inputs: Location (zip code), number of poles, pole height and diameter, day to be graphed/tested';
outputMessage = 'Outputs: Graph of energy generation throughout the sample day, graph of energy generation throughout the year, and the total annual energy generation ';
mathMessage = 'The light pole is treated similarly to a solar panel that is oriented perpendicular to the ground instead of parallel. The solar insolation is calculated with these inputs for a given day solarInsolation(latitude, 90, hour, day). See the main menu GUI for more info on this function';
appHelp(descMessage, inputMessage, outputMessage, mathMessage);

% --- Executes on button press in mainMenu_pb.
function mainMenu_pb_Callback(hObject, eventdata, handles)
% hObject    handle to mainMenu_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zipcode = str2num(get(handles.zipcode_et,'String'));
if(isempty(zipcode))
    zipcode = -1;
end
day = get(handles.day_pm, 'Value');
month = get(handles.month_pm, 'Value');
main([zipcode day month]);
close lightpole

% --- Executes on button press in closeGUI_pb.
function closeGUI_pb_Callback(hObject, eventdata, handles)
% hObject    handle to closeGUI_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close lightpole

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



function poleDiameter_et_Callback(hObject, eventdata, handles)
% hObject    handle to poleDiameter_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of poleDiameter_et as text
%        str2double(get(hObject,'String')) returns contents of poleDiameter_et as a double

% --- Executes during object creation, after setting all properties.
function poleDiameter_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to poleDiameter_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function poleHeight_et_Callback(hObject, eventdata, handles)
% hObject    handle to poleHeight_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of poleHeight_et as text
%        str2double(get(hObject,'String')) returns contents of poleHeight_et as a double


% --- Executes during object creation, after setting all properties.
function poleHeight_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to poleHeight_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zipcode_et_Callback(hObject, eventdata, handles)
% hObject    handle to zipcode_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zipcode_et as text
%        str2double(get(hObject,'String')) returns contents of zipcode_et as a double


% --- Executes during object creation, after setting all properties.
function zipcode_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zipcode_et (see GCBO)
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
guiHelp('Select a valid day and month using the drop down menu.');

% --- Executes on button press in zipCodeHelp_pb.
function zipCodeHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to zipCodeHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiHelp('Enter a valid 5 digit postal US zip code. If the error still persists, try using the zipcode of your nearest big city.'); 

% --- Executes on button press in poleDiameterHelp_pb.
function poleDiameterHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to poleDiameterHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiHelp('Enter the diameter of your light pole. You may choose the units via the popup menu to the right of the input. A typical pole has a diameter of about 20cm.')

% --- Executes on button press in poleHeightHelp_pb.
function poleHeightHelp_pb_Callback(hObject, eventdata, handles)
% hObject    handle to poleHeightHelp_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiHelp('Enter the height of your light pole.(An average light pole height is about 8.07 meters). You can change the units by the popup menu to the right of the input.')

% --- Executes on button press in compute_pb.
function compute_pb_Callback(hObject, eventdata, handles)
% hObject    handle to compute_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Getting zipcode from GUI
zip = str2num(get(handles.zipcode_et, 'String'));
%Opening zipcode database
data = csvread('zipcode.csv');
%Getting height from GUI
height = str2num(get(handles.poleHeight_et, 'String'));
%Getting diameter from GUI
if get(handles.diameterUnit_pm, 'Value') == 1
    diameter = str2num(get(handles.poleDiameter_et, 'String')) / 100;
else
    diameter = 0.0254 * str2num(get(handles.poleDiameter_et, 'String'));
end
if get(handles.heightUnit_pm, 'Value') == 1
    height = str2num(get(handles.poleHeight_et, 'String'));
else
    height = .3048 * str2num(get(handles.poleHeight_et, 'String'));
end


%Getting day from GUI
day = get(handles.day_pm, 'Value') - 1;
%Getting month from GUI
month = get(handles.month_pm, 'Value') - 1;
num = str2num(get(handles.numPoles_et,'String'));
efficiency = str2num(get(handles.panelEff_et,'String')) / 100;

%Getting latitude and longitude indexes from zipcode database
if(~isempty(zip))
    [row, col] = find(data(:,1) == zip);
end
%Input validation
if isempty(zip)
    errorGUI('ERROR! All fields must have entries!');
elseif isempty(diameter) | isempty(height) | ~day | ~month | isempty(efficiency) | isempty(num)
    errorGUI('ERROR! All fields must have entries!');
elseif isempty(row) | isempty(col)
    errorGUI('ERROR! Zip code is invalid. If zip code is valid, please enter a zip code of a nearby major city.');
elseif ~isscalar(zip) | ~isscalar(height) | ~isscalar(diameter) | ~isscalar(efficiency) | ~isscalar(num)
    errorGUI('ERROR! All inputs must be scalar.');
elseif diameter <= 0 
    errorGUI('ERROR! Diameter is invalid. Please enter a valid diameter')
elseif height <=0 
    errorGUI('ERROR! Height is invalid. Please enter a valid height')
elseif efficiency <= 0 | efficiency > 1
    errorGUI('ERROR! Efficiency must be less than or equal to 100% and greater than 0');
elseif num <= 0
    errorGUI('ERROR! The number of poles must be a positive integer!');
else

%Calculating area of sun x pole cross-section
area = height * diameter * num;
%Getting latitude
latitude = data(row, 2);
time = 0:23;
day = dayYear(month, day);

%Calculating solar insolation energy for a day
for k = 0:23
    energy(k + 1) = area * solarInsolation(latitude, 90, k, day) * efficiency;
    if energy(k + 1) < 0
        energy(k + 1) = 0;
    end
end

%Plotting solar insolation energy for a day
plot(handles.dayEnergy_ax, time, energy,'b');
axis([0 24 0 1.1 * max(energy)]) 
set(handles.dayEnergy_ax,'xtick',0:2:24);
xlabel(handles.dayEnergy_ax,'Time (hours)')
ylabel(handles.dayEnergy_ax,'Power Generation (kW)')

%Calculating solar insolation energy for an year
for k = 0:11
    energy = [];
    for j = 0:23
        energy(j + 1) = efficiency * area * solarInsolation(latitude, 90, j, 30 * k + 15);
        if energy(j + 1) < 0
            energy(j + 1) = 0;
        end
    end
    %Average energy for each month
    avrgEnergy(k + 1) = mean(energy);
end

%Plotting solar insolation energy for a month
time = 1:12;
daysInMonth = [31 28 31 30 31 30 31 31 30 31 30 31];
avrgEnergy = avrgEnergy .* daysInMonth;
totalEnergy = sum(avrgEnergy);
plot(handles.yearEnergy_ax, time, avrgEnergy);
set(handles.yearEnergy_ax,'xticklabel',['Jan'; 'Feb'; 'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'])
axis([1 12 0 1.1 * (max(avrgEnergy))]);
set(handles.yearEnergy_ax,'xtick',1:12);
xlabel(handles.yearEnergy_ax,'Month of the year');
ylabel(handles.yearEnergy_ax,'Total Monthly Energy Generation (kWh)');
set(handles.annualEnergy, 'String',['Total Annual Energy Generated: ', num2str(totalEnergy), ' kWh']);
end


% --- Executes on button press in updateLocation_pb.
function updateLocation_pb_Callback(hObject, eventdata, handles)
% hObject    handle to updateLocation_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset_pb.
function reset_pb_Callback(hObject, eventdata, handles)
% hObject    handle to reset_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Resetting edit text values to blank
set(handles.zipcode_et,'String','')
set(handles.poleDiameter_et,'String','')
set(handles.poleHeight_et,'String','')
set(handles.panelEff_et,'String','')
set(handles.numPoles_et,'String','')
%Resetting month/day values to 1 ("Enter Day" | "Enter Month")
set(handles.day_pm,'Value',1)
set(handles.month_pm,'Value',1)
%Resetting axes to blank
cla(handles.yearEnergy_ax,'reset')
cla(handles.dayEnergy_ax,'reset')



function numPoles_et_Callback(hObject, eventdata, handles)
% hObject    handle to numPoles_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numPoles_et as text
%        str2double(get(hObject,'String')) returns contents of numPoles_et as a double


% --- Executes during object creation, after setting all properties.
function numPoles_et_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numPoles_et (see GCBO)
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
guiHelp('Enter the efficiency of the solar panels used. An estimated efficiency of a typical panel is 14%');

% --- Executes on selection change in diameterUnit_pm.
function diameterUnit_pm_Callback(hObject, eventdata, handles)
% hObject    handle to diameterUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns diameterUnit_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from diameterUnit_pm


% --- Executes during object creation, after setting all properties.
function diameterUnit_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diameterUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in heightUnit_pm.
function heightUnit_pm_Callback(hObject, eventdata, handles)
% hObject    handle to heightUnit_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns heightUnit_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from heightUnit_pm


% --- Executes during object creation, after setting all properties.
function heightUnit_pm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to heightUnit_pm (see GCBO)
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
