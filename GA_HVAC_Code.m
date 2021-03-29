
sim('GA_HVAC.slx');
rng default % For reproducibility

%------------------------Configure GA PIi/PIDo ---------------------------
%set_param('GA_HVAC/PID Controller','Controller','PID');
%set_param('GA_HVAC/PID Controller1','Controller','PI');

%set_param('GA_HVAC/PID Controller','P',num2str(0));
%set_param('GA_HVAC/PID Controller','I',num2str(0));
%set_param('GA_HVAC/PID Controller','D',num2str(0));

%set_param('GA_HVAC/PID Controller1','P',num2str(0));
%set_param('GA_HVAC/PID Controller1','I',num2str(0));

%fitnessfcn = @hvac_performance_PI_PID;

%options = optimoptions('gamultiobj','PopulationSize',60,'ParetoFraction',0.7, 'PlotFcn', @gaplotpareto, 'Generation', 30);

%nvars = 5;
%lb = zeros(nvars,1);
%ub = [10 1 100 1 1];

%[x,fval,exitflag,output,population,scores] = gamultiobj(fitnessfcn,nvars,[],[],[],[],lb,ub,[],options);

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


%------------------------Configure GA P/PI ---------------------------
set_param('GA_HVAC/PID Controller','Controller','PI');
set_param('GA_HVAC/PID Controller1','Controller','P');

set_param('GA_HVAC/PID Controller','P',num2str(0));
set_param('GA_HVAC/PID Controller','I',num2str(0));

set_param('GA_HVAC/PID Controller1','P',num2str(0));


fitnessfcn = @hvac_performance_P_PI;

options = optimoptions('gamultiobj','PopulationSize',60,'ParetoFraction',0.7, 'PlotFcn', @gaplotpareto, 'Generation', 30);

nvars = 3;
lb = zeros(nvars,1);
ub = [10 1 1];

[x1,fval1,exitflag1,output1,population1,scores1] = gamultiobj(fitnessfcn,nvars,[],[],[],[],lb,ub,[],options);

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------