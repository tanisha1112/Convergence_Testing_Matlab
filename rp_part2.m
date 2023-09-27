clc;
clear;
close all;

syms x y;

%function, pdf, expectation, expectation^2 and varaince
F_xy=@(x,y)x+(3/2)*y.^2;

F_XY2=(int(F_xy,y,[0,1])); 
F_Y=(int(F_xy,x,[0,1]));

E_X=(int(x*F_XY2,x,[0,1])); 
E_Y=(int(y*F_Y,y,[0,1])); 

E2_X=(int(x^2*F_XY2,x,[0,1])); 
E2_Y=(int(y^2*F_Y,y,[0,1])); 

Var_X = E2_X - (E_X).^2;
Var_Y = E2_Y - (E_Y).^2;

%Calculate Covariance Coefficient
F_XY2=@(x,y) x.^2.*y+(3/2)*y.^3.*x; 

%Get E for x and y
E_xy=(integral2(F_XY2,0,1,0,1));
cov_xy=((E_xy-(E_X*E_Y))); 

%Display Covariance and Correlation
CovMatix=([Var_X cov_xy; cov_xy Var_Y]);
CovMatix=round(CovMatix,4);

Correlation=[E2_X E_xy; E_xy E2_Y];
Correlation=round(Correlation,4);

disp(CovMatix);
disp(Correlation);

% Produce 1000 samples

%Cholesky Factorization used 
[n,f]= chol(CovMatix); 
s=1000;
R=randn(2,s); 
X=n'*R;

Xs = cov(X'); 
Xs=round(Xs,4);
disp(Xs);




