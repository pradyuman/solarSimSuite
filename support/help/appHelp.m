function varargout = appHelp(varargin)
%APPHELP M-file for appHelp.fig
%      APPHELP, by itself, creates a new APPHELP or raises the existing
%      singleton*.
%
%      H = APPHELP returns the handle to a new APPHELP or the handle to
%      the existing singleton*.
%
%      APPHELP('Property','Value',...) creates a new APPHELP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to appHelp_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      APPHELP('CALLBACK') and APPHELP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in APPHELP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help appHelp

% Last Modified by GUIDE v2.5 30-Apr-2015 06:33:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @appHelp_OpeningFcn, ...
                   'gui_OutputFcn',  @appHelp_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   warning('off','MATLAB:str2func:invalidFunctionName');
   gui_State.gui_Callback = str2func(varargin{1});
   warning('on','MATLAB:str2func:invalidFunctionName');
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before appHelp is made visible.
function appHelp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for appHelp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Set static text
if ~isempty(varargin)
    description = varargin{1};
    set(handles.description_st, 'String', description);
    inputs = varargin{2};
    set(handles.inputs_st, 'String', inputs);
    outputs = varargin{3};
    set(handles.outputs_st, 'String', outputs);
    math = varargin{4};
    set(handles.math_st, 'String', math);  
end


% UIWAIT makes appHelp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = appHelp_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in close_pb.
function close_pb_Callback(hObject, eventdata, handles)
% hObject    handle to close_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close appHelp %Close GUI
