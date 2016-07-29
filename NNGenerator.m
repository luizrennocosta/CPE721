function [L]= NNGenerator( neurons, input, target,...
                              epoch, cost_function,...
                              inner_activation, outter_activation)
%NNGENERATOR Summary of this function goes here
%   Detailed explanation goes here

    if isrow(input)
        input = input';
    end
    
    if isrow(target)
        target = target';
    end
    
    span = 0.2;
    L.neurons = neurons;

    column = 1;
    size_output = 1;
    
    % neurons is a variable that holds the number of neurons of each
    % hidden layer, therefore, specifying neurons = [5 4 7] creates a NN
    % with 3 hidden layers, each with 5, 4 , and 7 neurons respectively.
    L(1).weight = -span + 2*span*rand(neurons(1),column);
    L(1).bias = -span + 2*span*rand(neurons(1),1);
    for n = 2:length(neurons)
        L(n).weight = -span + 2*span*rand(neurons(n),neurons(n-1));
        L(n).bias = -span + 2*span*rand(neurons(n),1);
    end
    L(length(neurons)+1).weight = -span + 2*span*rand(size_output,neurons(end));
    L(length(neurons)+1).bias = -span + 2*span*rand(size_output,1);


    L(1).input = input(1,:);
    for n=1:length(neurons)+1
         L(n).Y = zeros(size((L(n).weight)*L(n).input + L(n).bias));
        (L(n).weight)*L(n).input + L(n).bias;
        (L(n).weight)*L(n).input + L(n).bias;
        [L(n).Z, L(n).dZ] = tgh(L(n).Y);
        L(n+1).input = L(n).Z;
    end

    for n=fliplr(1:length(neurons)+1)
        L(n).alpha = zeros(size(target(1,:)));
        L(n).db = zeros(size(L(n).bias));
        L(n).dW = zeros(size(L(n).weight))';
    end
    fprintf('NN created\n')

end









