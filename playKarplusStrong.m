function playKarplusStrong(amplitude, Freq, Fs,duration )
if(duration<0.3)
	duration=0.3;
end
x=zeros(1,floor(Fs*duration));

delay= floor(Fs/Freq);
b  = firls(42, [0 1/delay 2/delay 1], [0 0 1 1]);
a  = [1 zeros(1, delay) -0.5 -0.5];
Hd = dfilt.df1(b, a);

Hd.ResetBeforeFiltering= 'off';
Hd.States.Numerator= rand(42,1);
Hd.States.Denominator =rand(delay+2,1);
x= filter(Hd,x);
A = linspace(0, 1, 0.01*(Fs));
D = linspace(1, 0.8, 0.01*(Fs));
R = linspace(0.8, 0, 0.1 *(Fs));
S = linspace(0.8, 0.8, length(x) - length(A)-length(D)-length(R));
x= x/max(x);
sound(amplitude*x.*[A D S R],Fs)


