function [T, P, A , e_n, Fn] = convergence_normal()

clc;
clear;
close all;

M = 500;
N = 2000;
T = zeros(M,N);

Xmean = 2;
mu =2;
var =2;
sd = sqrt(var);

for j = 1: M
    X = normrnd(mu,sd,N,1);
    sum_X = 0;
    s = zeros(1,N);
    Y = zeros(1,N);
    for i = 1 :N
        s(i) = sum_X + X(i);
        sum_X = s(i);
        Y(i) = s(i)/i; 
    end
    T(j,1:N) = Y; 
%     plot(T(j,:))
%     hold on
end


%population mean X = 2
%Convergence in Probability
e = 0.05;
P = zeros(1,N);
for n = 1:N
pn = 0;
    for m = 1 : M
        if ((T(m,n)-Xmean) > e) || ((T(m,n)-Xmean) < (-e)) 
        pn = pn + 1;
        end
    end 
P(1,n)= pn/M;
end


% Almost Sure Convergence 
K = 1/2;
A = zeros(1,(K*N));
for n2 = 1: (K*N)
k = 0;   
    for m = 1 : M
        for n1 = n2 : N
            if ((T(m,n1)-Xmean) > e) || ((T(m,n1)-Xmean) < (-e)) 
            k = k + 1;
            break;
            end
        end
    end  
A(1,n2)= k/M;
end


% Mean Square Convergence 

r =2;
E = (T- Xmean).^r; 
e_n = sum(E)/M;

%Convergence in Distribution
Ln = -4:0.0001:4;
Fn = zeros(1,length(Ln));

for t = 1 : length(Ln)
f = 0;
    for l = 1 : 1 : M
        if (T(l,N)) <= Ln(t)
        f = f + 1;
        end
    end
Fn(1,t) = f/M;
end

end
