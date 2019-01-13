function varargout = GUIFinal(varargin)
% GUIFINAL MATLAB code for GUIFinal.fig
%      GUIFINAL, by itself, creates a new GUIFINAL or raises the existing
%      singleton*.
%
%      H = GUIFINAL returns the handle to a new GUIFINAL or the handle to
%      the existing singleton*.
%
%      GUIFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIFINAL.M with the given input arguments.
%
%      GUIFINAL('Property','Value',...) creates a new GUIFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIFinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIFinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIFinal

% Last Modified by GUIDE v2.5 13-Jun-2017 23:38:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIFinal_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIFinal_OutputFcn, ...
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


% --- Executes just before GUIFinal is made visible.
function GUIFinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIFinal (see VARARGIN)

% Choose default command line output for GUIFinal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIFinal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIFinal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SetImpulse.
function SetImpulse_Callback(hObject, eventdata, handles)
% hObject    handle to SetImpulse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if getappdata(0,'Tf') == 0
    tof = getappdata(0,'T2') - getappdata(0,'T1');
else tof = getappdata(0,'Tf');
end

setappdata(0,'tof',tof)

x0 = [getappdata(0,'dv1') getappdata(0,'fpa1') getappdata(0,'psi1') getappdata(0,'dv2') getappdata(0,'fpa2') getappdata(0,'psi2') tof];

x0lgic = [get(handles.cdv1,'value') get(handles.cfpa1,'value') get(handles.cpsi1,'value') get(handles.cdv2,'value') get(handles.cfpa2,'value') get(handles.cpsi2,'value') get(handles.ctof,'value')];

setappdata(0,'x0',x0)
setappdata(0,'x0lgic',x0lgic)



% --- Executes on button press in cdv2.
function cdv2_Callback(hObject, eventdata, handles)
% hObject    handle to cdv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cdv2




% --- Executes on button press in cfpa2.
function cfpa2_Callback(hObject, eventdata, handles)
% hObject    handle to cfpa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfpa2




% --- Executes on button press in cpsi2.
function cpsi2_Callback(hObject, eventdata, handles)
% hObject    handle to cpsi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cpsi2




function dv2_Callback(hObject, eventdata, handles)
% hObject    handle to dv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dv2 as text
%        str2double(get(hObject,'String')) returns contents of dv2 as a double
dv2 = str2double(get(hObject,'string'));
setappdata(0,'dv2',dv2)


% --- Executes during object creation, after setting all properties.
function dv2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fpa2_Callback(hObject, eventdata, handles)
% hObject    handle to fpa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fpa2 as text
%        str2double(get(hObject,'String')) returns contents of fpa2 as a double
fpa2 = str2double(get(hObject,'string'));
setappdata(0,'fpa2',fpa2)


% --- Executes during object creation, after setting all properties.
function fpa2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fpa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psi2_Callback(hObject, eventdata, handles)
% hObject    handle to psi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psi2 as text
%        str2double(get(hObject,'String')) returns contents of psi2 as a double
psi2 = str2double(get(hObject,'string'));
setappdata(0,'psi2',psi2)


% --- Executes during object creation, after setting all properties.
function psi2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cdv1.
function cdv1_Callback(hObject, eventdata, handles)
% hObject    handle to cdv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cdv1




% --- Executes on button press in cfpa1.
function cfpa1_Callback(hObject, eventdata, handles)
% hObject    handle to cfpa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cfpa1




% --- Executes on button press in cpsi1.
function cpsi1_Callback(hObject, eventdata, handles)
% hObject    handle to cpsi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cpsi1





function dv1_Callback(hObject, eventdata, handles)
% hObject    handle to dv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dv1 as text
%        str2double(get(hObject,'String')) returns contents of dv1 as a double
dv1 = str2double(get(hObject,'string'));
setappdata(0,'dv1',dv1)


% --- Executes during object creation, after setting all properties.
function dv1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fpa1_Callback(hObject, eventdata, handles)
% hObject    handle to fpa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fpa1 as text
%        str2double(get(hObject,'String')) returns contents of fpa1 as a double
fpa1 = str2double(get(hObject,'string'));
setappdata(0,'fpa1',fpa1)


% --- Executes during object creation, after setting all properties.
function fpa1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fpa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psi1_Callback(hObject, eventdata, handles)
% hObject    handle to psi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psi1 as text
%        str2double(get(hObject,'String')) returns contents of psi1 as a double
psi1 = str2double(get(hObject,'string'));
setappdata(0,'psi1',psi1)


% --- Executes during object creation, after setting all properties.
function psi1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V0x_Callback(hObject, eventdata, handles)
% hObject    handle to V0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V0x as text
%        str2double(get(hObject,'String')) returns contents of V0x as a double
V0x = str2double(get(hObject,'string'));
setappdata(0,'V0x',V0x)


% --- Executes during object creation, after setting all properties.
function V0x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V0y_Callback(hObject, eventdata, handles)
% hObject    handle to V0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V0y as text
%        str2double(get(hObject,'String')) returns contents of V0y as a double
V0y = str2double(get(hObject,'string'));
setappdata(0,'V0y',V0y)


% --- Executes during object creation, after setting all properties.
function V0y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V0z_Callback(hObject, eventdata, handles)
% hObject    handle to V0z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V0z as text
%        str2double(get(hObject,'String')) returns contents of V0z as a double
V0z = str2double(get(hObject,'string'));
setappdata(0,'V0z',V0z)


% --- Executes during object creation, after setting all properties.
function V0z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V0z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R0x_Callback(hObject, eventdata, handles)
% hObject    handle to R0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R0x as text
%        str2double(get(hObject,'String')) returns contents of R0x as a double
R0x = str2double(get(hObject,'string'));
setappdata(0,'R0x',R0x)


% --- Executes during object creation, after setting all properties.
function R0x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R0x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R0y_Callback(hObject, eventdata, handles)
% hObject    handle to R0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R0y as text
%        str2double(get(hObject,'String')) returns contents of R0y as a double
R0y = str2double(get(hObject,'string'));
setappdata(0,'R0y',R0y)


% --- Executes during object creation, after setting all properties.
function R0y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R0y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R0z_Callback(hObject, eventdata, handles)
% hObject    handle to R0z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R0z as text
%        str2double(get(hObject,'String')) returns contents of R0z as a double
R0z = str2double(get(hObject,'string'));
setappdata(0,'R0z',R0z)


% --- Executes during object creation, after setting all properties.
function R0z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R0z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cvbc.
function cvbc_Callback(hObject, eventdata, handles)
% hObject    handle to cvbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cvbc



% --- Executes on button press in crbc.
function crbc_Callback(hObject, eventdata, handles)
% hObject    handle to crbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crbc




% --- Executes on button press in cebc.
function cebc_Callback(hObject, eventdata, handles)
% hObject    handle to cebc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cebc





function Vbc_Callback(hObject, eventdata, handles)
% hObject    handle to Vbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vbc as text
%        str2double(get(hObject,'String')) returns contents of Vbc as a double
Vbc = get(hObject,'string');

if Vbc == '*'
    Vbc = [];
else
    Vbc = str2double(Vbc);
end

setappdata(0,'Vbc',Vbc)


% --- Executes during object creation, after setting all properties.
function Vbc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rbc_Callback(hObject, eventdata, handles)
% hObject    handle to Rbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rbc as text
%        str2double(get(hObject,'String')) returns contents of Rbc as a double
Rbc = get(hObject,'string');

if Rbc == '*'
    Rbc = [];
else
    Rbc = str2double(Rbc);
end

setappdata(0,'Rbc',Rbc)


% --- Executes during object creation, after setting all properties.
function Rbc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rbc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ebc_Callback(hObject, eventdata, handles)
% hObject    handle to ebc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ebc as text
%        str2double(get(hObject,'String')) returns contents of ebc as a double
ebc = get(hObject,'string');

if ebc == '*'
    ebc = [];
else
    ebc = str2double(ebc);
end

setappdata(0,'ebc',ebc)


% --- Executes during object creation, after setting all properties.
function ebc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ebc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cabc.
function cabc_Callback(hObject, eventdata, handles)
% hObject    handle to cabc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cabc



% --- Executes on button press in cenergybc.
function cenergybc_Callback(hObject, eventdata, handles)
% hObject    handle to cenergybc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cenergybc




function Abc_Callback(hObject, eventdata, handles)
% hObject    handle to Abc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Abc as text
%        str2double(get(hObject,'String')) returns contents of Abc as a double
abc = get(hObject,'string');

if abc == '*'
    abc = [];
else
    abc = str2double(abc);
end

setappdata(0,'abc',abc)




% --- Executes during object creation, after setting all properties.
function Abc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Abc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function energybc_Callback(hObject, eventdata, handles)
% hObject    handle to energybc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of energybc as text
%        str2double(get(hObject,'String')) returns contents of energybc as a double
energybc = get(hObject,'string');

if energybc == '*'
    energybc = [];
else
    energybc = str2double(energybc);
end

setappdata(0,'energybc',energybc)


% --- Executes during object creation, after setting all properties.
function energybc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to energybc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SetBC.
function SetBC_Callback(hObject, eventdata, handles)
% hObject    handle to SetBC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.cvbc,'value') == 1 || get(handles.crbc,'value') == 1 || get(handles.cebc,'value') == 1 || get(handles.cibc,'value') == 1 || get(handles.cabc,'value') == 1 ||  get(handles.cenergybc,'value') == 1
    
    BCus = [getappdata(0,'Vbc'),getappdata(0,'Rbc'),getappdata(0,'ebc'),getappdata(0,'ibc'),getappdata(0,'abc'),getappdata(0,'energybc')];
    BCuslgic = [get(handles.cvbc,'value'),get(handles.crbc,'value'),get(handles.cebc,'value'),get(handles.cibc,'value'),get(handles.cabc,'value'),get(handles.cenergybc,'value')];
else
    BCus = [getappdata(0,'vbcx'),getappdata(0,'vbcy'),getappdata(0,'vbcz'),getappdata(0,'rbcx'),getappdata(0,'rbcy'),getappdata(0,'rbcz')];
    BCuslgic = [get(handles.cvbcx,'value'),get(handles.cvbcy,'value'),get(handles.cvbcz,'value'),get(handles.crbcx,'value'),get(handles.crbcy,'value'),get(handles.crbcz,'value')];
end
    
setappdata(0,'BCus',BCus)
setappdata(0,'BCuslgic',BCuslgic)


% --- Executes on button press in SetRV.
function SetRV_Callback(hObject, eventdata, handles)
% hObject    handle to SetRV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if getappdata(0,'R0x') == 0 && getappdata(0,'R0y') == 0 && getappdata(0,'R0z') == 0
    [R0,V0] = oetorv(getappdata(0,'a0'),getappdata(0,'e0'),getappdata(0,'i0'),getappdata(0,'raan0'),getappdata(0,'aop0'),getappdata(0,'ta0'))
else
    R0 = [getappdata(0,'R0x') getappdata(0,'R0y') getappdata(0,'R0z')];
    V0 = [getappdata(0,'V0x') getappdata(0,'V0y') getappdata(0,'V0z')];
end

setappdata(0,'R0',R0)
setappdata(0,'V0',V0)
    



function e0_Callback(hObject, eventdata, handles)
% hObject    handle to e0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e0 as text
%        str2double(get(hObject,'String')) returns contents of e0 as a double
e0 = str2double(get(hObject,'string'));
setappdata(0,'e0',e0)


% --- Executes during object creation, after setting all properties.
function e0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a0_Callback(hObject, eventdata, handles)
% hObject    handle to a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a0 as text
%        str2double(get(hObject,'String')) returns contents of a0 as a double
a0 = str2double(get(hObject,'string'));
setappdata(0,'a0',a0)


% --- Executes during object creation, after setting all properties.
function a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i0_Callback(hObject, eventdata, handles)
% hObject    handle to i0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i0 as text
%        str2double(get(hObject,'String')) returns contents of i0 as a double
i0 = str2double(get(hObject,'string'));
setappdata(0,'i0',i0)


% --- Executes during object creation, after setting all properties.
function i0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function raan0_Callback(hObject, eventdata, handles)
% hObject    handle to raan0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of raan0 as text
%        str2double(get(hObject,'String')) returns contents of raan0 as a double
raan0 = str2double(get(hObject,'string'));
setappdata(0,'raan0',raan0)


% --- Executes during object creation, after setting all properties.
function raan0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to raan0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aop0_Callback(hObject, eventdata, handles)
% hObject    handle to aop0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aop0 as text
%        str2double(get(hObject,'String')) returns contents of aop0 as a double
aop0 = str2double(get(hObject,'string'));
setappdata(0,'aop0',aop0)


% --- Executes during object creation, after setting all properties.
function aop0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aop0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ta0_Callback(hObject, eventdata, handles)
% hObject    handle to ta0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ta0 as text
%        str2double(get(hObject,'String')) returns contents of ta0 as a double
ta0 = str2double(get(hObject,'string'));
setappdata(0,'ta0',ta0)


% --- Executes during object creation, after setting all properties.
function ta0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ta0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in results.
function results_Callback(hObject, eventdata, handles)
% hObject    handle to results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.cvbc,'value') == 1 || get(handles.crbc,'value') == 1 || get(handles.cebc,'value') == 1 || get(handles.cibc,'value') == 1 || get(handles.cabc,'value') == 1 ||  get(handles.cenergybc,'value') == 1
    [vresult, rresult, G, DV1, DV2, toff] = solve_plot(getappdata(0,'V0'),getappdata(0,'R0'),getappdata(0,'BCus'),getappdata(0,'BCuslgic'),getappdata(0,'x0'),getappdata(0,'x0lgic'),get(handles.mu,'value'));
else
    [vresult, rresult, G, DV1, DV2, toff] = solve_plot4(getappdata(0,'V0'),getappdata(0,'R0'),getappdata(0,'BCus'),getappdata(0,'BCuslgic'),getappdata(0,'x0'),getappdata(0,'x0lgic'),get(handles.mu,'value'));
end

setappdata(0,'vresult',vresult)
setappdata(0,'rresult',rresult)
setappdata(0,'G',G)
setappdata(0,'DV1',DV1)
setappdata(0,'DV2',DV2)
setappdata(0,'toff',toff)

set(handles.vresult,'string',vresult)
set(handles.rresult,'string',rresult)
set(handles.G,'string',G)
set(handles.DV1,'string',DV1)
set(handles.DV2,'string',DV2)
set(handles.toff,'string',toff)





function T1_Callback(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T1 as text
%        str2double(get(hObject,'String')) returns contents of T1 as a double
T1 = str2double(get(hObject,'string'));
setappdata(0,'T1',T1)



% --- Executes during object creation, after setting all properties.
function T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T2_Callback(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T2 as text
%        str2double(get(hObject,'String')) returns contents of T2 as a double
T2 = str2double(get(hObject,'string'));
setappdata(0,'T2',T2)




% --- Executes during object creation, after setting all properties.
function T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ctof.
function ctof_Callback(hObject, eventdata, handles)
% hObject    handle to ctof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ctof




function Tf_Callback(hObject, eventdata, handles)
% hObject    handle to Tf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tf as text
%        str2double(get(hObject,'String')) returns contents of Tf as a double

Tf = str2double(get(hObject,'string'));
setappdata(0,'Tf',Tf)



% --- Executes during object creation, after setting all properties.
function Tf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ibc_Callback(hObject, eventdata, handles)
% hObject    handle to ibc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ibc as text
%        str2double(get(hObject,'String')) returns contents of ibc as a double
ibc = get(hObject,'string');

if ibc == '*'
    ibc = [];
else
    ibc = str2double(ibc);
end

setappdata(0,'ibc',ibc)


% --- Executes during object creation, after setting all properties.
function ibc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ibc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cibc.
function cibc_Callback(hObject, eventdata, handles)
% hObject    handle to cibc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cibc



% --- Executes on button press in mu.
function mu_Callback(hObject, eventdata, handles)
% hObject    handle to mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mu
mu = get(hObject,'value');
setappdata(0,'mu',mu)

function cdv1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in crbcx.
function crbcx_Callback(hObject, eventdata, handles)
% hObject    handle to crbcx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crbcx


% --- Executes on button press in crbcy.
function crbcy_Callback(hObject, eventdata, handles)
% hObject    handle to crbcy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crbcy


% --- Executes on button press in crbcz.
function crbcz_Callback(hObject, eventdata, handles)
% hObject    handle to crbcz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crbcz



function rbcx_Callback(hObject, eventdata, handles)
% hObject    handle to rbcx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rbcx as text
%        str2double(get(hObject,'String')) returns contents of rbcx as a double
rbcx = get(hObject,'string');

if rbcx == '*'
    rbcx = [];
else
    rbcx = str2double(rbcx);
end

setappdata(0,'rbcx',rbcx)


% --- Executes during object creation, after setting all properties.
function rbcx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rbcx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rbcy_Callback(hObject, eventdata, handles)
% hObject    handle to rbcy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rbcy as text
%        str2double(get(hObject,'String')) returns contents of rbcy as a double
rbcy = get(hObject,'string');

if rbcy == '*'
    rbcy = [];
else
    rbcy = str2double(rbcy);
end

setappdata(0,'rbcy',rbcy)


% --- Executes during object creation, after setting all properties.
function rbcy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rbcy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rbcz_Callback(hObject, eventdata, handles)
% hObject    handle to rbcz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rbcz as text
%        str2double(get(hObject,'String')) returns contents of rbcz as a double
rbcz = get(hObject,'string');

if rbcz == '*'
    rbcz = [];
else
    rbcz = str2double(rbcz);
end

setappdata(0,'rbcz',rbcz)


% --- Executes during object creation, after setting all properties.
function rbcz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rbcz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cvbcx.
function cvbcx_Callback(hObject, eventdata, handles)
% hObject    handle to cvbcx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cvbcx


% --- Executes on button press in cvbcy.
function cvbcy_Callback(hObject, eventdata, handles)
% hObject    handle to cvbcy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cvbcy


% --- Executes on button press in cvbcz.
function cvbcz_Callback(hObject, eventdata, handles)
% hObject    handle to cvbcz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cvbcz



function vbcx_Callback(hObject, eventdata, handles)
% hObject    handle to vbcx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vbcx as text
%        str2double(get(hObject,'String')) returns contents of vbcx as a double
vbcx = get(hObject,'string');

if vbcx == '*'
    vbcx = [];
else
    vbcx = str2double(vbcx);
end

setappdata(0,'vbcx',vbcx) 


% --- Executes during object creation, after setting all properties.
function vbcx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vbcx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vbcy_Callback(hObject, eventdata, handles)
% hObject    handle to vbcy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vbcy as text
%        str2double(get(hObject,'String')) returns contents of vbcy as a double
vbcy = get(hObject,'string');

if vbcy == '*'
    vbcy = [];
else
    vbcy = str2double(vbcy);
end

setappdata(0,'vbcy',vbcy) 


% --- Executes during object creation, after setting all properties.
function vbcy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vbcy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vbcz_Callback(hObject, eventdata, handles)
% hObject    handle to vbcz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vbcz as text
%        str2double(get(hObject,'String')) returns contents of vbcz as a double
vbcz = get(hObject,'string');

if vbcz == '*'
    vbcz = [];
else
    vbcz = str2double(vbcz);
end

setappdata(0,'vbcz',vbcz) 


% --- Executes during object creation, after setting all properties.
function vbcz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vbcz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function SetBC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SetBC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
