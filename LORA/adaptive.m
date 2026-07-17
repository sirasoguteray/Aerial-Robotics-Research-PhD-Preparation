clear; clc;

Ns = 3e4;
Nm = 1e2;
BW = 125e3;
SNR = -30:30;

[PER_SF7,  SNR] = run_one_sf(7,  Ns, Nm, BW, SNR);
[PER_SF9,  ~  ] = run_one_sf(9,  Ns, Nm, BW, SNR);
[PER_SF12, ~  ] = run_one_sf(12, Ns, Nm, BW, SNR);

% ---- Smoothing
s7  = smoothdata(PER_SF7,  'gaussian', 5);
s9  = smoothdata(PER_SF9,  'gaussian', 5);
s12 = smoothdata(PER_SF12, 'gaussian', 5);

% ---- Threshold: the first SNR point where each SF has a PER < threshold.
thresh = 0.2;
SNR_SF7_ok  = SNR(find(s7  < thresh, 1, 'first'));
SNR_SF9_ok  = SNR(find(s9  < thresh, 1, 'first'));
  
% Transition: Transition when target SF is good
T1 = SNR_SF9_ok; % Transition from SF12 to SF9 when SF9 is ready
T2 = SNR_SF7_ok; % Transition from SF9 to SF7 when SF7 is ready

fprintf('T1 = %d dB, T2 = %d dB\n', T1, T2);

% ---- Adaptive PER and SF selection
PER_adapt = zeros(size(SNR));
SF_sel    = zeros(size(SNR));

for i = 1:numel(SNR)
    if SNR(i) < T1
        PER_adapt(i) = PER_SF12(i);  SF_sel(i) = 12;
    elseif SNR(i) < T2
        PER_adapt(i) = PER_SF9(i);   SF_sel(i) = 9;
    else
        PER_adapt(i) = PER_SF7(i);   SF_sel(i) = 7;
    end
end

% ---- Plot 1
figure; hold on; grid on; box on;
plot(SNR, PER_SF7,  '-o', 'DisplayName','SF7');
plot(SNR, PER_SF9,  '-s', 'DisplayName','SF9');
plot(SNR, PER_SF12, '-d', 'DisplayName','SF12');
plot(SNR, PER_adapt,'-k', 'LineWidth', 2, 'DisplayName','Adaptive SF');
xline(T1,'--r','DisplayName',['T1=',num2str(T1),'dB']);
xline(T2,'--b','DisplayName',['T2=',num2str(T2),'dB']);
xlabel('SNR [dB]'); ylabel('PER');
legend('Location','best');
title('Fixed SF vs Adaptive SF - PER');
ylim([0 1.05]);

% ---- Plot 2
figure; stairs(SNR, SF_sel, 'LineWidth', 2);
grid on; box on;
xlabel('SNR [dB]'); ylabel('Selected SF');
yticks([7 9 12]); ylim([6 13]);
title('Adaptive SF Selection');

% =========================
function [PER_AWGN, SNR] = run_one_sf(SF, Ns, Nm, BW, SNR)
N = Ns/Nm;
M = 2^SF;
x = randi(M,1,Ns) - 1;
upChirp = loramod(x, SF, BW, BW);
dnChirp = loramod(0, SF, BW, BW, -1);
signal  = upChirp .* repmat(dnChirp, length(upChirp)/length(dnChirp), 1);

PER_AWGN = zeros(1, numel(SNR));
for CtrSNR = 1:numel(SNR)
    sigma = 1 ./ 10.^(SNR(CtrSNR)./20);
    n = sigma/sqrt(2) .* (randn(M*Ns,1) + 1j*randn(M*Ns,1));
    Rx1 = signal + n;
    [~,idx]  = max(fft(reshape(Rx1, M, Ns)));
    ynCoh1   = idx - 1;
    PER_AWGN(CtrSNR) = sum(sum(abs(reshape(x,N,Nm) - reshape(ynCoh1,N,Nm)), 2) > 0) / N;
end
end