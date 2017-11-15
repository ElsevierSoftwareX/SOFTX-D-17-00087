function [v_time,v_frec,stft_fd,elapsed_time]=STFT_FD1(v_t,x,Ts,NC)
% Short Time Fourier Transform with the Window Size Fixed in the Frequency Domain 
% Solution based on the FFT
%
%Input arguments
%  v_t: Time vector
%  x: Signal
%  Ts: Sampling period
%  NC: Number of cycles within the window function
%
%Outputs
%  v_time: Time vector
%  v_frec: Frequency vector
%  stft_fd: Short Timer Fourier Transform with the Window Size fixed in The
%            Frequency Domain
%  elapsed_time: Elapsed CPU time


    %Store the initial time
    initial_time=cputime;
    %Calculate the number of samples
    NS=size(x,2);
    %Calculate the time vector in which the transform is defined
    v_time = v_t(1+(2*NC/2):NS-(2*NC)/2);
    %Initiate the frequency vector
    v_frec = [];
    %Initiate the vector of the number of samples per cycle
    v_p = [];
    %Initiate the STFT-FD transform to an empty matrix
    stft_fd=[];
    %Iterate in the number of samples per cycle
    for p=2:NS/NC
        %Add the new frequency to the frequency vector
        v_frec = [v_frec, 1/(p*Ts)];
        %Add the new samples per cycle to the vector of the number of
        %samples per cycle
        v_p=[v_p,p];
        %Calculate the window size
        NW=p*NC;
        %Obtain the window function
        window=hamming(NW)';
        %Iterate in time
        for t=NW/2:NS-NW/2
            %Calculate the windowed signal
            wx=window(1:NW).*x(t-NW/2+1:t+NW/2); 
            %Calculate its Fast Fourier Transform
            fft_wx=fft(wx);
            %Calculate the STFT-FD transform
            stft_fd(t,p)=fft_wx(1+NC);
        end;
    end; 
    %Calculate the elapsed time
    elapsed_time=cputime-initial_time;
