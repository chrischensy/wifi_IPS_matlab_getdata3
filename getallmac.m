function [ out ] = getallmac( input_args )
%GETALLMAC Summary of this function goes here
%   Detailed explanation goes here
    fidout = fopen('allmacs.txt','w');
    indirpath = 'wifiscan/';
    dirtemp=dir([indirpath,'*.txt']);
    numbersoffile=length(dirtemp);
    %disp(numbersoffile);
    macset = {};
    for i=1:numbersoffile
        filename=[indirpath,dirtemp(i).name];
        %disp(filename);
        fidin = fopen(filename,'r');
        while ~feof(fidin) %�ж��Ƿ�Ϊ�ļ�ĩβ
            tline = fgetl(fidin);%���ļ�����
            mac = tline(1:17);
            macset(length(macset)+1) = cellstr(mac);
        end
        fclose(fidin);    
    end
    s = tabulate(macset(:));
    out = sortrows(s,size(s,2));
    disp(out(:,1:2));
    for i = 1:length(out)
        fprintf(fidout,'%c',char(out(i,1)));
        fprintf(fidout,'\n');
    end
    fclose(fidout);
end

