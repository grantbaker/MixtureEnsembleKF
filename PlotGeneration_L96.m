% Script to generate all needed plots.
% Plots include:
% - gamma comparison
% - Ensemble member comparison
% - Observation frequency comparison

global H R gamma Nvar Nt InitialCond sigma0 tf t0 dt;

% Given parameters
% initial and final time
t0 = 0;
tf = 20;
% number of time steps in solution
Nt = 2000;
% observation variance
sigma0 = sqrt(.1);

% number of variables
Nvar = 5;
% observation matrix
tmp = eye(Nvar);
H1 = tmp(1:1:end,:);

% initial condition
InitialCond = randn(Nvar,1);
% setting up solution space
dt = (tf-t0)/Nt;

% generate the true solution
[T,XT] = ode45(@RHS_L96,linspace(t0,tf,Nt),randn(Nvar,1));
%XT = XT(2:end,:)';
%T = T(2:end);
TrueSolution = permute(XT,[2,1]);

% GeneratePlot_L96(TrueSolution, Nobs, Nens, gamma, H, title)
GeneratePlot_L96(TrueSolution, 200, 75, 0.7, H1, 'Standard')