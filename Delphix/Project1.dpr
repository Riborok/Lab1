program lab1;
{Calculate function value f(x,n), for n = 10, 11 ... 15 and x, changing from 0.6 to 1.1
with a step 0.1}


{$APPTYPE CONSOLE}
uses
  System.SysUtils;

const
  Step= 0.1;
  nStart=10;
  nLast=15;
  xLast=1.1;
  {nStart - start value for n,
  nLast - last value for n,
  Step - step to change x.}

Var
  k : integer;
  Sum, ValueForSum1, ValueForSum2, ValueForSum3, FirstValue, xStart, Res : real;
  {k - counter for sum,
  Sum - sum value,
  ValueForSum1 - first numerator value to calculate the sum,
  ValueForSum2 - second numerator value to calculate the sum,
  ValueForSum3 - denominator value to calculate the sum,
  x - function argument,
  Res - function value.}

Begin
  xStart:= 0.6; //x - start value for x
  while xStart<= xLast do //Iterate over the value of x, changing from 0.6 to 1.1 with a step 0.1
  begin
    Sum:= 0;
    for k := 1 to nLast do //Compose Sum from k to last value for n
    begin
      ValueForSum1:= 1/exp(2*(k+1)/3) - k;

      ValueForSum2:= abs(sin(k*xStart));
      //Calculate the root of 5+k, considering the modulus.
      If ValueForSum2 <> 0 then
        ValueForSum2:= exp(1/(5+k)*ln(ValueForSum2));


      ValueForSum3:=xStart+(Ln(k*xStart*xStart*xStart*xStart)/Ln(2));
      //Calculate the root of 3. Using e and ln, same as before
      if ValueForSum3>0 then
        ValueForSum3:= exp(1/3*ln(ValueForSum3))
      else if ValueForSum3<0 then
        ValueForSum3:=(-1) * exp(1/3*ln((-1)*ValueForSum3));




      Sum:= Sum + ValueForSum1 * ValueForSum2 / ValueForSum3;

      if k >= nStart then //At this stage consider the result, k=n(present value)
      begin
        FirstValue:= 1+cos(Pi*xStart/k)*cos(Pi*xStart/k);
        //Calculate the root of 5. Using e and ln, same as before
        case IntToStr(Trunc(FirstValue))[1] of
          '-':FirstValue:=(-1) * exp(1/5*ln((-1)*(1+FirstValue)));
          '0': FirstValue:=0;
          else FirstValue:= exp(1/5*ln(FirstValue));
        end;


        Res:= FirstValue + Sum;
        Writeln('x= ', xStart:3:1, ' n= ', k ,' f(x,n)= ', Res:9:5);
      end;

    end;
    Writeln;
    xStart:=xStart + Step;

  end;

  Readln;
end.