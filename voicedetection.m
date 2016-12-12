function [voiced_frames]=voicedetection(frames)

tn=100;
tfeed=10;
length_one_frame=size(frames,1);
noise=sum(frames(:,1:tn/tfeed).^2);         %sum by column, take first tn/tfeed frames as noise
noise=sum(noise./length_one_frame,2);       %sum by row, sum of first tn/tfeed(10) averaged frames 
energy=sum(frames.^2);                      %sum by column,energy of all frames
energy=energy./length_one_frame;            %averaged energy of all frames
voiced_frames=frames(:,energy>10*noise);     % when SNR>10dB, take that frame as a voiced one.
