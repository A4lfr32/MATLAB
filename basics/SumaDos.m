function a=SumaDos(min,max,paso)
a=0;
    for ii = min:max
        a = a + min + ii*paso;
    end
end