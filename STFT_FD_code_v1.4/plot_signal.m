function plot_signal(t,x,signal_label)
%Plots the signal in the time domain
%
%Input arguments
%  t: time vector
%  x: Signal
%  signal_label: Signal label indicating the name of the signal

    %Create new figure
    figure;
    %Plot the signal in the time domain
    plot(t,x);
    %Label the x-axis
    xlabel('Time [s]','FontSize',14);
    %Label the y-axis
    ylabel('x[t]','FontSize',14);
    %Set the title to the signal label
    title(signal_label);
