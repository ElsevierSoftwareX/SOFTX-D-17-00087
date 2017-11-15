function [x,Ts]=ecg_signal(filename)
%It loads an electrocardiogram (ECG) signal
%The ECG test signal has to be downloaded from http://eleceng.dit.ie/dorran/matlab/ecg.txt
%and saved in the same folder than this function, so that it can be loaded.
%
%Input arguments
%  filename: Name of the ECG signal file
%
%Outputs
%  x: ECG signal
%  Ts: Sampling period

    %Load the ECG signal
    [x]=dlmread('ecg.txt');
    %Take the initial 10s
    x=x(1:1000)'; 
    %The frequency of this signal is 100Hz
    Fs=100;
    %Calculate the sampling period
    Ts=1/Fs;
    
