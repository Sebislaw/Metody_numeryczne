function [wOptymalny] = optymalnyParametrSOR(A)
% OPIS
wOptymalny = 2/(1+sqrt(1-max(abs(eig(diag(diag(A))\(diag(diag(A))-A))))^2));
end