clc;
clear;
close all;

T = [100,1000,10000];
a = 2;
b =4;


for i=1:length(T)
    Y = zeros(T(i),1);
    for j=1:T(i)
        X = a + (b-a)*rand(T(i),1);
        Y(j) = (1/T(i)) * sum(X);
    end
    figure(1)
    subplot(3,1,i)
    histogram(Y)
    grid on;
    title('Histogram of Uniform Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')


    lambda = 2;
    Y = zeros(T(i),1);
    for j=1:T(i)
        X = exprnd(lambda,T(i),1);
        Y(j) = (1/T(i)) * sum(X);
    end
    figure(2)
    subplot(3,1,i)
    histogram(Y)
    grid on;
    title('Histogram of Exponential Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')

    Y = zeros(T(i),1);
    for j=1:T(i)
        X = normrnd(2,sqrt(2),T(i),1);
        Y(j) = (1/T(i)) * sum(X);
    end
    figure(3)
    subplot(3,1,i)
    histogram(Y)
    grid on;
    title('Histogram of Normal Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')
    
end




 
