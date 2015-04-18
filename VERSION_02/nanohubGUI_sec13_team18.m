function varargout = nanohubGUI_sec13_team18(varargin)
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

% Last Modified by GUIDE v2.5 07-Apr-2015 02:18:49

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
trainsGUI_pvig;
close nanohubGUI_sec13_team18;

% --- Executes on button press in road_pb.
function road_pb_Callback(hObject, eventdata, handles)
% hObject    handle to road_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
roadsGUI_bstaniew;
close nanohubGUI_sec13_team18;

% --- Executes on button press in light_pb.
function light_pb_Callback(hObject, eventdata, handles)
% hObject    handle to light_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lightpoleGUI_keller77;
close nanohubGUI_sec13_team18;

% --- Executes on button press in rotate_pb.
function rotate_pb_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rotateGUI_chopra5;
close nanohubGUI_sec13_team18;

% --- Executes on button press in moreAbout_pb.
function moreAbout_pb_Callback(hObject, eventdata, handles)
% hObject    handle to moreAbout_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpGUI_sec13_team18;

% --- Executes on button press in references_pb.
function references_pb_Callback(hObject, eventdata, handles)
% hObject    handle to references_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

citationGUI_sec13_team18;


% --- Executes on button press in close_pb.
function close_pb_Callback(hObject, eventdata, handles)
% hObject    handle to close_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all;