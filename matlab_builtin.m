%matlab routines
T = [100, 1000, 10000];

for i =1:length(T)
%%   Obtain uniform random variables in (2,4)
    figure(1)
    a = 2;
    b = 4;
    X=a+(b-a)*rand(1,T(i));
    subplot(3,1,i)
    histogram(X,20);
    uni_mean = mean(X);
    uni_var = var(X);
    title('Histogram of Uniform Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')

%%  Obtain exp random variables with lambda 2
    figure(3)
    lambda = 2;
    X = exprnd(lambda,T(i),1);
    subplot(3,1,i);
    histogram(X,20)
    pd = fitdist(X,'exponential');
    exp_mean = mean(X);
    exp_var = var(X);
    title('Histogram of Exponential Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')

 %% Obtain normal random variables with mean 2 and std -sqrt(2)
    figure(5)
    mu =2;
    variance =2;
    sd = sqrt(variance);
    X = normrnd(mu,sd,T(i),1);
    subplot(3,1,i)
    histfit(X);
    pd = fitdist(X,'Normal');
    normal_mean = mean(X);
    normal_var = var(X);
    title('Histogram of Normal Random Variables')
    xlabel(T(i) + " Samples of X")
    ylabel('Frequency')

end




