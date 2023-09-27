close all;
clear;
clc;

T = [100, 1000, 10000];

for i =1:length(T)

    % uniform distribution
    n =1;
    c = 1/2;
    X = zeros(1,T(i));
    while(n <= T(i))
        a =2;
        b =4;
        U1 = a + (b-a)*rand();
        U2 = rand();
        if U2 <= (1/c) * U1  
            X(n) = U1;
            n = n + 1;
        end
    end
    figure(1);
    subplot(3,1,i)
    histogram(X)
    uni_mean = mean(X);
    uni_var = var(X);
    title('Histogram of Uniform Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')
    
    
    % exponential distribution
    n =1;
    c = 4;
    X = zeros(1,T(i));
    while(n <= T(i))
        a =2;
        b =4;
        U1 = a + (b-a)*rand();
        U2 = rand();
        if U2 <= (1/c) * 2 * exp(-U1*2)  
            X(n) = U1;
            n = n + 1;
        end
    end
    figure(2);
    subplot(3,1,i)
    histogram(X)
    exp_mean = mean(X);
    exp_var = var(X);
    title('Histogram of Exponential Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')
    
    % normal distribution
    n =1;
    c = 1/2 * sqrt(pi);
    X = zeros(1,T(i));
    while(n <= T(i))
        a =0;
        b =4;
        U1 = a + (b-a)*rand();
        U2 = rand();
        if U2 <= (1/c) * (1/2*sqrt(pi)) * exp((-(U1-2)^2)/4)  
            X(n) = U1;
            n = n + 1;
        end
    end
    figure(3);
    subplot(3,1,i)
    histogram(X)
    normal_mean = mean(X);
    normal_var = var(X);
    title('Histogram of Normal Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')
end