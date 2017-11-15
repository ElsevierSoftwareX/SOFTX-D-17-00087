function [x,Ts]=theoretical_signal
%It builds a theoretical signal, comprised of a long sinusoid, a short-time
%sinusoid, and an impulse. Gaussian noise is added to the signal if the
%Communication toolbox is available.
%
%Outputs
%  x: Theoretical signal
%  Ts: Sampling period

    %Set the sampling period to 10 micro-seconds
    Ts=1e-5;
    %Set the number of samples
    Ns=3000;
    %Initiate to a zero vector all the signal components
    x1=zeros(1,Ns);
    x2=zeros(1,Ns);
    x3=zeros(1,Ns);
    %Set the period of the long sinusoid (first component)
    period1=211*Ts;
    %Set the period of the short-time sinusoid (third component)
    period3=51*Ts;
    %Set the length of the short-time sinusoid (third component)
    x3_length=100;
    %Set the amplitude of each component
    A1=5e-3;
    A2=2e-2;
    A3=0.8;
    %Build the time vector
    t=[1:Ns]*Ts;
    %Build the long sinusoid (first component)
    x1=A1*sin(t*2*pi/period1);
    %Build the impulse (second component) 
    x2(2000)=A3;
    %Build the time vector of the third component
    ti2=[2501:(2500+x3_length)];
    %Build the short-time sinusoid (third component)
    x3(ti2)=A2*sin(ti2*Ts*2*pi/period3);
    %Build the signal as the addition of the three components
    x=x1+x2+x3;
    %Check if the communication toolbox is installed
    status=license('test','communication_toolbox');
    if (status==1)
        %If installed
        %Set the signal to noise ratio
        snr=40;
        %Add Gaussian noise to the signal
        x = awgn(x,snr);
    else
        %if not installed
        %Display a warning
        display('Communication toolbox is not installed. Building synthetic signal without Gaussian noise');
    end;
    