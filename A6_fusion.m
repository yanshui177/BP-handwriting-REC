load('sim_PCA050_knot50_whiten_log_cgb_mc09_121_P9999_0.9569.mat')
sim01=sim2;
load('sim_PCA050_knot50_whiten_log_cgf_mc09_108_P9999_0.952.mat')
sim02=sim2;
load('sim_PCA050_knot50_whiten_log_cgp_mc09_119_P9999_0.9568.mat');
sim03=sim2;
load('sim_PCA050_knot50_whiten_log_gdx_mc09_278_P0.0179_0.9479.mat');
sim04=sim2;
load('sim_PCA050_knot50_whiten_log_oss_mc09_142_P9999_0.9522.mat');
sim05=sim2;
load('sim_PCA050_knot50_whiten_log_scg_mc09_122_P0.00966_0.9589.mat');
sim06=sim2;
load('sim_PCA050_knot50_whiten_log_scg_mc09_128_P0.00936_0.9577.mat');
sim07=sim2;
load('sim_PCA0100_knot50_whiten_log_scg_mc09_000_P0.00725_0.9588.mat');
sim08=sim2;
load('sim_PCA050_knot50_whiten_log_gda_mc00_390_P0.0188_0.9432.mat');
sim09=sim2;
load('sim_PCA0100_knot60_whiten_log_scg_mc09_103_P0.00756_0.9639.mat');
sim10=sim2;
sim2=sim01+sim02+sim03+sim04+sim05+sim06+sim07+sim08+sim09+sim10;
[~ , Y2] = max(sim2);
ratio2 = mean(Y2==double(test_labels'));
fprintf('\tTest ratio£º %0.4g \n',ratio2);
