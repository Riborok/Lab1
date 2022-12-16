# Lab №1. Function counting 
---
### Task:
![The task](https://i.imgur.com/l1b6cAw.png)

>The program сalculates the value of the function f(x,n), for ***n = 10, 11 ... 15*** and ***x***, changing from ***0.6 to 1.1*** with a step ***0.1***

#### Language: Delphi

### Algorithm scheme: 

![Algorithm scheme Part1](https://i.imgur.com/o251Fc9.png)

![Algorithm scheme Part2](https://i.imgur.com/hTVXsu8.png)

### Code:
``` pascal
Program lab1;
{Calculate the value of the function f(x,n), for n = 10, 11 ... 15 and x, changing from 0.6 
to 1.1 with a step 0.1}

{$APPTYPE CONSOLE}

Const
  Step= 0.1;
  nStart=10;
  nLast=15;
  xLast=1.1;
  xStart=0.6;
  {nStart - start value for n,
  nLast - last value for n,
  xStart - start value for n,
  xLast - last value for x,
  Step - step to change x.}

Var
  k : integer;
  Sum, ValueForSum1, ValueForSum2, ValueForSum3, FirstValue, Res, x : real;
  {k - counter for sum,
  Sum - sum value,
  ValueForSum1 - first numerator value to calculate the sum,
  ValueForSum2 - second numerator value to calculate the sum,
  ValueForSum3 - denominator value to calculate the sum,
  FirstValue - the value of the first expression,
  x - function argument,
  Res - function value.}

Begin

  //x - start value for x
  x:= xStart;

  //Iterate over the value of x, changing from 0.6 to 1.1 with a step 0.1
  while x<= xLast do
  begin

    //Reset the amount
    Sum:= 0;

    //Compose Sum from k to last value for n
    for k := 1 to nLast do
    begin

      ValueForSum1:= 1/exp(2*(k+1)/3) - k;

      //Calculate the root of 5+k, considering the modulus.
      ValueForSum2:= abs(sin(k*x));
      If ValueForSum2 <> 0 then
        ValueForSum2:= exp(1/(5+k)*ln(ValueForSum2));

      //Calculate the root of 3. Using e and ln, same as before
      ValueForSum3:=x+(Ln(k*x*x*x*x)/Ln(2));
      if ValueForSum3>0 then
        ValueForSum3:= exp(1/3*ln(ValueForSum3))
      else if ValueForSum3<0 then
        ValueForSum3:=(-1) * exp(1/3*ln((-1)*ValueForSum3))

      //For lab I can't use break :(
      //But left in the code :)
      else
      begin
        writeln('At x= ',x:3:1,' and n= ',k,' the value of the function is not defined');
        break;
      end;

      Sum:= Sum + ValueForSum1 * ValueForSum2 / ValueForSum3;

      //At this stage consider the result, k=n(present value)
      if k >= nStart then
      begin

        //Calculate the root of 5. Using e and ln, same as before
        FirstValue:= 1+cos(Pi*x/k)*cos(Pi*x/k);
        if FirstValue>0 then
          FirstValue:= exp(1/5*ln(FirstValue))
        else if FirstValue<0 then
          FirstValue:=(-1) * exp(1/5*ln((-1)*FirstValue));

        Res:= FirstValue + Sum;
        writeln('x= ', x:3:1, ' n= ', k ,' f(x,n)= ', Res:9:5);
      end;

    end;
    writeln;
    x:=x + Step;
  end;

  Readln;
End.
```

