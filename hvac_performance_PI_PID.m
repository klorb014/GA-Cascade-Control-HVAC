function z = hvac_performance_PI_PID(controller)
disp('Evaluating Solution')
disp(controller)


P_o = controller(1);
I_o = controller(2);
D_o = controller(3);

P_i = controller(4);
I_i = controller(5);

set_param('GA_HVAC/PID Controller','P',num2str(P_o));
set_param('GA_HVAC/PID Controller','I',num2str(I_o));
set_param('GA_HVAC/PID Controller','D',num2str(D_o));

set_param('GA_HVAC/PID Controller1','P',num2str(P_i));
set_param('GA_HVAC/PID Controller1','I',num2str(I_i));

T = 2000; %Simulation Time

try
sim_out = sim('GA_HVAC');
y = sim_out.y_out;
e = sim_out.e_out.data;
t = sim_out.t_out.data;

s = stepinfo(y.data,y.time);
overshoot = s.Overshoot;
settling_time = s.SettlingTime;
J_1 = overshoot;
J_2 = settling_time;
J_3 = trapz(t,e.*e)/max(e);

catch ME
    disp('UNSTABLE')
    J_1 = 10e5;
    J_2 = 10e5;
    J_3 = 10e5;
    
end
disp(J_1)
disp(J_2)
disp(J_3)
z = zeros(1,3); % allocate output
z(1) = J_1;
z(2) = J_2;
z(3) = J_3;

end