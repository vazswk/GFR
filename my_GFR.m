function my_GFR(image_path, feature_path, QF)

QF = uint32(QF);
NR = 32; 
files = dir([image_path '\*.jpg']);
file_num = length(files);
F = single( zeros(file_num,17000) );
names = cell(file_num,1);

parfor w = 1:length(files)
    tic
    jpegfilename = [image_path '\' files(w).name];
    ImageSet = jpegfilename; 
    f = GFR(ImageSet, NR, QF); 
    F(w,:) = f(:);
    %names{w} = [num2str(w) '.jpg'];
	names{w} = files(w).name;
    toc
end
save(feature_path,'F','names');
