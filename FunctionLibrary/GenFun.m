function [myFun,myVar,varList] = GenFun(var,dim,bds,types)
arguments
    var 
    dim 
    bds 
    types (1,1) string {mustBeMember(types,["simple" "complex"])} = "complex" 
end
   varIdx = randperm(numel(var),dim);
   varList = var(varIdx);
   if types == "complex"
       opsOpts = ["+" "*" "o" "-"];
   else
       opsOpts = ["+" "*" "-"];
   end
   opsIdx = randi(numel(opsOpts),dim-1,1);
   opsList = opsOpts(opsIdx);
   newFun = sym(0);
   while isSymType(newFun,"piecewise") || isAlways(newFun == 0,"Unknown","false") || isinf(newFun) || isnan(newFun)
       newFun = GenFunDiff(varList(1),bds,types);
   end
   myFun = newFun;

   for idx = 2:dim
       newFun = GenFunDiff(varList(idx),bds,types);
       while isSymType(newFun,"piecewise") || isAlways(newFun == 0,"Unknown","false") || isinf(newFun) || isnan(newFun)
            newFun = GenFunDiff(varList(idx),bds,types);
       end
       oldFun = myFun;
       switch opsList(idx-1)
           case "+"
               myFun = myFun + newFun;
           case "*"
               myFun = myFun*newFun;
           case "o"
               testFun = subs(myFun,varList(idx-1),varList(idx-1)^randi(3,1)*newFun);
               if isSymType(testFun,"piecewise") || isAlways(testFun == 0,"Unknown","false") || isinf(testFun) || isnan(testFun)
                   myFun = subs(myFun,varList(idx-1),varList(idx-1)^randi(3,1)*varList(idx)^randi(3,1));
               else
                   myFun = testFun;
               end
           case "-"
               myFun = myFun - newFun;
       end
   end
   myVar = varList(randi(dim,1));
end

function myFun = GenFunDiff(var,bds,TypeOpts)
% GenFunDiff generates a random function with a simple derivative
%
% Inputs: var is the independent variable
%         dim is an integer that specifies the number of variables in myFun
%         bds is a 1x2 vector of increasing integer values that set
%             the range for the coefficients
% Outputs: myFun is the generated symbolic function
syms h(t)                    % Create a symbolic function h(t)
params = randi(bds,[1 4]);   % Randomly choose parameter values
shift = randi([0 bds(2)],1); % Randomly choose a shift that may be 0
sgns = randi([0 1],[1 3]);   % Randomly choose +/- signs
type = randi([1 6],1);       % Randomly choose the function type

% For readability, create parameters a,b,c, and d
a = (-1)^sgns(1)*params(1);
b = (-1)^sgns(2)*params(2);
c = max(params(3),params(4));  % c > 0, it is only used as a denominator
d = (-1)^sgns(3)*shift;

if TypeOpts == "simple"
    if type == 4
        type = 1;
    end
    d = 0;
    c = 1;
end

if a==0
    a = 1;
end

if b==0
    b = 1;
    d = 0;
end

switch type
    case 1
        h(t) = a*t^(b);
    case 2
        h(t) = a*t^(b/c);
    case 3
        h(t) = a*exp(b*t);
    case 4
        h(t) = a*log(abs(b)*t);
    case 5
        h(t) = a*sin(b*t+d);
    case 6
        h(t) = a*cos(b*t+d);
end

myFun = h(var);
end


%[appendix]{"version":"1.0"}
%---
