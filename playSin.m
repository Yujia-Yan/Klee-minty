function playSin(amplitude, freq, duration, Fs,mod_amp, mod_freq )
if(duration < 0.4)
	duration=0.4;
end
LFO= mod_amp*sin(2*pi/Fs*mod_freq* [1:duration*Fs]);
result= sin(2*pi/Fs *freq*(1+LFO).*[1:duration* Fs]); 
A = linspace(0, 1, 0.15*(Fs));
D = linspace(1, 0.8, 0.1*(Fs));
R = linspace(0.8, 0, 0.1 *(Fs));
S = linspace(0.8, 0.8, length(result) - length(A)-length(D)-length(R));


ADSR = [A D S R];
sound(amplitude*result.*ADSR(1:length(result)), Fs);

