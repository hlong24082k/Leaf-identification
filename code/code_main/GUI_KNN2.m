function varargout = GUI_KNN2(varargin)
% GUI_KNN2 MATLAB code for GUI_KNN2.fig
%      GUI_KNN2, by itself, creates a new GUI_KNN2 or raises the existing
%      singleton*.
%
%      H = GUI_KNN2 returns the handle to a new GUI_KNN2 or the handle to
%      the existing singleton*.
%
%      GUI_KNN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_KNN2.M with the given input arguments.
%
%      GUI_KNN2('Property','Value',...) creates a new GUI_KNN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_KNN2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_KNN2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_KNN2

% Last Modified by GUIDE v2.5 01-Dec-2021 17:38:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_KNN2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_KNN2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before GUI_KNN2 is made visible.
function GUI_KNN2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_KNN2 (see VARARGIN)

% Choose default command line output for GUI_KNN2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_KNN2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_KNN2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in thuchien.
function thuchien_Callback(hObject, eventdata, handles)
% hObject    handle to thuchien (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
link = get(handles.input1,'string');
imshow(link);
%read image link
img = imread(link);

%convert binary image
img_nhiphan = K_means(img);

%Hu_moments
img_nhiphan = double(img_nhiphan/255);
img_hu_moment = hu_moments(img_nhiphan);

%test
la_lot = xlsread('E:\Nhom8A\Excel\Hu_moments_la_lot.xlsx');
rau_ngo = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_ngo.xlsx');
rau_hung = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_hung.xlsx');
rau_ma = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_ma.xlsx');
rau_muong = xlsread('E:\Nhom8A\Excel\Hu_moments_rau_muong.xlsx');

file = [la_lot(:,:);rau_ngo(:,:);rau_hung(:,:);rau_ma(:,:);rau_muong(:,:)];

out1 = KNN_img(img_hu_moment,file);
set(handles.output2,'string',out1);



function inputk_Callback(hObject, eventdata, handles)
% hObject    handle to inputk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputk as text
%        str2double(get(hObject,'String')) returns contents of inputk as a double


% --- Executes during object creation, after setting all properties.
function inputk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
