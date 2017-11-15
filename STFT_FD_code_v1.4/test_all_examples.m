function test_all_examples
%It tests all the examples (theoretical signal, chirp signal and ECG signal)
%using the STFT-FD transform

    %Close all opened windows
    close all;

    %Set label
    signal_label='Synthetic signal';
    %Get chirp signal
    [x,Ts]=synthetic_signal;
    %Set number of cycles inside the window function
    NC=4;    
    %Calculate and plot the STFT-FD1 of the chirp signal
    analyze_stft_fd(x,Ts,signal_label,'STFT-FD1',NC,true);
    %Calculate and plot the STFT-FD2 of the chirp signal
    analyze_stft_fd(x,Ts,signal_label,'STFT-FD2',NC,false);
    
    %Set label
    signal_label='Two linear chirp signal';
    %Get chirp signal
    [x,Ts]=chirp2_signal;
    %Set number of cycles inside the window function
    NC=8; 
    %Calculate and plot the STFT-FD1 of the chirp signal
    analyze_stft_fd(x,Ts,signal_label,'STFT-FD1',NC,true);
    %Set the y axis range to 0..4000Hz
    ylim([0,4000]);
    %Calculate and plot the STFT-FD2 of the chirp signal
    analyze_stft_fd(x,Ts,signal_label,'STFT-FD2',NC,false);
    %Set the y axis range to 0..4000Hz
    ylim([0,4000]);
    
    %Set ECG signal file name
    ecg_filename='ecg.txt';
    %Check if ECG file exists
    if exist(ecg_filename, 'file') == 2
        %Set label
        signal_label='ECG signal';
        %Load the ECG signal
        [x,Ts]=ecg_signal(ecg_filename);
   	 %Set number of cycles inside the window function
   	 NC=4; 
        %Calculate and plot the STFT-FD1 of the chirp signal
        analyze_stft_fd(x,Ts,signal_label,'STFT-FD1',NC,true);
        %Calculate and plot the STFT-FD2 of the chirp signal
        analyze_stft_fd(x,Ts,signal_label,'STFT-FD2',NC,false);
    else
        display('File ecg.txt from http://eleceng.dit.ie/dorran/matlab/ecg.txt is required to test that case study. In order to test it, download the file, save it in the same folder and then run the program again.');
    end;
