# Exercise 12: FIR Low-Pass Filter Design

**Course:** Mathematical Algorithms
**Student:** Rupashri Das  
**Date:** 29 October 2025  
**MATLAB Version:** MATLAB Online (R2025a)  

## Overview

This exercise focuses on designing and analyzing a FIR low-pass filter using the direct formula for h_LP(n). The goal is to observe how the filter order M affects the impulse response and frequency response of the filter.

## Implementation

The filter is implemented using:

h_LP(n) = sin(wc*(n - M/2)) / (pi*(n - M/2)),
h_LP(M/2) = wc/pi


Frequency response is computed using FFT with 1024 points, and magnitude responses are plotted for both M = 20 and M = 64.

## Results

- **Impulse Responses:**  
  - `figures/hLP_M20.png`  
  - `figures/hLP_M64.png`  
- **Magnitude Responses:**  
  - `figures/HLP_M20.png`  
  - `figures/HLP_M64.png`  
  - `figures/HLP_compare.png` (comparison of M = 20 vs M = 64)

## Observations

1. Increasing the filter order M results in a sharper frequency response and narrower transition band.  
2. The impulse response length increases with higher M.  
3. Higher M values reduce ripple and produce a smoother, more ideal low-pass characteristic.  
4. For M = 20, the transition band is wider, while M = 64 shows a much sharper cutoff.  

## Conclusion

The FIR low-pass filter design demonstrates how filter order affects performance. Larger M values improve frequency selectivity at the cost of increased impulse response length, confirming the trade-off between sharpness and computational complexity.
