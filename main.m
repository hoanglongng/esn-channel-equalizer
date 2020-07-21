clear all;
close all;
clc;

snr_dB = 32;
generateData;
generateESN;
networkTraining;
generateTestData;
networkTesting;