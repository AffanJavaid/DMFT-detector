function varargout = DualTone(varargin)
% DUALTONE MATLAB code for DualTone.fig
%      DUALTONE, by itself, creates a new DUALTONE or raises the existing
%      singleton*.
%
%      H = DUALTONE returns the handle to a new DUALTONE or the handle to
%      the existing singleton*.
%
%      DUALTONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DUALTONE.M with the given input arguments.
%
%      DUALTONE('Property','Value',...) creates a new DUALTONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DualTone_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DualTone_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DualTone

% Last Modified by GUIDE v2.5 14-Dec-2019 18:33:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DualTone_OpeningFcn, ...
                   'gui_OutputFcn',  @DualTone_OutputFcn, ...
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


% --- Executes just before DualTone is made visible.
function DualTone_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DualTone (see VARARGIN)

% Choose default command line output for DualTone
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DualTone wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DualTone_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*697*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1209*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 1");

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*697*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1336*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.edit1,'string',"Button pressed 2");

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs=8000;
n=204;
lo=0.999969*cos(2*pi*697*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1477*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 3");
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*770*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1209*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 4");

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*770*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1336*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 5");

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs=8000;
n=204;
lo=0.999969*cos(2*pi*770*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1477*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 6");
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*852*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1209*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 7");

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*852*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1336*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 8");

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*852*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1477*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 9");

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*941*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1209*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed *");

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*941*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1336*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed 0");

% --- Executes on button press in pushbutton12
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=8000;
n=204;
lo=0.999969*cos(2*pi*941*(0:n-1)/Fs);
hi=0.999969*cos(2*pi*1477*(0:n-1)/Fs);
data= lo+hi;
soundsc(data);
figure(1);
plot(data)
title("sound");
f=fft(data);
mag=abs(f);
figure(2);
stem(mag);
title("DFT magnitude");
k=find(mag>80,2);
i_low=k(1);
i_high=k(2);
figure(3)
subplot 211
stem(i_low);
title("Low frequency"); ylabel("K");
subplot 212
stem(i_high);
title("High frequency"); ylabel("K");
set(handles.editbox1,'string',"Button pressed #");