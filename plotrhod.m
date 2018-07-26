function plotrhod

% maxNumCompThreads(1);

% Tvec=[10 70 130 190];

figure;hold on;box on;

% alpha=0.568231496731503;
% echarge=1.6021766208e-19; 
% hbar=1.054571800e-34;   
% 
% cons=echarge.^2./hbar;
% 
% ng1=(-60:1:60);
% ng2=-ng1;

% UNCOMMENT TO GENERATE THE HOMOGENEOUS RHOD DATA FILES
% for k=1:length(Tvec)
%     T=Tvec(k);
% load(['monolayersigmas_T' num2str(T) 'K.mat'],'n', 'sigmamono');
% nplus=n(2:length(n));
% nfull1=[-fliplr(nplus) n];
% sigmaplus=sigmamono(2:length(sigmamono));
% sigmafull1=[fliplr(sigmaplus) sigmamono];
% monocond=@(x) interp1(nfull1,sigmafull1,x,'pchip',NaN);
% 
% load(['draggrid-T' num2str(T) '.mat'])
% sigmaDinterp=@(n1,n2) interp2(nA,nP,sigmaDgrid,n1,n2,'spline',NaN);%change nimp from 5x15^10 to 10x10^10 
% 
% sigmad=zeros(1,length(ng1));
% sigma1=zeros(1,length(ng1));
% sigma2=zeros(1,length(ng2));
% 
% for j=1:length(ng1)
%     sigma1(j)=monocond(ng1(j));
% %     sigma2eff(j)=EMTmono(ng2(j),nrms2,T);
%     sigma2(j)=monocond(ng1(j));
%     sigmad(j)=sigmaDinterp(ng1(j),ng2(j));
% end
% 
% rhodfun=@(nq) interp1(ng1,-sigmad./(sigma1.*sigma2-(sigmad.*4.*alpha.^2.*pi).^2)./cons.*4.*alpha.^2.*pi,nq,'pchip',NaN);
%     nplt=(-60:0.1:60);
%     rhod=rhodfun(nplt);
% %     plot(nplt,rhod,'LineStyle','-','LineWidth',3)
%     save(['rhodhomogdata-T' num2str(T) '.mat'],'nplt','rhod');
% end

load('factor.mat','factor');

load('rhodhomogdata-T10.mat');
plot(nplt,rhod.*factor,'-m','LineWidth',3); 
load('rhodhomogdata-T70.mat');
plot(nplt,rhod.*factor,'-k','LineWidth',3); 
load('rhodhomogdata-T130.mat');
plot(nplt,rhod.*factor,'-r','LineWidth',3); 
load('rhodhomogdata-T190.mat');
plot(nplt,rhod.*factor,'-b','LineWidth',3); 
% ylim([0 70])

set(gca,'FontSize',20);
% title('(a)','FontSize', 20, 'Interpreter', 'latex');
text(-55,140,'(a)','FontSize',30);
text(-55,120,'Homogeneous','FontSize',22);
text(-55,110,'momentum drag','FontSize',22);

text(22,80,'$n_{A} = -n_{P}$', 'Interpreter', 'latex','FontSize',25);
legend({'$T=10K$' '$T=70K$' '$T=130K$' '$T=190K$'}, 'Interpreter', 'latex','FontSize',20, 'Location', 'NorthEast','Orientation','Vertical')
% xlim([-30 30])
% ylim([0 30])
xlabel('$n_{A} (10^{10} \mathrm{cm}^{-2})$', 'FontSize', 30, 'Interpreter', 'latex');
ylabel('$\tilde{\rho}_{D} (\Omega)$', 'FontSize', 30, 'Interpreter', 'latex');

h=gca;
h.XTick=(-60:20:60);
h.XMinorTick='on';
h.YMinorTick='on';

axes('Position',[.23 .38 .22 .22])
box on

load('rhodhomogdata-T10.mat');
plot(nplt,rhod.*factor,'-m','LineWidth',2); 
% ylim([0 0.7])
xlim([-1 1])
xlabel('$n_{A} (10^{10} \mathrm{cm}^{-2})$', 'FontSize', 12, 'Interpreter', 'latex');
ylabel('$ \tilde{\rho}_{D} (\Omega)$', 'FontSize', 12, 'Interpreter', 'latex');
text(-0.9,115,'$T=10K$','Interpreter', 'latex','FontSize',12);
text(0.1,115,'$n_{A} = -n_{P}$','Interpreter', 'latex','FontSize',12);
h2=gca;

h2.XTick=(-1:0.5:1);
h2.XMinorTick='on';
h2.YMinorTick='on';

set(gca, 'FontSize', 12, 'FontWeight', 'bold', 'LineWidth', 2);

print('-dpdf','Fig3a.pdf')

end