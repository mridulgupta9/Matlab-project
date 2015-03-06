function varargout = prog(varargin)
% PROG MATLAB code for prog.fig
%      PROG, by itself, creates a new PROG or raises the existing
%      singleton*.
%
%      H = PROG returns the handle to a new PROG or the handle to
%      the existing singleton*.
%
%      PROG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROG.M with the given input arguments.
%
%      PROG('Property','Value',...) creates a new PROG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prog

% Last Modified by GUIDE v2.5 04-Feb-2015 01:55:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prog_OpeningFcn, ...
                   'gui_OutputFcn',  @prog_OutputFcn, ...
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


% --- Executes just before prog is made visible.
function prog_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
global pointload moment udl ldl length young EI z;
pointload=zeros(1000,2);
moment=zeros(1000,2);
udl=zeros(1000,3);
ldl=zeros(1000,4);
EI=ones(1,1001)*900*210*10^-3;
z=1;
length=0;
young=210;
grid(handles.axes2,'off');
grid(handles.axes3,'off');
grid(handles.axes4,'off');
set(handles.edit2,'string','0');
set(handles.edit3,'string','210');
set(handles.uitable6,'Data',pointload);
set(handles.uitable11,'Data',moment);
set(handles.uitable12,'Data',udl);
set(handles.uitable13,'Data',ldl);
set(handles.uipanel1,'Visible','on');
set(handles.uipanel2,'Visible','off');
set(handles.uipanel3,'Visible','off');
set(handles.uipanel4,'Visible','off');

guidata(hObject, handles);

% UIWAIT makes prog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
set(handles.uipanel1,'Visible','on');
set(handles.uipanel2,'Visible','off');
set(handles.uipanel3,'Visible','off');
set(handles.uipanel4,'Visible','off');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.uipanel1,'Visible','off');
set(handles.uipanel2,'Visible','on');
set(handles.uipanel3,'Visible','off');
set(handles.uipanel4,'Visible','off');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.uipanel1,'Visible','off');
set(handles.uipanel2,'Visible','off');
set(handles.uipanel3,'Visible','on');
set(handles.uipanel4,'Visible','off');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
set(handles.uipanel1,'Visible','off');
set(handles.uipanel2,'Visible','off');
set(handles.uipanel3,'Visible','off');
set(handles.uipanel4,'Visible','on');



function edit2_Callback(hObject, eventdata, handles)

global length;
length=str2double(get(hObject,'string'));
if isnan(length)
    errordlg('Please enter a numeric value','Invalid Input','modal')
    set(handles.edit2,'string','0');
end



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
global young;
young=str2double(get(hObject,'string'));
if isnan(young)
    errordlg('Please enter a numeric value','Invalid Input','modal')
    set(handles.edit3,'string','210');
end


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global pointload moment udl ldl;
pointload=get(handles.uitable6,'Data');
moment=get(handles.uitable11,'Data');
udl=get(handles.uitable12,'Data');
ldl=get(handles.uitable13,'Data');
global RA RB length EI;
RA=0;
RB=0;
counter=1;
while counter<1001
    distance=ldl(counter,4)-ldl(counter,2);
    
    add=ldl(counter,1)+ldl(counter,3);
    
    add2=ldl(counter,1)+2*ldl(counter,3);
    
    RA=RA+pointload(counter,1)*(length-pointload(counter,2))+moment(counter,1)+udl(counter,1)*(udl(counter,3)-udl(counter,2))*(length-(udl(counter,2)+udl(counter,3))/2);
    RB=RB+pointload(counter,1)*(pointload(counter,2))-moment(counter,1)+udl(counter,1)*(udl(counter,3)-udl(counter,2))*((udl(counter,2)+udl(counter,3))/2);
    
    if add~=0
        RA=RA+0.5*((ldl(counter,1)+ldl(counter,3))*distance)*(length-ldl(counter,2)-((distance/3)*add2/add));
        RB=RB+0.5*((ldl(counter,1)+ldl(counter,3))*distance)*(ldl(counter,2)+((distance/3)*add2/add));
    end
    
    
    counter=counter+1;
end
RA=RA/length;
RB=RB/length;
i=0:length/1000:length;
sf=shearforcediagram(RA, pointload, udl, ldl, length);
sf=-1*sf;
plot(handles.axes2,i,sf);
title(handles.axes2,'Shear Force Diagram');

counter=2;
j=zeros(size(sf));
j(1)=0;

while counter<=1001
    j(counter)=j(counter-1)+sf(counter)*(length/1000);
    counter=counter+1;
end
flag=0;
counter=1;
while counter<1001
    if moment(counter,1)~=0
        n=floor(moment(counter,2)*1000/length )+ 1;
        if n==1001
            flag=flag+moment(counter,1);
        end
        r=moment(counter,1);
        while n<=1001
        j(n)=j(n)+r;
        n=n+1;
        end
    end
    counter=counter+1;
end

error=(j(1001)-flag)/1000;
counter=2;
if flag==0
    while counter<=1001
        j(counter)=j(counter)-error*(counter-1);
        counter=counter+1;
    end
else
    j(1001)=-flag;
end

plot(handles.axes3,i,j)
title(handles.axes3,'Bending Moment Diagram');
t=deflection(j,EI,length);
plot(handles.axes4,i,t);

title(handles.axes4,'Deflected Shape');
a=num2str(RA);
b=num2str(RB);
set(handles.text8,'string',a);
set(handles.text7,'string',b);


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4

%selectedIdx = get(hObject, 'Value')

str={'Rectangle','Circle','I-shape'};
s = listdlg('PromptString','Select the shape :','SelectionMode','single','ListString',str);
if s==1
    dimensions=inputdlg({'Width','Height'},'Cross-section',1,{'10','10'});
    inertia=str2double(dimensions(1))*(str2double(dimensions(2)))^3/12;
elseif s==2
    dimensions=inputdlg({'Radius'},'Cross-section',1,{'10'});
    inertia=(str2double(dimensions))^4*pi/4;
elseif s==[3]
    topdimensions=inputdlg({'length','thickness'},'Top & Bottom Part',1,{'1000','19'});
    middledimensions=inputdlg({'Width','Height'},'Mid Section',1,{'300','36'});
    a=[str2double(topdimensions(1)), str2double(topdimensions(2)), str2double(middledimensions(1)), str2double(middledimensions(2))];
    inertia=2*((1/12*a(1)*a(2)^3)+(a(1)*a(2)*a(4)^2))+(1/12*a(3)*a(4)^3);
end
global  young EI;

EI=ones(1,1001)*inertia;

EI=EI*young*10^-3;


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

global z;
%z=0;

if z==0
grid(handles.axes4,'on');
grid(handles.axes4,'minor');
grid(handles.axes2,'on');
grid(handles.axes2,'minor');
grid(handles.axes3,'on');
grid(handles.axes3,'minor');
z=1;
elseif z==1
grid(handles.axes4,'on');
grid(handles.axes4,'minor');
grid(handles.axes2,'on');
grid(handles.axes2,'minor');
grid(handles.axes3,'on');
grid(handles.axes3,'minor');
z=2;
elseif z==2
grid(handles.axes2,'off');
grid(handles.axes3,'off');
grid(handles.axes4,'off');
z=0;
end

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on uitable13 and none of its controls.
function uitable13_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable13 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
