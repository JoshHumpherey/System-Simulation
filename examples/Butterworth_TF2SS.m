% Butterworth Example %
num = [1];
den = [1 sqrt(2) 1];
[A,B,C,D] = tf2ss(num,den)