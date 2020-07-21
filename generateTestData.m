% This file generates corrupted data received via transmission through a
% wireless channel. The model features intersymbol interference, 2nd-order
% + 3rd-order nonlinearity and additive white Gaussian noise.

%% Parameter definition
dataLength = 1e6;
washoutLength = 1e3;

%% Channel model
% Intersymbol interference (ISI)
channelCoeffs = [1 0.18 -0.1 0.09 -0.05 0.04 0.03 0.01];

% Nonlinearity
nonlinearityCoeffs = [1 0.036 -0.011];

% Additive white Gaussian noise (AWGN)
% snr_dB = 32;          % SNR_dB value is set in main.m by default
snr = 10^(snr_dB/10);
noise_var = 1/(2*snr);  % Noise variance
noise = normrnd(0,sqrt(noise_var),1,dataLength + length(channelCoeffs)-1);

%% Transmitter
symbols = [-3 -1 1 3];
constPts = randi(length(symbols),1,dataLength);
% Transmitted signal d(n)
originalSignal = symbols(constPts);

%% Channel
% ISI introduced
q = conv(channelCoeffs,originalSignal);

% Nonlinearity introduced
q_nonlinear = nonlinearityCoeffs * [q;q.^2;q.^3];

% AWGN introduced
distortedSignal = q_nonlinear + noise;

%% Receiver
% Input training
testIn = distortedSignal(washoutLength+1:end);
% Output for training
testOut = originalSignal(washoutLength+1:end);