clear all;
%wav = wavread('church.wav');
fs=11025;
duration=10;
waveFile='test.wav';
fprintf('Press any key to start %g seconds of recording...', duration); pause
fprintf('Recording...');
%////////////////////////////
% this commend for reecord sound by mic in matlab
% can b replace to wavrecord in matlab 2009 but i am using matlab R2014b
 y = audiorecorder(duration*fs, 16,2,-1);
fprintf('Finished recording.\n');
fprintf('Press any key to save the sound data to %s...', waveFile); pause;
%/////////////
% this commend for blocking record to read by function play()
recordblocking(y,5);
%audiowrite(y, fs, 16, waveFile);
play(y);
fprintf('Finished writing %s\n', waveFile);
fprintf('Finished writing %s\n', waveFile);
%   / ///////////////////////////
% this commend to geting information of file reecord 
info = audioinfo(waveFile)
% //////////////////////
% this commend useing for smplifed data to ploting by function plot()
myRec = getaudiodata(y);
% ////////////
% this commend for division screen plot to sub plot
subplot(2,1,1);
% ploting graphic in place 2,1,1 
plot(myRec);
title('time domaine');
%///////////////   ////////////////////
% fft Discrete Fourier transform.
% fft(X) is the discrete Fourier transform (DFT) of vector X.  For
% matrices, the fft operation is applied to each column. For N-D
% arrays, the fft operation operates on the first non-singleton
% dimension.
E = fft(myRec);
subplot(2,1,2)
plot(real(E));
title('frequency domaine');