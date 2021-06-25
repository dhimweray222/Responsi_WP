function varargout = GUIWP(varargin)
%GUIWP MATLAB code file for GUIWP.fig
%      GUIWP, by itself, creates a new GUIWP or raises the existing
%      singleton*.
%
%      H = GUIWP returns the handle to a new GUIWP or the handle to
%      the existing singleton*.
%
%      GUIWP('Property','Value',...) creates a new GUIWP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUIWP_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUIWP('CALLBACK') and GUIWP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUIWP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIWP

% Last Modified by GUIDE v2.5 25-Jun-2021 21:53:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIWP_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIWP_OutputFcn, ...
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


% --- Executes just before GUIWP is made visible.
function GUIWP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUIWP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIWP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIWP_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%mengambil data baris 1-50 kolom house age, distance to the nearest MRT station,
%number of convenience stores
data = xlsread('RumahBaru.xlsx','A2:D51'); 
k = [1,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3=cukup, 4= tinggi, 5= sangat tinggi)
%tahapan pertama, perbaikan bobot
[m,n]=size (data); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
if k(j)==0, w(j)=-1*w(j);
end
end
for i=1:m
S(i)=prod(data(i,:).^w);
end
%tahapan ketiga, proses perangkingan
V= S/sum(S)
Descend = sort(V,'descend')
Skor_Tertinggi = max(V) 
set(handles.hasil,'Data',Descend');
set(handles.nilai,'String',Skor_Tertinggi);

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%membaca data pada tabel diexcel dan ditampilkan pada GUI 
ReadData = xlsread('RumahBaru.xlsx','A2:D51');
set(handles.baca,'Data',ReadData);



function nilai_Callback(hObject, eventdata, handles)
% hObject    handle to nilai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilai as text
%        str2double(get(hObject,'String')) returns contents of nilai as a double


% --- Executes during object creation, after setting all properties.
function nilai_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
