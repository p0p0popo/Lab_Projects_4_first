function varargout = OurProject(varargin)
% OURPROJECT MATLAB code for OurProject.fig
%      OURPROJECT, by itself, creates a new OURPROJECT or raises the existing
%      singleton*.
%
%      H = OURPROJECT returns the handle to a new OURPROJECT or the handle to
%      the existing singleton*.
%
%      OURPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OURPROJECT.M with the given input arguments.
%
%      OURPROJECT('Property','Value',...) creates a new OURPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OurProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OurProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OurProject

% Last Modified by GUIDE v2.5 21-Mar-2021 06:48:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OurProject_OpeningFcn, ...
                   'gui_OutputFcn',  @OurProject_OutputFcn, ...
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



% --- Executes just before OurProject is made visible.
function OurProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OurProject (see VARARGIN)

% Choose default command line output for OurProject
handles.output = hObject;

set(handles.axes1,'visible','of');
set(handles.axes2,'visible','of');
set(handles.axes3,'visible','of');
set(handles.axes4,'visible','of');
set(handles.axes5,'visible','of');
set(handles.axes6,'visible','of');
set(handles.axes7,'visible','of');
% Update handles structure
guidata(hObject, handles);



% UIWAIT makes OurProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = OurProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%*************************************************************************

% --- Executes on button press in select_image.
function select_image_Callback(hObject, eventdata, handles)
% hObject    handle to select_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global GrayImg;

[file,path]= uigetfile({'*.*'});
imageLocation = fullfile(path,file); 

RGB = imread(imageLocation);

axes(handles.axes1);
imshow(RGB);

GrayImg = rgb2gray(RGB);
axes(handles.axes5);
imhist(GrayImg);
enhanced = histeq(GrayImg);
axes(handles.axes6);
imhist(enhanced);
axes(handles.axes7);
imshow(enhanced);





% --- Executes on selection change in EdgeMenu.
function EdgeMenu_Callback(hObject, eventdata, handles)
% hObject    handle to EdgeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global GrayImg ;
Choice = get(handles.EdgeMenu,'Value');
Edge = GrayImg;
switch Choice 
    case 2 
        Edge = edge(GrayImg ,'Roberts')
    case 3 
        Edge = edge(GrayImg ,'Prewitt')
    case 4 
        Edge = edge(GrayImg ,'Sobel')
    case 5 
        Edge = edge(GrayImg ,'canny')
    case 6
        Edge = edge(GrayImg ,'Log')
    case 7
        gaussian1 = fspecial('Gaussian', 21, 15);
        gaussian2 = fspecial('Gaussian', 21, 20);
        dog = gaussian1 - gaussian2;
        Edge = conv2(double(GrayImg), dog);

    otherwise
        disp(' You Did Not CHoose Any Filter Yet')
        
end
axes(handles.axes2);

imshow(Edge);


% Let's compute and display the histogram.

%[pixelCount grayLevels] = hist(GrayImg(:));
%bar(grayLevels, pixelCount);
%grid on;
%title('Histogram of DOG Filtered Image', 'FontSize', fontSize);




% Hints: contents = cellstr(get(hObject,'String')) returns EdgeMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EdgeMenu


% --- Executes during object creation, after setting all properties.
function EdgeMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EdgeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in AddNoise.
function AddNoise_Callback(hObject, eventdata, handles)
% hObject    handle to AddNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GrayImg ;
Choice = get(handles.AddNoise,'Value');
global Noise ;

switch Choice 
    case 2 
        Noise = imnoise(GrayImg ,'salt & pepper')
    case 3 
        Noise = imnoise(GrayImg ,'gaussian')
    
    otherwise
        disp(' You Did Not CHoose Any Noise Yet')
        
end
axes(handles.axes3);
if isequal(Choice,1)
    imshow(GrayImg);
else
    imshow(Noise);
end

% Hints: contents = cellstr(get(hObject,'String')) returns AddNoise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AddNoise


% --- Executes during object creation, after setting all properties.
function AddNoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AddNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in RemoveNoise.
function RemoveNoise_Callback(hObject, eventdata, handles)
% hObject    handle to RemoveNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Choice = get(handles.RemoveNoise,'Value');
global Noise ;

switch Choice 
    case 2 
        Filtered = filter2(fspecial('average',3),Noise)/255; 
    case 3 
        Filtered = medfilt2(Noise);            
    otherwise
        disp(' You Did Not CHoose Any Noise Yet')
        
end
axes(handles.axes4);
if isequal(Choice,1)
    imshow(Noise);
else
    imshow(Filtered);
end

% Hints: contents = cellstr(get(hObject,'String')) returns RemoveNoise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RemoveNoise


% --- Executes during object creation, after setting all properties.
function RemoveNoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RemoveNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
