hold off;
clf;
hold on;
e_plot = e2';
ticks = hidden;
for i = 1:trial_num
    scatter(ticks, e_plot(trial_num,:));
end
med = median(e_plot);
plot(ticks,med);

tr = 1:trial_num;
tr(trial_num + 1) = 'median';
lgd = legend(tr);
lgd.Title.String = 'Trial';
legend('Location','northwest')

xtick(ticks);
ylabel('Mean Squared Error');
xlabel('Nodes in Hidden Layer');
title('BackProp with Lateral Inhibition Preprocessing: Performance vs # Hidden Neurons');