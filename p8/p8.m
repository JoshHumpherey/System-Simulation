% Problem 8 written by Josh Humphrey
T = 0.01
N = 10000

num = [6,-2];
den = [-20, 20, 3, -3];
AB2 = tf(num,den)

rlocus(AB2)