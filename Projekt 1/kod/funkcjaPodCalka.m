function [out] = funkcjaPodCalka(x)
out = x.^5 + 16 .* cos(4.*x).^3 - x.^4;
end