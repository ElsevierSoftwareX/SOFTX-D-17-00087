function analyze_stft_fd(x,Ts,signal_label,method,NC,b_display_signal)
%Calculate and plot the Short Time Fourier Transform with the Window Size
%Fixed in the Frequency Domain (STFT-FD)
%
%Input arguments
%  x: Theoretical signal
%  Ts: Sampling period
%  signal_label: Signal label indicating the name of the signal
%  method: 'STFT-FD1' (using FFT) or 'STFT-FD2' (with STFT-FD formula)
%  NC: Number of cycles within the window function
%  b_display_signal: Boolean value indicating whether the signal in the
%                    time domain has to be plotted

    %Obtain time vector
    t=[1:size(x,2)]*Ts;
    %Optionally plot the signal in the time domain
    if (b_display_signal)
        plot_signal(t,x,signal_label);
    end;
    %Calculate the transform with the specified method
    if (method=='STFT-FD1')
        %Calculate transform with STFT-FD1
        [v_time,v_frec,m_stft_fd,elapsed_time]=STFT_FD1(t,x,Ts,NC);
    elseif (method=='STFT-FD2')
        %Calculate transform with STFT-FD2
        [v_time,v_frec,m_stft_fd,elapsed_time]=STFT_FD2(t,x,Ts,NC);
    else
        %If not a valid method, throw error and display a message
        error('Method parameter not valid');
    end;
    %Plot STFT-FD
    plot_stft_fd(v_time,v_frec,m_stft_fd,NC,signal_label,method);
    %Show elapsed time with STFT-FD1
    display([signal_label,' - ',method,': ',num2str(elapsed_time),'s']);
    
    