% Unit Step Function
% Written by Josh Humphrey

function result = unitStep(t)
if (t < 0)
    result = 0;
else
    result = 1;
end

