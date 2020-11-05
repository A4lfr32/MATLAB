function y=ejercicio4(A)
y=0;
    for i=1:size(A,1)
      for j=1:size(A,2)
        y=A(i,j)+y;
      end
    end
end