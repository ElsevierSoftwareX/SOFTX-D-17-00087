function cm=get_colormap
%Builds and returns a colormap
%
%Output arguments
%  cm: Colormap

  
    %Start with inverted copper colormap
    cm=flipud(copper);
    %Set to white the lower intensities
    sz=size(cm,1)/3;    
    for i=1:sz
        cm(i,:)=(cm(i,:)*i+[1 1 1]*(sz-i))/sz;
    end;
