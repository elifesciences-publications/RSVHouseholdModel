%% Plot for vaccine efficiency

load('vaccine_efficiency_1.5.mat');
load('baseline_inf_numbers_1.5.mat');

%%

F = (num_vacs(1,:) == 0);
num_vacs(3,F) = 0;

R = 3.336; %inflation due to non KDHSS hospitalisation
num_vacs(3,:) = num_vacs(3,:)*R;
num_vacs(4,:) = num_vacs(4,:)*R;

reduction_hosp(3:end,:) = R*reduction_hosp(3:end,:);
reduction_infs(3:end,:) = R*reduction_infs(3:end,:);
%% Collate the pairs of interventions
mat_prot = unique(num_vacs(1,:));
house_prot = unique(num_vacs(2,:));

I_eff_mat = zeros(length(house_prot),length(mat_prot));
H_eff_mat = zeros(length(house_prot),length(mat_prot));
SU_I_eff_mat = zeros(length(house_prot),length(mat_prot));
SU_H_eff_mat = zeros(length(house_prot),length(mat_prot));



%%

% For each of household coverage 25,50,75,100% do a plot of mat. vaccine efficacy 
F = (num_vacs(1,:) == 0);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
    K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

%NB: MAB eff = 0 is a special case
I_eff_mat(:,1) = inf_eff(:,2);
H_eff_mat(:,1) = hosp_eff(:,2);
SU_I_eff_mat(:,1) =  inf_eff(:,2);
SU_H_eff_mat(:,1) = hosp_eff(:,2);
%% Mat prot eff = 15
F = (num_vacs(1,:) == 15);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
    K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

I_eff_mat(:,2) = inf_eff(:,2);
H_eff_mat(:,2) = hosp_eff(:,2);
SU_I_eff_mat(:,2) =  inf_eff(:,3);
SU_H_eff_mat(:,2) = hosp_eff(:,3);


%% mat prot = 30
F = (num_vacs(1,:) == 30);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
     K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

I_eff_mat(:,3) = inf_eff(:,2);
H_eff_mat(:,3) = hosp_eff(:,2);
SU_I_eff_mat(:,3) =  inf_eff(:,3);
SU_H_eff_mat(:,3) = hosp_eff(:,3);


%% mat prot = 45
F = (num_vacs(1,:) == 45);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
 K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

I_eff_mat(:,4) = inf_eff(:,2);
H_eff_mat(:,4) = hosp_eff(:,2);
SU_I_eff_mat(:,4) =  inf_eff(:,3);
SU_H_eff_mat(:,4) = hosp_eff(:,3);

%% mat prot = 60
F = (num_vacs(1,:) == 60);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
     K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

I_eff_mat(:,5) = inf_eff(:,2);
H_eff_mat(:,5) = hosp_eff(:,2);
SU_I_eff_mat(:,5) =  inf_eff(:,3);
SU_H_eff_mat(:,5) = hosp_eff(:,3);

%% mat prot = 75
F = (num_vacs(1,:) == 75);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
     K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

I_eff_mat(:,6) = inf_eff(:,2);
H_eff_mat(:,6) = hosp_eff(:,2);
SU_I_eff_mat(:,6) =  inf_eff(:,3);
SU_H_eff_mat(:,6) = hosp_eff(:,3);
%% mat prot = 90
F = (num_vacs(1,:) == 90);
inf_eff = zeros(length(house_prot),3);
hosp_eff = zeros(length(house_prot),3);

for i = 1:length(house_prot)
    hp = house_prot(i);
    G = (num_vacs(2,:) == hp);
     K = (num_vacs(2,:) == 0);
    f = find(F.*G);
    f2 = find(F.*K);
    nvs_mp = num_vacs(3,f);
    nvs_su = num_vacs(4,f);
    inf_eff(i,1) = median(reduction_infs(3:end,f)/nvs_mp);
    inf_eff(i,2) = median(reduction_infs(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        inf_eff(i,3) = median((reduction_infs(3:end,f) - reduction_infs(3:end,f2)  )/(nvs_su));
    end
    hosp_eff(i,1) = median(reduction_hosp(3:end,f)/nvs_mp);
    hosp_eff(i,2) = median(reduction_hosp(3:end,f)/(nvs_su+nvs_mp));
    if any(f2)
        hosp_eff(i,3) = median((reduction_hosp(3:end,f) - reduction_hosp(3:end,f2)  )/(nvs_su));
    end
end

I_eff_mat(:,7) = inf_eff(:,2);
H_eff_mat(:,7) = hosp_eff(:,2);
SU_I_eff_mat(:,7) =  inf_eff(:,3);
SU_H_eff_mat(:,7) = hosp_eff(:,3);
%%
figure(1)
clf
H_eff_mat(isinf(H_eff_mat)) = 0;
I_eff_mat(isinf(I_eff_mat)) = 0;

subplot(1,2,1)
bar(house_prot,H_eff_mat)

l = legend('No MAB vac.','Mat. prot. = 15','Mat. prot. = 30','Mat. prot. = 45','Mat. prot. = 60','Mat. prot. = 75','Mat. prot. = 90');
l.Box = 'off';
l.Location = 'northeast';
% 
set(gca,'FontSize',18);
xlabel('Household coverage (IRP)','FontSize',28)
ylabel('Decrease in hospitalisations per vaccine used','FontSize',28)
set(gca,'XTick',[0 0.25 0.5 0.75 1],'XTickLabel',{'0%', '25%', '50%', '75%', '100%'})
title('Vaccine efficiency (hospitalisations)')
ylim([0,0.004])
% 
% 
subplot(1,2,2)
bar(house_prot,I_eff_mat)



set(gca,'FontSize',18);
xlabel('Household coverage (IRP)','FontSize',28)
ylabel('Decrease in infections per vaccine used','FontSize',28)
set(gca,'XTick',[0 0.25 0.5 0.75 1],'XTickLabel',{'0%', '25%', '50%', '75%', '100%'})
title('Vaccine efficiency (infections)')




%% 
annotation('textbox',[0.03,0.86,0.1,0.1],'String','A','FitBoxToText','on','FontSize',40,'LineStyle','none');
annotation('textbox',[0.48,0.86,0.1,0.1],'String','B','FitBoxToText','on','FontSize',40,'LineStyle','none');

%%


