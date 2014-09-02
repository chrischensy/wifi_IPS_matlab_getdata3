function [ output ] = getallposition( input_args )
%GETALLPOSITION Summary of this function goes here
%   Detailed explanation goes here
    fidout = fopen('position.txt','w');
    indirpath = 'wifiscan/';
    dirtemp=dir([indirpath,'*.txt']);
    numbersoffile=length(dirtemp);
    %disp(numbersoffile);
    for i=1:numbersoffile
        filename=dirtemp(i).name;
        filename(3) = ' ';
        filename(6) = ' ';
        fprintf(fidout,'%s\n',filename);
        output{i,1} = filename;
    end
    fclose(fidout);
end

