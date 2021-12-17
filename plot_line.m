clear, clc
% Codes for plotting line chart
% Author : Yu-Cheng Lin 2021. 08. 06

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Notice that the ticks difference need to 
%    be large enough (otherwise, the tick value
%    will be wrong due to the Font Size)
% 2. Number of Line must be Less than 5 (due
%    to limited color and marker)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%% modify here %%%%%%%%%%%%%%%%
%% Example 1
n_data = 3;
data_y = rand(n_data, 4);
data_x = 0:6:18;
legend_display_name = {'Algor 1', 'Algor 2', 'Algor 3'};
xtiks = 0:5:20;
ytiks = 0:0.2:1.3;
x_range = [0 20];
y_range = [0 1.3];
Y_log_scale_on = false;
x_label_name = "Iteration";
y_label_name = "Values";
%% Example 2
n_data = 2;
data_y =[0.1732 0.0931 0.0437 0.0187 0.0079 0.0031 0.0013 0.0005 ;
        0.0980 0.0423 0.0152 0.0056 0.0019 0.0007 0.0002 0.00006 ];
data_x = 0:3:21;
legend_display_name = {'Algor 1', 'Algor 2'};
xtiks = 0:5:20;
ytiks = 10.^([-4:0]);
x_range = [0 25];
y_range = [7e-5 1];
Y_log_scale_on = true;
x_label_name = "SNR (dB)";
y_label_name = "BER";
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Do not modify the following codes %%%%%
figure;
hold on;
col = {[0.6 0.2 0], [0.2 0.4 1], 'black', [0.3 0.4 0], [0.5 0.3 0.1]};
mark = {'-^', '-s', '-o', '->', '-^'};
leg = [];

if Y_log_scale_on
    set(gca, 'YScale', 'log')
end
set(gca, 'LineWidth', 1)
xlim(x_range);
ylim(y_range);
xl = xlim;
yl = ylim;

% plot grid lines
for ii = 1 : length(xtiks)
    if (xtiks(ii) == xl(1) || xtiks(ii) == xl(2))
        continue
    end
    plot(ones(1,2)*xtiks(ii),yl, 'Color', [1 1 1]*0.8, 'LineWidth',1.5);
end
for ii = 1 : length(ytiks)
    if (ytiks(ii) == yl(1) || ytiks(ii) == yl(2))
        continue
    end
    plot(xl,ones(1,2)*ytiks(ii), 'Color', [1 1 1]*0.8, 'LineWidth',1.5);
end

% plot box
plot(xl,ones(1,2)*yl(1), '-k',  ones(1,2)*xl(1), yl,'-k', 'LineWidth',2.5);
plot(xl,ones(1,2)*yl(2), '-k',  ones(1,2)*xl(2), yl,'-k', 'LineWidth',2.5);

% plot BER curve
for ii = 1 : n_data
    h = plot(data_x, data_y(ii,:), mark{ii}, 'LineWidth', 2.5, 'Color', col{ii}, 'MarkerSize', 8, 'MarkerFaceColor', 'w');
    leg = [leg h];
end

% X/Y Tick font
set(gca,'LineWidth',2,'TickLength',[0.01 0.01], 'Layer', 'top');
set(gca, 'YTickLabel',get(gca,'YTickLabel'), 'fontweight', 'bold', 'FontSize', 14)

% X/Y Label font
xlabel(x_label_name, 'FontSize', 16, 'FontName', 'Arial');
ylabel(y_label_name, 'FontSize', 16, 'FontName', 'Arial');
% Legend
legend(leg, legend_display_name, 'FontName', 'Arial', 'FontSize', 15, 'LineWidth', 1.5);
drawnow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saveas(gcf, 'line_plot.jpg')
