function [x,Ts]=chirp2_signal
%It builds the two chirp signal
%
%Outputs
%  x: Two chirp signal
%  Ts: Sampling period

    
    %Set the sampling period to 10 micro-seconds
    Ts=2.5e-5;
    %Set the number of samples
    Ns=1200;
    %Calculate the time vector
    t=[1:Ns]*Ts;
    %Set the initial frequency
    f0_x1=1500;
    %Set the final frequency
    f1_x1=3000;
    %Calculate the rate of frequency change (k) of the first chirp
    k_x1=(f1_x1-f0_x1)/(Ts*Ns);
    %Build the first chirp signal
    x1=sin(2*pi*(f0_x1*t+(k_x1/2)*t.*t));
    %Set the initial frequency of the second chirp
    f0_x2=500;
    %Set the final frequency of the second chirp
    f1_x2=2000;
    %Calculate the rate of frequency change (k) of the second chirp
    k_x2=(f1_x2-f0_x2)/(Ts*Ns);
    %Build the second chirp signal
    x2=sin(2*pi*(f0_x2*t+(k_x2/2)*t.*t));
    %Build the signal composed by two chirps
    x=x1+x2;