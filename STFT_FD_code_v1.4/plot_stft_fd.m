function plot_stft_fd(v_time,v_frec,stft_fd,NC,signal_label,method)
%It plots the STFT-FD transform in the time-frequency domain
%
%Input arguments
%  v_time: Time vector
%  v_frec: Frequency vector
%  stft_fd: Short Timer Fourier Transform with the Window Size fixed in The
%            Frequency Domain
%  NC: Number of cycles within the window function
%  signal_label: Signal label
%  method: 'STFT-FD1' (using FFT) or 'STFT-FD2' (with STFT-FD formula)

    %Create a new figure
    figure;
    %Plot the transform
    h=pcolor(v_time,v_frec,abs(stft_fd(1+(2*NC/2):end,2:end)'));
    %Set color map
    colormap(get_colormap);
    %Display a color bar
    colorbar;
    %Remove separation among cells
    set(h, 'edgecolor','none');
    %Label the x-axis
    xlabel('Time [s]');
    %Label the y-axis
    ylabel('Frequency [Hz]');
    %Set the title to the signal label
    title([signal_label,' - ',method]);    
