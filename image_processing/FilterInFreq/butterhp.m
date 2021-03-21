function [ out ] = butterhp( im,d,n )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
h = size(im,2);
w = size(im,1);
[x y]=meshgrid(-floor(w/2):floor((w-1)/2),-floor(h/2):floor((h-1)/2));
out = 1./(1.+(d./sqrt(x.^2+y.^2)).^2*n);
end

