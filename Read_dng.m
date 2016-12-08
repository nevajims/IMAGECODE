warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning

start_number = 9450;
end_number   = 9590;
%aviobj = avifile('try.avi');
aviobj = VideoWriter('Video.avi');
aviobj.FrameRate = 30;
open(aviobj)
cmap = gray(256);

for index = start_number:end_number
num_el     =   numel(num2str(index)) ;
num_zeros  =   8 - num_el            ;
zero_prefix = '';

if num_zeros >0
for index_2 = 1 : num_zeros
zero_prefix = [zero_prefix,'0'];
end %for index_2 = 1 : num_zeros
end
temp_file_name = [zero_prefix,num2str(index),'.DNG'];
%disp(temp_file_name)
t = Tiff(temp_file_name,'r');
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));
cfa  = read(t);
cfa2 = im2uint8(cfa);
close(t)
%aviobj = addframe(aviobj,cmap2);

writeVideo(aviobj, cfa2);

disp(['adding frame = %i\n',temp_file_name])

end %for index = start_number:end_number

disp('Closing movie file...')
%aviobj = close(aviobj);

disp('Playing movie file...')
implay('Video.avi');
close(aviobj);

%writerObj.FrameRate = 30;
%aviobj = close(aviobj);
%t = Tiff('00006246.DNG','r');
%offsets = getTag(t,'SubIFD');
%setSubDirectory(t,offsets(1));
%cfa = read(t);
%close(t);

% 00005222
% 00005500

% files = dir('folder_1');
%aviobj = avifile('a.avi'); %creating a movie object

%for i=1:numel(files) %number of images to be read
%    a = hdrread(file(i));  
%    a = uint8(a);%convert the images into unit8 type
%    M = im2frame(a);%convert the images into frames
%    aviobj = addframe(aviobj,M);%add the frames to the avi object created previously
%    fprintf('adding frame = %i\n', i);
%end

%disp('Closing movie file...')
%aviobj = close(aviobj);
%disp('Playing movie file...')
%implay('a.avi');

%---------------------------------------------------------------
% Create a video writer object
%writerObj = VideoWriter('Video.avi');

% Set frame rate
%writerObj.FrameRate = 30;

% Open video writer object and write frames sequentially
%open(writerObj)

%for i = 1:30                   % Some number of frames
     % Read frame
 %    frame = sprintf('frame %d.jpg', i);
 %   input = imread(frame);

     % Write frame now
 %    writeVideo(writerObj, input);
%end

% Close the video writer object
%close(writerObj);

% 'Video.avi' will be created in the folder that contains the code.