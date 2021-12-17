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
value = {[2 1 2 1 1 1 1], [-inf], [2 1 2 1], [-5 1 1 1]};
text_value = {["A", "B1", "B2", "B3", "E", "F", "G"], [], ["A", "B1", "B2", "B3"], ["","E", "F", "G"]};
offset = 0.8;
%% Example 2
value = {[2 2 1 1], [-1 2 -1 2 1 1 1], [-inf], [2 2 1], [-1 2 -1 2 1 1], [-2 1 1 1 1]};
text_value = {["A", "B2", "B3", "E"], ["", "A", "", "B2", "B3", "E", "F"], [], ["A", "C1", "E"], ["", "A","", "C1","E","F"], ...
    ["","C2", "C2", "C2", "C2"]};
offset = 0.4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Do not modify the following codes %%%%%
block_height = 0.6;
figure;
hold on
col = {[0.4 0.6 1], [0.55 0.85 0.3], [0.7 0.7 0.7], [0.3 0.5 0.9], [0.3 0.5 0.9], [0.3 0.5 0.9], [0.3 0.5 0.9]};
for ii = 1 : length(value)
    cur_data = value{ii};
    cur_text_value = text_value{ii};
    cur_x = 0;
    for i_block = 1 : length(cur_data)
        if(cur_data(i_block) == -inf) offset = 0; break; end
        if(cur_data(i_block) < 0) cur_x = cur_x - cur_data(i_block); continue; end
        cur_str_char = char(cur_text_value(i_block));
        rectangle('Position',[cur_x,length(value)-ii+0.5-block_height/2-offset, ...
            cur_data(i_block),block_height],'FaceColor',col{cur_str_char(1)-'A'+1},'EdgeColor','k', 'LineWidth',3);
        text(cur_x+cur_data(i_block)/2,length(value)-ii+0.5-offset,cur_text_value(i_block), ...
            'HorizontalAlignment','center', 'FontName', 'Arial', 'FontSize', 15,'fontweight','bold');
        cur_x = cur_x + cur_data(i_block);
    end
end

set(gca,'LineWidth',2,'TickLength',[0.01 0.01]);
set(gca, 'YTickLabel',[])
set(gca, 'XTickLabel',[])
xl = xlim;
yl = ylim;
% plot box
plot(xl,ones(1,2)*yl(1), '-k',  ones(1,2)*xl(1), yl,'-k', 'LineWidth',2.5);

xlabel('Cycle', 'FontSize', 16, 'FontName', 'Arial','fontweight','bold');
ylabel('Task', 'FontSize', 16, 'FontName', 'Arial','fontweight','bold');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saveas(gcf, 'schedule_plot.jpg')
