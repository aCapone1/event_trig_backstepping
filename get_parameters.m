function [par, hyperpar] = get_parameters()

    par = zeros(11,1);
    M=0.05;
    B=1;
    Km=10;
    H=0.5;
    N=10;
    D=1;
    K1 = 5; %2
    K2 = 5; %2
    K3 = 5; %2
    
    %Noise standard deviation
    std_noise = 0.0001;
    
    meanfunc = {'meanZero'};                   % empty: don't use a mean function
    covfunc = {'covSEard'};              % Squared Exponental covariance function
    likfunc = @likGauss; 
    
    
    % hyp.cov = [ log(lengthscale_1)
    %               log(lengthscale_2)
    %               ...
    %               log(lengthscale_D)
    %               log(signal standard deviation) ]
    
    % Hyperparemeters
    hyp1.mean = [];
    hyp1.cov = [5, -15];
    hyp1.lik = -10;

    hyp2.mean = [];
    hyp2.cov = [-1, 3, 5]; % -1, 3, 5
    hyp2.lik = -6;

    hyp3.mean = [];
    hyp3.cov = [5, 1, 2, 7]; % 5, 2, 3
    hyp3.lik = -6;
    
    % Command filter parameters
    % VERY HIGH VALUES OF omega_f MAKE THE SIMULATION SLOW!
    omega_f = 200; % 300
    zeta = 1; % 0.8
    
    par(1)=M;
	par(2)=N;
	par(3)=B;
    par(4)=D;
    par(5)=Km;
    par(6)=H;
    par(7)=K1;
    par(8)=K2;
    par(9)=K3;
    par(10)=omega_f;
    par(11)=zeta;
    par(12)=std_noise;
    
    hyperpar.meanfunc = meanfunc;
    hyperpar.covfunc = covfunc;
    hyperpar.likfunc = likfunc;
    hyperpar.hyp1 = hyp1;
    hyperpar.hyp2 = hyp2;
    hyperpar.hyp3 = hyp3;
   
end
