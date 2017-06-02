%% EE239AS HW #6

%% Problem 1

load('/Users/Yusi/Documents/EE239AS/HW6/JR_2015-12-04_truncated2.mat');

%% Part A

n_trials = length(R);

% The number of trials performed by Monkey J is 506. 

%% Part B

targets = zeros(2,n_trials);

for i = 1:n_trials
    targets(:,i) = R(i).target(1:2);
end

u_targets = unique(targets', 'rows');
n_targets = length(u_targets);
fprintf('Number of Unique Targets: %d \n', n_targets)

figure(1)
scatter(u_targets(:,1), u_targets(:,2))
title('Part B: 2D Representation of Targets')
xlabel('X-Position (mm)')
xlabel('Y-Position (mm)')

%% Part C

n_successes = 0;

for i = 1:n_trials
    n_successes = n_successes + R(i).isSuccessful;
end

n_fails = n_trials - n_successes;

fprintf('\nNumber of Failed Trials: %d \n', n_fails)

%% Part D

rate = zeros(1,n_trials);

for i = 1:n_trials
    rate(i) = 1000*length(unique(R(i).cursorPos','rows'))/length(R(i).cursorPos);
    % the rate is equal to the number of unique samples per trial divided
    % by the amount of time elapsed during that trial
end

rate_avg = mean(rate);

% No, the system does not sample at 1000 Hz. If it did, then the rate
% should be 1000 since there would be a unique data sample at every time
% point (1 ms). Sometimes the cursor does not move, which accounts for a
% slightly varing rate per trial.

fprintf('\nAverage Sampling Rate: %2.2f Hz\n', rate_avg)

%% Part E

% plot Monkey J's ending position for every trial
% 
% for i = 1:n_trials
%     R(1).cursorPos(1:2,end)
% end

figure(2)
hold on

for i = 1:n_trials
    u_pos = unique(R(i).cursorPos','rows');
    scatter(u_pos(:,1), u_pos(:,2))
end

hold off

title('Part E: 2D Representation of Monkey J Hand Position')
xlabel('X-Position (mm)')
xlabel('Y-Position (mm)')

% do not see refractory period because multiple neurons firing

%% Part F

n_electrodes = size(full(R(1).spikeRaster),1);

fprintf('\nNumber of Electrodes: %d \n', n_electrodes)

%% Part G

raster_cell = {};

iter = 0;
for i = 1:n_trials
    if (isequal(R(i).target(1:2),[120; 0]))
        % check if the target is to the right
        iter = iter+1;
        % iterate if correct target
        full_raster = full(R(i).spikeRaster);
        % convert spike train to full matrix
        raster_cell{iter} = find(full_raster(17,:)>0);       
        % find indices where there are spikes on electrode 17 and store into 
        % a cell for plotRaster
    end
end

figure
plotRaster(raster_cell)
ylabel('Trial #')
title('Part G: Spike Trains for Right Target')

%% Part H

ISI_dist = [];

for i = 1:length(raster_cell)
    ISI_dist = [ISI_dist, diff(raster_cell{i})];
end

bins = 0:10:max(ISI_dist);
ISI_hist = histcounts(ISI_dist,bins,'Normalization','pdf');
bar(bins(1:end-1), ISI_hist, 'histc')
title('Part H: ISI Distribution')
xlabel('ISI Length (ms)')
ylabel('Probability')

%% Part I

reach_raster = {};
reach_target = u_targets';

iter = zeros(1,n_targets);
reach_raster = cell(1,n_targets);

for i = 1:n_trials
    if (isequal(R(i).target(1:2),reach_target(:,1)))
        % remove if target is in the center
        iter(1) = iter(1)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{1}(:,:,iter(1)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,2)))
        % remove if target is in the center
        iter(2) = iter(2)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{2}(:,:,iter(2)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,3)))
        % remove if target is in the center
        iter(3) = iter(3)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{3}(:,:,iter(3)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,4)))
        % remove if target is in the center
        iter(4) = iter(4)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{4}(:,:,iter(4)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,5)))
        % remove if target is in the center
        iter(5) = iter(5)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{5}(:,:,iter(5)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,6)))
        % remove if target is in the center
        iter(6) = iter(6)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{6}(:,:,iter(6)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,7)))
        % remove if target is in the center
        iter(7) = iter(7)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{7}(:,:,iter(7)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,8)))
        % remove if target is in the center
        iter(8) = iter(8)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{8}(:,:,iter(8)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
    if (isequal(R(i).target(1:2),reach_target(:,9)))
        % remove if target is in the center
        iter(9) = iter(9)+1;
        % iterate if correct target
        full_reach_raster = full(R(i).spikeRaster);
        reach_raster{9}(:,:,iter(9)) = full_reach_raster(:,1:500);
        % convert spike train to full matrix and save first 500 ms
    end
end

dt = 25;
spike_count = cell(1,n_targets);
spike_avg = cell(1,n_targets);

spike_avg_smooth = cell(1,n_targets);

for i = 1:n_targets
    spike_count{i} = binFunc(reach_raster{i},dt);
    spike_avg{i} = sum(spike_count{i}(17,:,:),3)/iter(i);
    spike_avg_smooth{i} = smooth(spike_avg{i},5);
    % taking the average across all trials for each bin 
    % iter(i) is the number of trials for each direction
end


figure(3)
t_plot = 25:dt:500;
% time axis
plot(t_plot, spike_avg_smooth{1}, t_plot, spike_avg_smooth{2}, t_plot, spike_avg_smooth{3},...
    t_plot, spike_avg_smooth{4}, t_plot, spike_avg_smooth{6}, t_plot, spike_avg_smooth{7},...
    t_plot, spike_avg_smooth{8}, t_plot, spike_avg_smooth{9})
axis([25 500 0 3.5])
title('Part I: PSTHs for Eight Reach Directions')
xlabel('Time (ms)')
ylabel('Number of Spikes Per Bin')

% tells you avg firing rate for electrode when reaching to target
% plotting lambda(t) for poisson process -- avg firing rate through time
% for 8 conditions
% can be used to generate spike 
% neurons on each electrode are uncorrelated
% poisson process generated will be for that group of neurons -- not neuron
% specific 