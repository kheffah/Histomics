%
% PanCan Histomic-Genomic Analysis
%

clear; close all; clc;

DataPath = '/home/mohamed/Desktop/CooperLab_Research/PanCan_Project/Data/';
addpath(DataPath)

%%

% initialize genomic matrices
N_genes = 25127;
N_patients = 10713;
Genomic1 = num2cell(zeros(N_genes, 3));
Genomic2 = zeros(N_genes, N_patients);

%
% Read genomic data (LINE-BY-LINE)
% File is HUGE, so crashes MATLAB (and R) when read all at once
%
fid = fopen('all_thresholded.by_genes_whitelisted.tsv');

tline = fgetl(fid);
Genomic_Headers = strsplit(tline, '\t'); % Headers

line = 0
while 1 %line < 21
    
    clc
    line = line + 1
    
    tline = fgetl(fid);
    if ~ischar(tline), break, end
     
    tline_temp = strsplit(tline, '\t');
    
    tline_temp2 = tline_temp(:,4:end);
    tline_temp2 = str2num(char(tline_temp2))';
    
    Genomic1(line,:) = tline_temp(:,1:3); %first three columns
    Genomic2(line,:) = tline_temp2; %patient data
        
end
fclose(fid);


%% write output structure and save it


Genomic.Headers = Genomic_Headers;
Genomic.Genes = Genomic1;
Genomic.Data = Genomic2;

save([DataPath,'GenomicData.mat'],'Genomic','-v7.3') ;