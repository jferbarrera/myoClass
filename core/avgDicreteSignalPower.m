function [ pwr ] = avgDicreteSignalPower( signal )
%DISCRETESIGNALPOWER This function computes the power of a signal

T = numel(signal);
pwr = (1/T) * sum( signal.^2 );

end

