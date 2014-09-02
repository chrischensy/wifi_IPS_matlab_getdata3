function [ outputdatafinal ] = outputdata3()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    historyInfo = load('data.txt');
    historyInfo = historyInfo(:,3:17);
    sizeofdata = 20;
    RSSI_MIN_LEVEL = -93.0;
    p =load('transpositions.txt');
    x = p(:,1);
    y = p(:,2);
    outputdatafinal = [];
    for i =1:length(historyInfo(1,:))
        z = historyInfo(:,i);
        [outputx outputy outputdata] = griddata(x,y,z,linspace(min(x),max(x),sizeofdata)',linspace(min(y),max(y),sizeofdata),'v4');
        outputdata = outputdata';
        outputdata = outputdata(:)';
        [outputdata index] = sort(outputdata);
        outputdata(outputdata<RSSI_MIN_LEVEL) = RSSI_MIN_LEVEL;
        outputx = outputx';
        outputx = outputx(:)';
        outputy = outputy';
        outputy = outputy(:)';
        outputx = outputx(index);
        outputy = outputy(index);
        
        %outputApdata
        %outputx
        %outputy
        outputdatafinal(i*3-2,:) = outputdata;
        outputdatafinal(i*3-1,:) = outputx;
        outputdatafinal(i*3,:) = outputy;
        
    end
    delete('data3.txt');
    fidout = fopen('data3.txt','w');
    for i =1:length(outputdatafinal(:,1))
        for j =1:length(outputdatafinal)
            fprintf(fidout,'%f',outputdatafinal(i,j));
            if j ~=length(outputdatafinal)
                fprintf(fidout,',');
            end
        end
        fprintf(fidout,'\n');
    end
    fclose(fidout);
end

