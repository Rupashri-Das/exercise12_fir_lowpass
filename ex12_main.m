%% Exercise 12: Design of FIR Low-Pass Filter
% Student: Rupashri Das
% MATLAB Version: MATLAB Online (R2025a)
% Date: October 2025

close all; clear; clc;

%% Parameters
wc = 1;              % cutoff frequency in radians
M_values = [20, 64]; % filter orders to test

figure; % Figure to compare magnitude responses for different M
hold on;

for k = 1:length(M_values)
    M = M_values(k);
    n = 0:M; % sample indices
    
    % FIR Low-Pass Filter: direct formula
    h_LP = sin(wc*(n - M/2)) ./ (pi*(n - M/2));
    h_LP(n == M/2) = wc/pi; % handle divide-by-zero case
    
    % Plot impulse response
    figure;
    stem(n, h_LP, 'filled'); grid on;
    title(sprintf('Impulse Response h_{LP}( n ), M = %d', M));
    xlabel('n'); ylabel('h_{LP}( n )');
    saveas(gcf, sprintf('figures/hLP_M%d.png', M));
    
    % Frequency response
    H_LP = fft(h_LP, 1024);
    w = linspace(-pi, pi, 1024);
    
    % Plot magnitude response
    figure;
    plot(w/pi, abs(fftshift(H_LP)), 'LineWidth', 1.2); grid on;
    title(sprintf('Magnitude Response |H_{LP}(e^{j\\omega})|, M = %d', M));
    xlabel('\omega/\pi'); ylabel('|H_{LP}|');
    saveas(gcf, sprintf('figures/HLP_M%d.png', M));
    
    % Overlay for comparison
    plot(w/pi, abs(fftshift(H_LP)), 'LineWidth', 1.5);
end

hold off;
title('Magnitude Response Comparison for M = 20 and M = 64');
xlabel('\omega/\pi'); ylabel('|H_{LP}|');
grid on;
legend('M = 20', 'M = 64');
saveas(gcf, 'figures/HLP_compare.png');
