clear, clc
% Codes for plotting line chart
% Author : Yu-Cheng Lin 2021. 08. 06

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Some of the line must be modified to 
%    arrow in Visio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%% modify here %%%%%%%%%%%%%%%%
%% Example 1
values = [55189  53141  14229  3347];
yticks = {'[A] ', '[B] ', '[C] ', '[D] '};
%% Example 2
values = [20443  5563  2654];
yticks = {'[A] ', '[B] ', '[C] '};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Do not modify the following codes %%%%%
bar_width = 0.7;
figure;
barh(fliplr(values), 'FaceColor', [0.7 0.7 0.7],'FaceAlpha',0.6,'BarWidth', bar_width, 'LineWidth',3);
hold on;
set(gca,'yticklabel', fliplr(yticks))
set(gca, 'XTickLabel',get(gca,'XTickLabel'), 'fontweight', 'bold', 'FontSize', 14, 'XAxisLocation','top','LineWidth', 3)
yl = ylim; xl = xlim;
for ii = 1 : length(values)-1
    plot([values(ii) values(ii+1)], [length(values)-ii+1-bar_width/2 length(values)-ii+bar_width/2], 'Color', [1 1 1]*0, 'LineWidth',3);
end
box off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saveas(gcf, 'hbar_plot.jpg')