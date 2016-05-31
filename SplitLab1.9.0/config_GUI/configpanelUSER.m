% Splitlab Configuration GUI helper function
    x = 15;
    y = 160;
    w = 305;
    v = 15; 
h.panel(4) = uipanel('Units','pixel','Title','User info','Position',[130 205 425 210], 'BackgroundColor', [224   223   227]/255 , 'Visible','off');

%% field descriptions text
txt = {'User name:';
    'Institut:';
    'Adress:';
    'Phone:';
    'Fax:';
    'email:'};

for i=0:5   
     uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','text',...
                             'Position',[x y-(i*v*2) 200 20],...
                             'String', txt{i+1},...
                             'HorizontalAlignment','Left');    
end  

%% user and internet settings 
x=100;
uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[x y w 20],...
                             'String', config.request.user,...
                           'Callback', 'config.request.user=get(gcbo,''String'');'); 
uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[x y-2*v w 20],...
                             'String', config.request.institut,...
                           'Callback', 'config.request.institut=get(gcbo,''String'');'); 
uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[x y-4*v w 20],...
                             'String', config.request.adress,...
                           'Callback', 'config.request.adress=get(gcbo,''String'');'); 
uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[x y-6*v w 20],...
                             'String', config.request.phone,...
                           'Callback', 'config.request.phone=get(gcbo,''String'');'); 
uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[x y-8*v w 20],...
                             'String', config.request.fax,...
                           'Callback', 'config.request.fax=get(gcbo,''String'');');                  
                           
                           
h.eqdata(19) = uicontrol('Parent',h.panel(4),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[x y-10*v-1 w 21],...
                             'String', char(config.request.usermail),...
                             'Callback','config.request.usermail=char(get(gcbo,''String''));'); 
%set(h.eqdata(18),'Userdata',h.eqdata(19))


%%
h.panel(5)   = uipanel('Units','pixel','Title','Data request info','Position',[130 5 425 190], 'BackgroundColor', [224   223   227]/255 , 'Visible','off');
reqformstr   = {'BreqFast','NetDC','AutoDRM (iris)','Curl','ASCII table'};
val          = strmatch(config.request.format, reqformstr);
h.eqdata(19) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','PopupMenu',...
                             'BackgroundColor','w',...
                             'Value', val,...
                             'Position',[150 140 100 20],...
                             'HorizontalAlignment','right',...
                             'String', reqformstr,...
                             'CallBack','tmp1=get(gcbo,''Value''); tmp2=get(gcbo,''String''); config.request.format=char(tmp2(tmp1));clear tmp1 tmp2'); 

h.eqdata(19) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[335 140 60 20],...
                             'HorizontalAlignment','center',...
                             'String', config.request.comp,...
                             'TooltipString','Component identifier (e.g. BH?)',... 
                             'CallBack','config.request.comp=get(gcbo,''String'');'); 
uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','text',...
                             'HorizontalAlignment','Left',...
                             'Position',[270 145 60 12],...
                             'String', 'Component:'); 
                         
                         

val          = strmatch(config.request.mailto, config.request.DataCenters); 
if isempty(val),val=1;end
h.eqdata(21) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','PopupMenu',...
                             'Value', val,...
                             'BackgroundColor','w',...
                             'Position',[150 110  200 20],...
                             'String', config.request.DataCenters,...
                             'CallBack','tmp1=get(gcbo,''Value''); tmp2=lower(get(gcbo,''String'')); config.request.mailto=char(tmp2(tmp1)); clear tmp1 tmp2'); 

h.eqdata(99) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','pushbutton',...
                             'Position',[355 109 40 21],...
                             'String', 'Add',...
                             'userdata',h.eqdata(21),...
                             'ToolTipString','Add an email address to list of data centers',...
                             'callback',['tmp=char(inputdlg(''Data Center address''));',...
                                         'if all(~isempty(tmp), sum(strcmp(config.request.DataCenters,tmp))==0); ',...
                                         'config.request.DataCenters{end+1} = tmp;',...
                                         'config.request.mailto = tmp;',...
                                         'setpref(''Splitlab'',''request'', config.request);',...
                                         'set(get(gcbo,''userdata''),''String'',config.request.DataCenters);',...
                                         'end, clear tmp']); 
 
h.eqdata(20) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[150 80 80 21],...
                             'String', num2str(config.request.reqtime(1)),...
                             'Callback','config.request.reqtime(1) = str2num(get(gcbo,''String''));'); 
h.eqdata(20) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','Edit',...
                             'BackgroundColor','w',...
                             'Position',[150 50 80 21],...
                             'String', num2str(config.request.reqtime(2)),...
                             'Callback','config.request.reqtime(2) = str2num(get(gcbo,''String''));'); 




h.eqdata(21) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','pushbutton','Fontsize',get(0,'DefaultUIcontrolFontSize')+2,...
                             'Position',[150 8 130 34],...
                             'String', 'Send request mail',...
                             'callback','SL_request'); 
                             
h.eqdata(21) = uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','pushbutton','Fontsize',get(0,'DefaultUIcontrolFontSize')-2,...
                             'Position',[10 8 80 20],...
                             'String', 'See also...',...
                             'TooltipString','http://www.seis.sc.edu/SOD/index.html',...
                             'callback','web http://www.seis.sc.edu/SOD/index.html -browser'); 
 
axes( 'parent',h.panel(5), 'Units','pixel','position', [320 25 48 48] )
image(icon.send)
axis off
                      
uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','text',...
                             'HorizontalAlignment','Left',...
                             'Position',[10 145 70 10],...
                             'String', 'Format:'); 
uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','text',...
                             'HorizontalAlignment','Left',...
                             'Position',[10 115 70 10],...
                             'String', 'Adress:'); 
                         
uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','text',...
                             'HorizontalAlignment','Left',...
                             'Position',[10 85 140 12],...
                             'String', 'Request start time [sec]:'); 
uicontrol('Parent',h.panel(5),'Units','pixel',...
                             'Style','text',...
                             'HorizontalAlignment','Left',...
                             'Position',[10 55 130 12],...
                             'String', 'Request stop time [sec]:'); 
                         