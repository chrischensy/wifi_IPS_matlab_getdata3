function [ output ] = outputdata( input_args )
%OUTPUTDATA Summary of this function goes here
%   Detailed explanation goes here
    %delete(data.txt);
    macset = {};
    fidin = fopen('macselect.txt','r');
    while ~feof(fidin) %判断是否为文件末尾
        tline = fgetl(fidin);%从文件读行
        mac = tline(1:17);
        macset(length(macset)+1) = cellstr(mac);
    end
    fclose(fidin);
    %disp(macset);
    
    positions = {};
    fidin = fopen('transpositions.txt','r');
    while ~feof(fidin) %判断是否为文件末尾
        position = fgetl(fidin);%从文件读行
        positions(length(positions)+1) = cellstr(position);
    end
    fclose(fidin);
    %disp(positions);
    
    fidout = fopen('data.txt','w');
    indirpath = 'wifiscan/';
    dirtemp=dir([indirpath,'*.txt']);
    numbersoffile=length(dirtemp);
    disp(numbersoffile)
    for i=1:numbersoffile
        filename=[indirpath,dirtemp(i).name];
        fidin = fopen(filename,'r');
        rssiset = [];
        while ~feof(fidin) %判断是否为文件末尾

            tline = fgetl(fidin);%从文件读行
            %disp(tline);
            
            mac = tline(1:17);
            for j=1:length(macset)
                if strcmp(mac,macset(j))
                    rssistr = tline(19:length(tline));
                    %disp(rssistr);
                    rssi = str2num(rssistr);
                    if length(rssi)<5
                        mediarssi = -93.00000
                    else
                        mediarssi = median(rssi);
                    end
                    %disp(mediarssi);
                    rssiset(j) = mediarssi;
                    break;
                end
            end
        end
        rssiset(find(rssiset>=0))=-93.00000;
        fprintf(fidout,'%s',positions{i});
        for j=1:length(macset)
            fprintf(fidout,',%f',rssiset(j));
        end
        fprintf(fidout,'\n');
        fclose(fidin);
        output(i,:)=rssiset;
    end
    fclose(fidout);
end

