clear; clc;

%% Simulation Parameters
Ns = 3e4;
Nm = 1e2;
BW = 125e3;

SNR = -30:30;

% -------- NEW --------
INR = -5;          % Interference-to-Noise Ratio (dB)
% ---------------------


%% Fixed SF Simulations

[PER_SF7,  SNR] = run_one_sf(7,  Ns, Nm, BW, SNR, INR);
[PER_SF9,  ~  ] = run_one_sf(9,  Ns, Nm, BW, SNR, INR);
[PER_SF12, ~  ] = run_one_sf(12, Ns, Nm, BW, SNR, INR);


%% Smooth PER Curves

s7  = smoothdata(PER_SF7 ,'gaussian',5);
s9  = smoothdata(PER_SF9 ,'gaussian',5);
s12 = smoothdata(PER_SF12,'gaussian',5);


%% Threshold Detection

thresh = 0.2;

SNR_SF7_ok = SNR(find(s7<thresh,1,'first'));
SNR_SF9_ok = SNR(find(s9<thresh,1,'first'));

T1 = SNR_SF9_ok;
T2 = SNR_SF7_ok;

fprintf('T1 = %d dB\n',T1);
fprintf('T2 = %d dB\n',T2);


%% Adaptive Selection

PER_adapt = zeros(size(SNR));
SF_sel = zeros(size(SNR));

for i=1:length(SNR)

    if SNR(i) < T1

        PER_adapt(i)=PER_SF12(i);
        SF_sel(i)=12;

    elseif SNR(i) < T2

        PER_adapt(i)=PER_SF9(i);
        SF_sel(i)=9;

    else

        PER_adapt(i)=PER_SF7(i);
        SF_sel(i)=7;

    end

end


%% Plot PER

figure;
hold on;
grid on;
box on;

plot(SNR,PER_SF7,'-o');
plot(SNR,PER_SF9,'-s');
plot(SNR,PER_SF12,'-d');
plot(SNR,PER_adapt,'k','LineWidth',2);

xline(T1,'--r');
xline(T2,'--b');

xlabel('SNR (dB)');
ylabel('PER');

legend('SF7','SF9','SF12','Adaptive');


%% Plot Selected SF

figure;

stairs(SNR,SF_sel,'LineWidth',2);

grid on;
box on;

xlabel('SNR (dB)');
ylabel('Selected SF');

yticks([7 9 12]);

ylim([6 13]);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% FUNCTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [PER_AWGN,SNR]=run_one_sf(SF,Ns,Nm,BW,SNR,INR)

N=Ns/Nm;

M=2^SF;

x=randi(M,1,Ns)-1;

upChirp=loramod(x,SF,BW,BW);

dnChirp=loramod(0,SF,BW,BW,-1);

signal=upChirp.*repmat(dnChirp,length(upChirp)/length(dnChirp),1);

PER_AWGN=zeros(1,length(SNR));

for CtrSNR=1:length(SNR)

    %% Noise

    sigma_n = 1/10^(SNR(CtrSNR)/20);

    noise = sigma_n/sqrt(2) .* ...
        (randn(M*Ns,1)+1j*randn(M*Ns,1));



    %% Gaussian Interference

    sigma_i = sigma_n * 10^(INR/20);

    interference = sigma_i/sqrt(2) .* ...
        (randn(M*Ns,1)+1j*randn(M*Ns,1));



    %% Received Signal

    Rx = signal + noise + interference;



    %% Detection

    [~,idx]=max(fft(reshape(Rx,M,Ns)));

    y=idx-1;



    %% PER

    PER_AWGN(CtrSNR)=sum(sum(abs(reshape(x,N,Nm)-reshape(y,N,Nm)),2)>0)/N;

end

end