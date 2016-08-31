

neurons = [8 8];

csi = 0;          % momentum 
eta = 1e-1*[1 1];  %learning rate for BIAS and WEIGHT
span = 0.4;
runs = 3e4;
lambda = 0;

[input,target] = extractDataSets('F:\BitBucket\ProjetoFinal\projetofinal\FES2CHMAIN24_V85\Teste\Antigo\',...
                        'Adriano1204PIRele_4Ciclos.txt');
input = input(2:end,:);


% input = 0:0.01:5;
% target = sinc(input);

target = (target - nanmean(target))/nanstd(target);
target(isnan(target))=0;
% input = (input - mean(input))/std(input);
                    
[trainInd, valInd,testInd] = dividerand(length(target),0.6,0.4,0.0);


% target = (target - mean(target))/std(target);
% target = (target-min(target));
% 
for k=1:size(input,1);
   input(k,:) = (input(k,:)-nanmean(input(k,:)))/nanstd(input(k,:));
end
input(isnan(input))=0;
% input = input(trainInd);
% target = target(trainInd);


% input = input(:,trainInd);
% target = target(1,trainInd);


% input(end,:) = input(end,:)/9;
% input(end-1,:) = input(end-1,:)/9;


L = NNGenerator( neurons, span, input, 1);
                          
  [L_train, J,J_v] =  trainResBPBatch(L, input(:,trainInd), target(:,trainInd),...
                input(:,valInd),target(:,valInd),...
                runs,...
                csi, eta,...
                @RMSE, @tgh, @linearAct);
 
 plotNNResults(L_train , J ,J_v, input ,target, @tgh, @linearAct)