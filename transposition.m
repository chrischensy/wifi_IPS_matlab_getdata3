function [ output ] = transposition( input_args )
%TRANSPOSITION Summary of this function goes here
%   Detailed explanation goes here
    output = [];
    delete('transpositions.txt');
    fidout = fopen('transpositions.txt','w');
    fidin = fopen('position.txt','r');
    i = 0;
    while ~feof(fidin) %�ж��Ƿ�Ϊ�ļ�ĩβ
        i = i+1;
        position = fgetl(fidin);%���ļ�����
        x = str2num(position(1))*10+str2num(position(2));
        y = str2num(position(4))*10+str2num(position(5));
        fprintf(fidout,'%f,%f\n',y*1.6,x*1.6);
        output(i,1)=x;
        output(i,2)=y;
    end
    fclose(fidin);
    fclose(fidout);
    %disp(positions);

end

