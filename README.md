# ESN_ChannelEqualizer

These files are used for simulation of channel equalizer for a nonlinear wireless channel using ESN approach. RLS algorithm is used in updating output weights. The system performance is examined by computing symbol error rate (SER) which is estimated by the ratio between number of wrongly detected symbols over total number of transmitted symbols.

- The input-output equation of the linear channel
  q(n) = d(n) + 0.18d(n – 1) – 0.1d(n – 2) + 0.09d(n – 3) – 0.05d(n – 4) + 0.04d(n – 5) + 0.03d(n – 6) + 0.01d(n – 7)
 
- The noisy nonlinearity
  u(n) = q(n) + 0.036q(n)^2 - 0.011q(n)^3 + noise(n)
