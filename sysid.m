%% Advanced Vibration
% *ME 6646*

%%
clc;clear all;close all
load matlab.mat

rest = 2499:4e3;
rval = 4735:8625;
fs=1000;
Ts = 1/fs;

Estimation = iddata(X(rest,:),U(rest,:),Ts,'Tstart',rest(1)*Ts);
Validation = iddata(X(rval,:),U(rval,:),Ts,'Tstart',rval(1)*Ts);

%% 
%Plotting the estimation data and the validation data.
plot(Estimation,Validation)
legend(gca,'show')
%%
%Used the ssest function to estimate order of state-space model of the
%system that minimizes the simulation error between the measured outputs
%and the model outputs. Specify that the state-space model has feedthrough

Orders = [1:15];
%Orders = 13;
opt = ssestOptions('Focus','simulation');
sys = ssest(Estimation,Orders,'Feedthrough',true,'Ts',Ts,opt);
sys
figure()
compare(Validation,sys)%we compare the validation and system identified data
%%
%We find out the frequency response function using this function
figure()
[frf,f] = modalfrf(sys);
 modalfrf(sys)
 
 Modes = 3; 
 [fn,dr,ms] = modalfit(sys,f,Modes)
% 
[~,~,~,ofrf] = modalfit(sys,f,Modes);
%we draw the mode shape using this for loop
figure()
clf
for ij = 1:Modes
    for ji = 1:Modes
        subplot(Modes,Modes,Modes*(ij-1)+ji)
        plot(f/1000,20*log10(abs(ofrf(:,ji,ij))))
        axis tight
        title(sprintf('In%d -> Out%d',ij,ji))
        if ij==Modes
            xlabel('Frequency (kHz)')
        end
    end
end

%%
%Then find out the frequency and damping in each mode 
[fn,dr] = modalfit(sys,[],Modes);
T = table((1:Modes)',fn,dr,'VariableNames',{'Mode','Frequency','Damping'})

figure()
bode(sys)

