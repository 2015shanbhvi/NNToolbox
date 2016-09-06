function [ y ] = averagefunction( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if ~isvector(x)
    error('Input must be a vector');
end
y = sum(x)/length(x);

end

