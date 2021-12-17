clear, clc
% Codes for plotting line chart
% Author : Yu-Cheng Lin 2021. 08. 06

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Some of the line must be modified to 
%    arrow in Visio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%% modify here %%%%%%%%%%%%%%%%
%% Example 1
values = [2028305.3/2  2028305.3  (2028305.3-376417-583269+479843+169565)/1.184*2 ];
xticks = {'16-QAM ', 'Impl. ', '4-QAM'};
add_spacing = 1;
line_on = true;
%% Example 2
values = [0.107 0.214 ; 0.103 0.411 ; 0.112 0.335];
xticks = {'None', '2x Unfold', '4x Unfold'};
add_spacing = 0;
line_on = false;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Do not modify the following codes %%%%%
bar_width = 0.5;
if add_spacing == 1
    values = [values ; zeros(1, length(values)) ]; 
    values = values(1:end-1);
    xticks_interleave = {};
    for i_ticks = 1 : length(xticks) xticks_interleave{2*i_ticks-1} = xticks{i_ticks}; xticks_interleave{2*i_ticks} = ""; end
    xticks = xticks_interleave;
end
figure;
bar(values, 'FaceColor', [0.7 0.7 0.7],'FaceAlpha',0.6,'BarWidth', bar_width, 'LineWidth',3);
hold on;
% set(gca,'yticklabel', yticks)
set(gca, 'XTickLabel', get(gca,'XTickLabel'), 'fontweight', 'bold', 'FontSize', 14,'LineWidth', 3)
set(gca,'XTickLabel', xticks)
yl = ylim; xl = xlim;
if line_on
    for ii = 1 : (1+add_spacing) : (length(values)-1-add_spacing)
        plot([ii+bar_width/2 ii+add_spacing+1-bar_width/2], [values(ii) values(ii+1+add_spacing)], 'Color', [1 1 1]*0, 'LineWidth',3);
    end
end
box off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saveas(gcf, 'vbar_plot.jpg')
