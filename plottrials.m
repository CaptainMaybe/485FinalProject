hold off;
clf;
hold on;
e_plot = e2';
ticks = [.01 .02 .03 .04 .05];
for i = 1:trial_num
    scatter(ticks, e_plot(i,:));
end
med = median(e_plot);
plot(ticks,med);
xticks(ticks);
lgd = legend('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'median');
lgd.Title.String = 'Trial';
legend('Location','northeast');
lgd.NumColumns = 10;

% xticks(ticks);
ylabel('Mean Squared Error');
xlabel('Percent Change in Learning Rate');
%title('hi');
title('Logsig, Variable Learning Rate: Learning Rate Change vs Error');