%[text] # Partial Differentiation
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] Many quantities in science, engineering, economics, and data science depend on more than one input. Temperature depends on location, profit depends on both price and demand, and elevation above sea level depends on both latitude and longitude. The method of gradient descent, which is a standard optimization method, requires you to track how a function changes with respect to many variables at once. Partial derivatives let us isolate the effect of one variable, while gradients combine this information to describe the direction of steepest change. These ideas form the mathematical foundation of optimization algorithms such as gradient descent or sensitivity analysis, which power machine learning and data-driven decision-making.
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] This live script is intended to be used both with the code visible and output inline, and with the code hidden. On the **View** tab of the MATLAB Toolstrip, in the **View** section, select **Output Inline** or **Hide Code**. Alternatively, switch between **Output Inline** using the icon ![live script output inline icon](text:image:80be) and **Hide Code** using the icon ![live script code hidden icon](text:image:6cf6) at the top right of the Live Editor pane. Sections with interactive visualizations are often easier to use when the code is hidden, but you are always free to explore how the code works.
%[text] ![Lightbulb mark](text:image:7c7e) Interacting with this live script will build some familiarity with MATLAB as concepts and commands are introduced together. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2-hour online tutorial that teaches the essentials of MATLAB.
%[text] ![Warning symbol](text:image:8ece) For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections, and they may generate errors if run out of order.
%[text] The ![Try this icon](text:image:0d75) and ![Exercise icon](text:image:0d89) icons refer to two different types of interactive activities that you will find in this script. The ![Try this icon](text:image:19cf) usually indicates an interaction in which you will explore a visualization of a concept introduced in this script. The ![Exercise icon](text:image:516e) interactions are designed to challenge your understanding of those concepts.
%%
%[text] ## Background
%[text] In single‑variable calculus, the derivative measures the rate of change of a function with respect to one variable. In multivariable calculus, functions often take the form
%[text]{"align":"center"} $f(x,y)${"altText":"f(x,y)"}, $f(x,y,z)${"altText":"f(x,y,z)"}, or more generally $f(\\mathbb{\\vec{x})${"altText":"f(\mathbb{\vec{x})"}.
%[text] When there are two independent variables, we can visualize such functions as surfaces in 3D space. The calculus behaves the same way in higher dimensions, but visualization is more difficult.
% Define matrix values for x and y covering the domain {-3 <= x,y <= 3} %[text:anchor:M_0019]
[x,y] = meshgrid(-3:0.1:3);
% Note the use of .^ and .* for component-wise operations
f_function = -x.^2 + 2*x.*y + y.^2;    % Define f(x,y) %[control:editfield:1add]{"position":[14,35]}
  %[control:button:9418]{"position":[1,2]}
surf(x,y,f_function)
xlabel("x")
ylabel("y")
zlabel("f(x,y)")
title('A Function of Two Variables')
%[text] Because multiple inputs vary independently, we study change in one direction at a time. Partial derivatives isolate the effect of changing one variable while treating all others as constants.
%[text] ![Try icon](text:image:422d) **Try**. [Change the definition](internal:M_0019) of $f(x,y)${"altText":"f(x,y)"} to other functions of `x` and `y`. Plot the new surface.
%[text] ![Reflect icon](text:image:9aab) **Reflect**. How would you describe how the function is changing?
%%
%[text] ## Definition of Partial Derivatives
%[text] %[text:anchor:M_1b8c] A partial derivative measures how the function changes when one variable changes and the others are held constant. This is the rate of change of $f${"altText":"f"} with respect to a given variable. The same limit definition for the derivative applies, with only one variable allowed to change at a time. Say $f${"altText":"f"} is a function of four variables, $f(x,y,z,w)${"altText":"f(x,y,z,w)"}.
%[text] The partial derivative of $f${"altText":"f"} with respect to $x${"altText":"x"} is:
%[text]{"align":"center"} $\\frac{\\partial f}{\\partial x}(x,y,z,w)= \\lim\_{⁡h\\to 0} \\frac{f(x+h,y,z,w)-f(x,y,z,w)}{h}${"altText":"\frac{\partial f}{\partial x}(x,y,z,w)= \lim\_{⁡h\to 0} \frac{f(x+h,y,z,w)-f(x,y,z,w)}{h}"}
%[text] The partial derivative of $f${"altText":"f"} with respect to $z${"altText":"z"} is:
%[text]{"align":"center"} $\\frac{\\partial f}{\\partial z}(x,y,z,w)= \\lim\_{⁡h\\to 0} \\frac{f(x,y,z+h,w)-f(x,y,z,w)}{h}${"altText":"\frac{\partial f}{\partial z}(x,y,z,w)= \lim\_{⁡h\to 0} \frac{f(x,y,z+h,w)-f(x,y,z,w)}{h}"}
%[text] **Key idea:** To compute a partial derivative with respect to any variable, treat all other variables as constants.
%[text] ## Computing Partial Derivatives
%[text] **Example 1:** Polynomial Function
%[text]{"align":"center"} $f(x,y)=x^2y+3y^2${"altText":"f(x,y)=x^2y+3y^2"}
%[text] - With respect to $x${"altText":"x"}: \
%[text]{"align":"center"} $\\frac{\\partial f}{\\partial x} = 2xy${"altText":"\frac{\partial f}{\partial x} = 2xy"}
%[text] - With respect to $y${"altText":"y"}: \
%[text]{"align":"center"} $\\frac{\\partial f}{\\partial y} = x^2+6y${"altText":"\frac{\partial f}{\partial y} = x^2+6y"}
%[text] **Using Symbolic Computation:**
syms x y %[text:anchor:M_4cdc]
f = x^2*y + 3*y^2; %[control:editfield:650a]{"position":[5,18]}
fx = diff(f,x)
fy = diff(f,y)
%[text] ![Finger touching surface](text:image:214b) **Try**. Edit the function [`f = x^2*y + 3*y^2;`](internal:M_4cdc) and run the section again. Can you define a function where $\\frac{\\partial f}{\\partial x} = 0${"altText":"\frac{\partial f}{\partial x} = 0"}? Or a function with $\\frac{\\partial f}{\\partial y} = 2xy+\\sin(x)${"altText":"\frac{\partial f}{\partial y} = 2xy+\sin(x)"}? Can you define a function with $\\frac{\\partial f}{\\partial x} = 3y${"altText":"\frac{\partial f}{\partial x} = 3y"} and $\\frac{\\partial f}{\\partial y} = xy^2${"altText":"\frac{\partial f}{\partial y} = xy^2"}? Why or why not?
%%
%[text] ![Exercise icon](text:image:6f78) **Exercise 1.** The "Generate a Problem" button can be used repeatedly to create additional randomized practice problems. Generate as many variations as you would like to strengthen your understanding and build your problem-solving fluency.
  %[control:button:65a7]{"position":[1,2]}
[myFun,myVar] = GenerateExercise1(3);
%%
%[text] Enter your solution in the [edit field](internal:M_18e5):
myDerivative = str2sym(""); %[control:editfield:373a]{"position":[24,26]} %[text:anchor:M_18e5]
  %[control:button:4521]{"position":[1,2]}
CheckEx1(myDerivative,myFun,myVar)
%%
%[text] %[text:anchor:M_295d] **Geometric Interpretation**
%[text] - $\\frac{\\partial f}{\\partial x}${"altText":"\frac{\partial f}{\partial x}"}: slope of the curve formed by slicing the surface $z=f(x,y)${"altText":"z=f(x,y)"} at constant $y${"altText":"y"}
%[text] - $\\frac{\\partial f}{\\partial y}${"altText":"\frac{\partial f}{\partial y}"}: slope of the curve formed by slicing the surface $z=f(x,y)${"altText":"z=f(x,y)"} at constant $x${"altText":"x"} \
%[text] Visualize the geometry for the surface $z = x^2y + 3y^2${"altText":"z = x^2y + 3y^2"} over the region $-5 \\leq x,y \\leq 5${"altText":"-5 \leq x,y \leq 5"}.
  %[control:button:8b88]{"position":[1,2]}

[MyXLine,MyYLine,lgd] = DrawSlicesOnPlot;
%[text] See code for [`DrawSlicesOnPlot`](internal:M_3a50).
%%
%[text] %[text:anchor:M_7d2a] Select the 'constant' values to slice along. Changing the slider values will cause the section to execute.
ConstX = 1;   % Select the constant value of x %[control:slider:8ef3]{"position":[10,11]}
ConstY = 1;   % Select the constant value of y %[control:slider:74af]{"position":[10,11]}

MoveLinesOnPlot(ConstX,ConstY,MyXLine,MyYLine,lgd)
%[text] See code for [`MoveLinesOnPlot`](internal:M_0d97)`.`
%[text] These ideas connect directly to tangent planes, developed later in multivariable calculus.
%%
%[text] ![Exercise icon](text:image:8704) **Exercise 2.** A company's profit depends on the selling price of the product, $p${"altText":"p"}, the budget spent on advertising, $b${"altText":"b"}, and the number of units sold, $N${"altText":"N"}, as a proxy for economies of scale in manufacturing. Let's express this as a function
%[text]{"align":"center"} $\\text{Profit} = W(p,b,N)${"altText":"\text{Profit} = W(p,b,N)"}.
%[text] If, at your current values of $p${"altText":"p"}, $b${"altText":"b"}, and $N${"altText":"N"}, $\\frac{\\partial W}{\\partial b} \> 0${"altText":"\frac{\partial W}{\partial b} \> 0"} , should you increase or decrease your advertising budget to increase profits?
%[text] A. Increase the budget
%[text] B. Decrease the budget
%[text] C. It depends on the values of $p${"altText":"p"}, $b${"altText":"b"}, and $N${"altText":"N"}
%[text] D. This question isn't answerable without additional information
CheckEx2(1) %[control:dropdown:08a1]{"position":[10,11]}
%%
%[text] ## The Gradient Vector
%[text] The **gradient** collects all partial derivatives:
%[text]{"align":"center"} $\\nabla f = \\left\[ \\matrix{\\frac{\\partial f}{\\partial x} & \\frac{\\partial f}{\\partial y}}\\right\]${"altText":"\nabla f = \left\[ \matrix{\frac{\partial f}{\partial x} & \frac{\partial f}{\partial y}}\right\]"}.
%[text] The result is a vector that points in the direction of maximum increase, and the magnitude of the gradient measures how steeply the slope is changing.
%[text] ### Remember 2D Contour Plots
%[text] For example, consider a function $f(x, y) = x^2 + y^2${"altText":"f(x, y) = x^2 + y^2"}, which describes a paraboloid surface. A contour plot of a function is calculated by determining contours: lines of constant value, $f(x,y)=c${"altText":"f(x,y)=c"}, for different values of $c${"altText":"c"}. (For coverage of contour plots, see [Multivariable: Space & Functions](https://www.mathworks.com/matlabcentral/fileexchange/180356-multivariable-space-and-functions).) In the case of $f(x,y) = x^2+y^2${"altText":"f(x,y) = x^2+y^2"}, this becomes $x^2+y^2=c${"altText":"x^2+y^2=c"}, so the contour plot consists of concentric circles of radius $\\sqrt{c}${"altText":"\sqrt{c}"} centered at the origin. The gradient of $f${"altText":"f"} is
%[text]{"align":"center"} $\\nabla f = \\left\[\\matrix{2x & 2y}\\right\]${"altText":"\nabla f = \left\[\matrix{2x & 2y}\right\]"}.
%[text] Plotting this, we have:
  %[control:button:922c]{"position":[1,2]}
if ~exist("vec","var") || ~isnumeric(x)
    n = 6;
    vec = -n:0.2:n;
    [x,y] = meshgrid(vec,vec);
end
figure
tiledlayout(1,2)

nexttile
contour(x,y,x.^2+y.^2,1:6:67)
axis equal
title("A Contour Plot")
xlabel("x")
ylabel("y")

idx = 1:5:60;
nexttile
quiver(x(idx,idx),y(idx,idx),2*x(idx,idx),2*y(idx,idx))
axis equal
xlim([-6 6])
ylim([-6 6])
title("A Gradient Plot")
xlabel("x")
ylabel("y")
%[text] **Note:** This interaction and the next can be easier to view using **Hide Code** with the icon ![live script code hidden icon](text:image:2a58) on the top right.
%%
%[text] ![Lightbulb](text:image:1942) **Reflect**. What do you notice about the contour plot relative to the gradient plot?
  %[control:button:16b0]{"position":[1,2]}
figure
n = 6;
vec = -n:0.2:n;
[x,y] = meshgrid(vec,vec);
z = x.^2+y.^2;
surf(x,y,z,FaceAlpha=0.5,LineStyle=":"); %[control:dropdown:1f31]{"position":[36,39]}
[xSm,ySm] = meshgrid(-n:n);
[Fx,Fy] = gradient(xSm.^2+ySm.^2);
hold on
quiver(xSm,ySm,Fx,Fy)
hold off
title("A Surface Plot with a Gradient Plot")
xlim([-8 8])
ylim([-8 8])

xlabel("x")
ylabel("y")
zlabel("z")
%[text] ![Try icon](text:image:8167) **Try**. Click the figure to focus. Then, use the ![Rotate 3D icon](text:image:0290) to rotate this figure. The surface is plotted as translucent (`FaceAlpha=0.5`). Using the dropdown, you can choose a mesh style or turn it off.
%%
%[text] ![Try icon](text:image:7c1b) **Try**. The function $f(x,y) = x^2+y^2${"altText":"f(x,y) = x^2+y^2"} was shown above. Design a new surface for yourself and observe the different gradient plots.
figure
syms x y
f = x.^2+y.^2;        % Define a function f(x,y) %[control:editfield:803e]{"position":[5,14]}
n = 6;    % Choose the bounds for plotting over a square [-n n] by [-n n] %[control:slider:74fe]{"position":[5,6]}
vec = -n:0.5:n; % Choose the fineness of the mesh, smaller step size -> more points    %[control:editfield:2209]{"position":[10,13]}
ShowContours = false;              % Select to add a contour plot %[control:checkbox:8e46]{"position":[16,21]}

% Convert from a symbolic math function to a numerical math function
fFun = matlabFunction(f);
[x,y] = meshgrid(vec,vec);
z = fFun(x,y);

% Compute and plot the gradient of z = f(x,y)
[fx,fy] = gradient(z,vec(2)-vec(1));  % Adjust the gradient for the chosen step size
% Note the autoscaling to keep the vector field visible
% To see the original values, set AutoScale="off"
quiver(x,y,fx,fy,AutoScale="on");
axis equal
xlim([-1.1*n 1.1*n])
ylim([-1.1*n 1.1*n])

if ShowContours
hold on
contour(x,y,z)
subtitle("with contours")
hold off
end

title("A gradient plot of $f(x,y) =" + latex(f) + "$", Interpreter="latex")
xlabel("x")
ylabel("y")
%%
%[text] ![Exercise icon](text:image:4a97) **Exercise 3.** The "Generate a Problem" button can be used repeatedly to create additional randomized practice problems. Generate as many variations as you would like to strengthen your understanding and build your problem-solving fluency.
  %[control:button:540c]{"position":[1,2]}
[myFun,myVars] = GenerateExercise3(randi([2 3],1));
%%
%[text] Enter your solution in the [edit field](internal:M_025d):
myGradient = str2sym(""); %[control:editfield:793c]{"position":[22,24]} %[text:anchor:M_025d]
  %[control:button:2cac]{"position":[1,2]}
CheckEx3(myGradient,myFun,myVars)
%%
%[text] %[text:anchor:M_29cd] ## Directional Derivatives
%[text] A **directional derivative** measures the rate of change of $f${"altText":"f"} in a given direction $\\vec{u}${"altText":"\vec{u}"}.
%[text]{"align":"center"} $D\_{\\vec{u}}f = \\nabla f \\cdot \\frac{\\vec{u}}{||\\vec{u}||}${"altText":"D\_{\vec{u}}f = \nabla f \cdot \frac{\vec{u}}{||\vec{u}||}"}
%[text] 
%[text] **Example:** Consider the values of $D\_{\\vec{u}}f${"altText":"D\_{\vec{u}}f"} that can be computed at a single point.
  %[control:button:968d]{"position":[1,2]}
x0 = 1; y0 = 2; %[control:slider:39d3]{"position":[6,7]} %[control:slider:140b]{"position":[14,15]}
[MyXLine,MyYLine,lgd] = DrawSlicesOnPlot;
MoveLinesOnPlot(x0,y0,MyXLine,MyYLine,lgd)
u = [1 1]; FamilyOfUs = false; %[control:editfield:7521]{"position":[5,10]} %[control:checkbox:859d]{"position":[25,30]}
AddDirectionalDerivative(gca,x0,y0,u,lgd,ManyUs=FamilyOfUs)
%[text] See code for [`AddDirectionalDerivative`](internal:M_48d7).
%[text] ![Try icon](text:image:26cd) **Try**. Change the point $(x\_0,y\_0)${"altText":"(x\_0,y\_0)"} and the vector $\\vec{u}${"altText":"\vec{u}"}. What do you observe?
%%
%[text] **Example:** Consider the values of $D\_\\vec{u} f${"altText":"D\_\vec{u} f"} that are computed for the same vector $\\vec{u}${"altText":"\vec{u}"} at different points $(x,y)${"altText":"(x,y)"}.
clearvars f
syms x y z
assume([x y z],"real")
%[text] Choose values for the function and the vector and run the example to compute the directional derivative and visualize the result.
  %[control:button:35c9]{"position":[1,2]} %[text:anchor:M_789f]
f_Function =x^2*y+3*y^2;  %1/(x^3*y^2-y^3*x^2) x^2*y+3*y^2 %[control:editfield:5331]{"position":[13,24]}
u = [x -y]; %[control:editfield:6c53]{"position":[5,11]}

gradf = gradient(f_Function);
uNorm = u/norm(u);

Du = simplify(dot(gradf,uNorm));
displayFormula("D_u*f == Du")
%[text] %[text:anchor:M_7942] **Visualization**
VisualizeDirectionalDerivative(gradf,uNorm,u,f_Function,MaxMin=1.8,Refinement=6)
%[text] See code for [`VisualizeDirectionalDerivative`](internal:M_025e).
%[text] ![Try icon](text:image:05a0) **Try**. Change the [function](internal:M_789f) `f_Function` and the vector `u`. Also, rotate the plot to view the results from different directions. What do you notice?
%[text] What if `f_Function = 1/(50*x^3*y^2-100*y^3*x^2)`? You may want to set `MaxMin=2` for clearer viewing. By looking at the gradient, can you explain why the graph goes crazy?
%%
%[text] ![Exercise icon](text:image:7869) **Exercise 4.** The "Generate a Problem" button can be used repeatedly to create additional randomized practice problems. Generate as many variations as you would like to strengthen your understanding and build your problem-solving fluency.
  %[control:button:3a91]{"position":[1,2]}
[myFun,myVec,myVars] = GenerateExercise4(randi([2 3],1));
%%
%[text] Enter your solution in the [edit field](internal:M_3393).
myDu = str2sym("0"); %[control:editfield:5582]{"position":[16,19]} %[text:anchor:M_3393]
  %[control:button:5d1e]{"position":[1,2]}
CheckEx4(myDu,myFun,myVec,myVars)
%%
%[text] ## Chain Rule for Partial Derivatives
%[text] Let $z=f(x,y)${"altText":"z=f(x,y)"} have continuous partial derivatives with respect to both $x${"altText":"x"} and $y${"altText":"y"}, and say that $x=x(t)${"altText":"x=x(t)"} and $y=y(t)${"altText":"y=y(t)"} are differentiable functions of $t${"altText":"t"}. Then
%[text]{"align":"center"} $\\frac{dz}{dt} = \\frac{\\partial f}{\\partial x}\\frac{dx}{dt} + \\frac{\\partial f}{\\partial y}\\frac{dy}{dt}${"altText":"\frac{dz}{dt} = \frac{\partial f}{\partial x}\frac{dx}{dt} + \frac{\partial f}{\partial y}\frac{dy}{dt}"}
%[text] **Example**
%[text] Compute the derivative $\\frac{dz}{dt}${"altText":"\frac{dz}{dt}"} if $z = x^2+y^2${"altText":"z = x^2+y^2"} and $x = t^2${"altText":"x = t^2"} and $y= \\sin(t)${"altText":"y= \sin(t)"}.
  %[control:button:8e33]{"position":[1,2]}
syms x y
f_func = x^2 + y^2; %[control:editfield:095b]{"position":[10,19]}
%[text] Substituting first:
syms t
xt = t^2;             % Define x as a parameterized function of t %[control:editfield:01bc]{"position":[6,9]}
yt = sin(t);             % Define y as a parameterized function of t %[control:editfield:9f9e]{"position":[6,12]}
z = subs(f_func,[x y],[xt yt]);        % Substitute the parameterizations into the formula f_func
displayFormula("f==z")                 % Display the results f(x,y) = z(t)
dzdt = diff(z,t);                      % Compute the derivative dz/dt
displayFormula("diff(f,t)==dzdt")      % Display the results df/dt = dz/dt
%[text] Then, try using the chain rule:
dxdt = diff(xt,t);                     % Compute dx/dt
dydt = diff(yt,t);                     % Compute dy/dt

assume([x y],"real")                   % Tell the symbolic engine that we are working with real values x and y
gradf = gradient(f_func);              % Compute ∇f = [∂f/∂x ∂f/∂y]
AltExpr = dot(gradf,[dxdt; dydt]);     % Compute the chain rule: df/dt = ∇f⋅[dx/dt dy/dt]
displayFormula("dot(gradf,[dxdt; dydt]) == AltExpr")
%[text] Plugging in the definitions of $x(t)${"altText":"x(t)"} and $y(t)${"altText":"y(t)"},
AfterSub = subs(AltExpr,[x y],[xt yt]);  % Substitute the parameterizations of x and y in terms of t
displayFormula("diff(f,t) == AfterSub")  % Display the results of the calculation using the chain rule
%[text] In fact, the chain rule can be extended for any combination of functions with continuous derivatives, so if $f = g(x,y,z)${"altText":"f = g(x,y,z)"} has continuous partial derivatives $\\frac{\\partial g}{\\partial x}${"altText":"\frac{\partial g}{\partial x}"}, $\\frac{\\partial g}{\\partial y}${"altText":"\frac{\partial g}{\partial y}"}, and $\\frac{\\partial g}{\\partial z}${"altText":"\frac{\partial g}{\partial z}"} and $x(s,t)${"altText":"x(s,t)"}, $y(s,t)${"altText":"y(s,t)"}, and $z(s,t)${"altText":"z(s,t)"} are continuously differentiable functions of $s${"altText":"s"} and $t${"altText":"t"}, then:
%[text]{"align":"center"} $\\frac{\\partial f}{\\partial s} = \\frac{\\partial g}{\\partial x}\\frac{\\partial x}{\\partial s} + \\frac{\\partial g}{\\partial y}\\frac{\\partial y}{\\partial s} + \\frac{\\partial g}{\\partial z}\\frac{\\partial z}{\\partial s}${"altText":"\frac{\partial f}{\partial s} = \frac{\partial g}{\partial x}\frac{\partial x}{\partial s} + \frac{\partial g}{\partial y}\frac{\partial y}{\partial s} + \frac{\partial g}{\partial z}\frac{\partial z}{\partial s}"},
%[text] and
%[text]{"align":"center"} $\\frac{\\partial f}{\\partial t} = \\frac{\\partial g}{\\partial x}\\frac{\\partial x}{\\partial t} + \\frac{\\partial g}{\\partial y}\\frac{\\partial y}{\\partial t} + \\frac{\\partial g}{\\partial z}\\frac{\\partial z}{\\partial t}${"altText":"\frac{\partial f}{\partial t} = \frac{\partial g}{\partial x}\frac{\partial x}{\partial t} + \frac{\partial g}{\partial y}\frac{\partial y}{\partial t} + \frac{\partial g}{\partial z}\frac{\partial z}{\partial t}"}.
%%
%[text] ![Exercise icon](text:image:5b26) **Exercise 5.** The "Generate a Problem" button can be used repeatedly to create additional randomized practice problems. Generate as many variations as you would like to strengthen your understanding and build your problem-solving fluency.
  %[control:button:8803]{"position":[1,2]}
[myFun,myVars,myVarFuns] = GenerateExercise5(randi([1 2],[1 2]));
%%
%[text] Enter your solution in the [edit field](internal:M_4912).
syms s t x y %[text:anchor:M_27a8]
dfds = str2sym("0"); %[control:editfield:9313]{"position":[16,19]} %[text:anchor:M_4912]
dfdt = str2sym("0"); %[control:editfield:23ab]{"position":[16,19]}
  %[control:button:100d]{"position":[1,2]}

CheckEx5(dfds,dfdt,myFun,myVars,myVarFuns)
%%
%[text] %[text:anchor:M_104d] ## ![World icon](text:image:959e)Application to Gradient Descent
%[text] A common optimization algorithm is gradient descent, in which we minimize a loss function $L${"altText":"L"} by following the path suggested by the gradient toward a minimum. In the 1D case, this is a simple calculus problem that we can plot and observe. Consider the loss function
%[text]{"align":"center"} $L(w)=(w-3)^2${"altText":"L(w)=(w-3)^2"}.
%[text] We know that this function is minimized at the base of the parabola, when $w=3${"altText":"w=3"}. Let's watch how this is calculated using gradient descent, starting from an initial guess $w\_0${"altText":"w\_0"}. The gradient descent update is calculated by moving our proposed solution in the direction of a scalar multiple of the gradient of the loss function.
%[text]{"align":"center"} $w\_{k+1} = w\_k - \\alpha \\nabla L(w\_k)${"altText":"w\_{k+1} = w\_k - \alpha \nabla L(w\_k)"}
%[text] The positive scalar value $\\alpha${"altText":"\alpha"} is called the learning rate. Because the gradient points in the direction of steepest *increase*, for gradient descent, we will move in the negative gradient direction for the steepest *decrease*.
syms w
L = (w-3)^2;
alpha = 0.1; %[control:spinner:5ead]{"position":[9,12]}
w0 = 0; %[control:editfield:71c9]{"position":[6,7]}
n = 30; %[control:spinner:76aa]{"position":[5,7]}
  %[control:button:545d]{"position":[1,2]}
Visualize1DGradientDescent(L,alpha,w0,n)
%[text] See code for [`Visualize1DGradientDescent`](internal:M_815d).
%%
%[text] %[text:anchor:M_676d] ### 2D Example
%[text] While the method becomes harder to visualize, the same approach works in higher dimensions! Imagine you are designing a smart Heating, Ventilation, and Air Conditioning (HVAC) control system. Your goal is to minimize the total energy consumption while maintaining occupant comfort. Let's define parameters where $w\_1${"altText":"w\_1"} is the airflow rate of the system and $w\_2${"altText":"w\_2"} measures the cooling power. Then we could define a loss function $L(w\_1,w\_2) = (w\_1-3)^2+(w\_2-2)^2+0.5w\_1w\_2${"altText":"L(w\_1,w\_2) = (w\_1-3)^2+(w\_2-2)^2+0.5w\_1w\_2"} with quadratic penalties to model efficiency losses and the coupling between variables to track interactions. This is still simple enough to identify the solution visually or analytically:
syms w1 w2
L = (w1-3)^2 + (w2-2)^2 + 0.5*w1*w2; %[control:editfield:0458]{"position":[5,36]}
gradL = gradient(L,[w1 w2]);
alpha = 0.08; %[control:spinner:602e]{"position":[9,13]}
w0 = [-3,-3]; %[control:editfield:1db0]{"position":[7,9]} %[control:editfield:79f5]{"position":[10,12]}
n = 30; %[control:spinner:0ef4]{"position":[5,7]}
  %[control:button:3007]{"position":[1,2]}
PlotGradientDescent(L,gradL,alpha,w0,n)
%[text] See code for [PlotGradientDescent](internal:M_2a88).
%[text] ![Try icon](text:image:3f7a) **Try**.
%[text] 1. Change the value of $\\alpha${"altText":"\alpha"} and observe how the convergence changes. What happens at $\\alpha = 0.01${"altText":"\alpha = 0.01"}? What about at $\\alpha = 0.75${"altText":"\alpha = 0.75"}?
%[text] 2. Change the initial guess and observe how the convergence changes.
%[text] 3. Change the value of $n${"altText":"n"} and observe how the convergence changes.
%[text] 4. Change the loss function, say to $L = (w\_1-3)^2 + (w\_2-2)^2 + 0.5w\_1w\_2^2${"altText":"L = (w\_1-3)^2 + (w\_2-2)^2 + 0.5w\_1w\_2^2"}, and observe how both the surface and the convergence change. \
%[text] ![Reflect icon](text:image:1fb9) **Reflect**. How can gradient descent fail?
%%
%[text] %[text:anchor:M_2b44] ### ![World icon](text:image:6120)**Edge Detection (Computer Vision)**
%[text] A grayscale image is a matrix of intensity values. We can interpret this as a function $f${"altText":"f"} that maps the pixel location $(x,y)${"altText":"(x,y)"} to an intensity value $z${"altText":"z"}. In this case, the gradient vector of such a 2D image represents the direction and rate of the most rapid change in intensity at each pixel. It is composed of two components:
%[text] 1. The partial derivative in the x-direction, $\\displaystyle \\left(\\frac{\\partial f}{\\partial x}\\right)\n\n\n\n\n\n${"altText":"Partial derivative of f with respect to x."}, which measures the change in intensity along the horizontal axis.
%[text] 2. The partial derivative in the y-direction, $\\displaystyle \\left(\\frac{\\partial f}{\\partial y}\\right)\n\n\n\n\n\n${"altText":"Partial derivative of f with respect to y."}, which measures the change in intensity along the vertical axis. \
  %[control:button:5469]{"position":[1,2]}
I = peaks(200);
[Ix,Iy] = gradient(I);     % Calculate the numerical gradients
PlotIAsImage(I,Ix,Iy)
clf                        % Reset the tiledlayout from PlotAsImage
%[text] See code for [`PlotIAsImage`](internal:M_1da3).
%[text] If a function is reinterpreted as an image, and remembering that high values appear light while low values appear dark, this looks very similar.
imshowpair(sqrt(Ix.^2 + Iy.^2),I,"montage")
ax = gca;
ax.PositionConstraint = "outerposition";
title("magnitude of the gradient                    original image        ")
%%
%[text] The magnitude of the gradient is large where the pixel values are changing rapidly and small when the pixel values are consistent in an area. In the image below, you will see the gradient vector plotted. Notice the impact of gradient changes in the x and y-direction on the images. For more details, see the [Computer Vision Basics](https://www.mathworks.com/matlabcentral/fileexchange/180661-computer-vision-basics) courseware.
%[text:table]
%[text] | **If the gradient is...** | <p align="center">**The intensity changes in** </p> | <p align="center">**Visualization**</p> |
%[text] | --- | --- | --- |
%[text] | <p align="center"></p><p align="center">$\\nabla f =\\left\[ \\frac{\\partial f}{\\partial x} , \\frac{\\partial f}{\\partial y} \\right\]\n\n\n\n\n${"altText":"The gradient of f is equal to the vector of partial derivatives with respect to x and y."}</p> | <p align="center"></p><p align="center"></p><p align="center">any direction</p> | <p align="center">![Image of a gradient moving towards the top right. There is an arrow indicating the direction of the gradient.](text:image:51e9)</p> |
%[text] | <p align="center"></p><p align="center">$\\nabla f = \\left\[ \\frac{\\partial f}{\\partial x} , 0 \\right\]\n${"altText":"Gradient of f with partial derivative with respect to x and zero for y."}</p> | <p align="center"></p><p align="center"></p><p align="center">only in x</p> | <p align="center">![Image of a gradient moving from left to right. There is an arrow indicating the direction of the gradient.](text:image:8862)</p> |
%[text] | <p align="center"></p><p align="center">$\\nabla f = \\left\[ 0 , \\frac{\\partial f}{\\partial y} \\right\]\n${"altText":"Gradient of f with zero for x and partial derivative with respect to y."}</p> | <p align="center"></p><p align="center"></p><p align="center">only in y</p> | ![Image of a gradient moving from top to bottom. There is an arrow indicating the direction of the gradient.](text:image:9fdb) |
%[text:table]
%%
%[text] %[text:anchor:M_90c0] The edge strength is given by the magnitude of the gradient vector. A larger gradient magnitude signifies a steeper change at the edge, while a smaller magnitude suggests a more gradual change.
%[text]{"align":"center"} %[text:anchor:M_6d62] $\\text{edge strength}  = |\\nabla f| = \\sqrt{\\left( \\frac{\\partial f}{\\partial x} \\right)^2 + \\left( \\frac{\\partial f}{\\partial y} \\right)^2}\n${"altText":"Edge strength is equal to the magnitude of the gradient of f, calculated as the square root of the sum of the squares of the partial derivatives with respect to x and y."}
%[text] %[text:anchor:M_0639] The edge direction is defined as being perpendicular to the gradient vector. Since the gradient points in the direction of the steepest intensity change, this means the edge follows the least intensity change.
%[text]{"align":"center"} $\\text{edge direction}=\\theta = \\texttt{atan2} \\left(\\frac{\\partial f}{\\partial y},\\frac{\\partial f}{\\partial x} \\right)\n${"altText":"Edge direction is equal to the angle \theta, calculated as atan2(f\_y, f\_x)"}
%%
%[text] %[text:anchor:M_4f76] ![Try icon](text:image:35d9) **Try**. Compare the [edge strength](internal:M_6d62) for two types of edges: a step edge and a ramp edge. For details on various edge types, see the [Computer Vision Basics](https://www.mathworks.com/matlabcentral/fileexchange/180661-computer-vision-basics) courseware.
%[text] 1. Click **Start interaction**
%[text] 2. Use your mouse to draw a horizontal line across the white to black regions of the first image.
%[text] 3. Use your mouse to draw a horizontal line across the white to black regions of the second image.
%[text] 4. Then compare the edge strengths computed for each of your lines.
%[text] 5. Repeat with longer or shorter lines, if desired. \
  %[control:button:8864]{"position":[1,2]}
[RampPosition,RampImage,~] = GetPosition("Ramp.jpg"); %#ok<*ASGLU>
[StepPosition,StepImage,~] = GetPosition("Step.jpg"); %#ok<*ASGLU>
imshowpair(RampImage,StepImage,"montage")
hold on
[RampMag,~] = DrawGrad(RampImage,RampPosition,[0 0],"Static",330);
[StepMag,~] = DrawGrad(StepImage,StepPosition,[330 0],"Static",330);
title("The ramp edge strength is "+round(RampMag) + ",  and the step edge strength is " + round(StepMag))
hold off
%[text] See code for [`GetPosition`](file:../FunctionLibrary//GetPosition.m) or [`DrawGrad`](internal:M_2b3e).
%%
%[text] ![Reflect icon](text:image:4c13) **Reflect**. The gradient vector points in the direction of the fastest increase in intensity. How does the gradient relate to the direction of the edge?
%%
%[text] %[text:anchor:M_5767] ![World icon](text:image:850c) **Medical Imaging Application.** In medical imaging, some diseases are suspected when clear edges are not visible. In such cases, a weak edge might indicate disease, while a strong edge suggests health. Remember, the stronger the edge, the higher the likelihood of clear edge detection. Compare the edge strength in the two lung images below. One image shows healthy lungs, while the other image shows diseased lungs.
%[text] ![Instructor icon](text:image:61a1) **Demonstration**. Calculate the edge strengths for each of the lung images.
  %[control:button:727d]{"position":[1,2]}
I = imread("LungA.jpg"); disp(("Image Source: Mikael Häggström, M.D."+newline+"CC0, via Wikimedia Commons"+newline+sprintf('<a href="https:/commons.wikimedia.org/wiki/File:Normal_posteroanterior_(PA)_chest_radiograph_(X-ray).jpg">X-Ray of Chest</a>')))  % Include citation in the drop-down code %[control:dropdown:39a7]{"position":[5,254]}
AdjustRanges = false; %[control:checkbox:96d6]{"position":[16,21]}
[ny,nx,~] = size(I);
Islice = I(max(ny-669,1):ny,:);
if AdjustRanges
    Islice = Islice*(255/double(max(Islice,[],"all")));
end
[Ix,Iy] = gradient(double(Islice));
EdgeStrength = sqrt(Ix.^2+Iy.^2);

PlotXrayImages(I,Islice,EdgeStrength,nx,ny)
%[text] See code for [`PlotXrayImages`](internal:M_4d74).
%%
%[text] ## **Higher‑Order Partial Derivatives**
%[text] When the function, $f(x,y)${"altText":"f(x,y)"}, is sufficiently smooth, partial derivatives can be differentiated again with respect to any relevant variable. From
%[text]{"align":"center"} $f\_x = \\frac{\\partial f}{\\partial x}${"altText":"f\_x = \frac{\partial f}{\partial x}"} and $f\_y = \\frac{\\partial f}{\\partial y}${"altText":"f\_y = \frac{\partial f}{\partial y}"}
%[text] we can compute the second-order derivatives
%[text]{"align":"center"} $f\_{xx} = \\frac{\\partial^2 f}{\\partial x^2}${"altText":"f\_{xx} = \frac{\partial^2 f}{\partial x^2}"}, $f\_{yy} = \\frac{\\partial^2 f}{\\partial y^2}${"altText":"f\_{yy} = \frac{\partial^2 f}{\partial y^2}"}, $f\_{xy} = \\frac{\\partial}{\\partial y}\\left(\\frac{\\partial f}{\\partial x}\\right)${"altText":"f\_{xy} = \frac{\partial}{\partial y}\left(\frac{\partial f}{\partial x}\right)"}, and $f\_{yx} = \\frac{\\partial}{\\partial x}\\left(\\frac{\\partial f}{\\partial y}\\right)${"altText":"f\_{yx} = \frac{\partial}{\partial x}\left(\frac{\partial f}{\partial y}\right)"},
%[text] or even more.
%[text] ### **Equality of Mixed Partial Derivatives**
%[text] **Clairaut's Theorem (Schwartz's Theorem):** Let $f(x,y)${"altText":"f(x,y)"} be a function whose second-order partial derivatives exist and are continuous in a neighborhood of a point $(a,b)${"altText":"(a,b)"}. Then the mixed partial derivatives are equal at that point:
%[text]{"align":"center"} $\\frac{\\partial^2 f}{\\partial x \\partial y}(a,b) = \\frac{\\partial^2 f}{\\partial y \\partial x}(a,b)${"altText":"\frac{\partial^2 f}{\partial x \partial y}(a,b) = \frac{\partial^2 f}{\partial y \partial x}(a,b)"}.
%[text] Informally, if the mixed partial derivatives are continuous over their domain, then the order in which you compute them doesn't matter, and you will get the same result with:
%[text]{"align":"center"} $f\_{xy} = f\_{yx}${"altText":"f\_{xy} = f\_{yx}"}.
%[text] Intuitively, when you compute a mixed partial derivative, you are asking:
%[text] - “How does the rate of change in $x${"altText":"x"} change as $y${"altText":"y"} changes?” \
%[text] vs.
%[text] - “How does the rate of change in $y${"altText":"y"} change as $x${"altText":"x"} changes?” \
%[text] Clairaut’s Theorem says that under reasonable smoothness conditions, these two viewpoints lead to the same result. Smoothness (continuity of second partials) rules out sharp corners or pathological behavior that could make the order matter.
%[text] **Example**
%[text]{"align":"center"} $f(x,y)=x^2y^3${"altText":"f(x,y)=x^2y^3"}
%[text]{"align":"center"} $f\_x=2xy^3${"altText":"f\_x=2xy^3"} $\\longrightarrow${"altText":"\longrightarrow"} $f\_{xy}=6xy^2${"altText":"f\_{xy}=6xy^2"},
%[text] while
%[text]{"align":"center"} $f\_y=3x^2y^2${"altText":"f\_y=3x^2y^2"} $\\longrightarrow${"altText":"\longrightarrow"} $f\_{yx}=6xy^2${"altText":"f\_{yx}=6xy^2"}.
%[text] In this case, it doesn't matter which order mixed partials are calculated in because the result is the same.
%[text] %[text:anchor:M_749f] **Counterexample**
%[text]{"align":"center"} $f(x,y) = \\cases{\\frac{xy(x^2-y^2)}{x^2+y^2}, & (x,y) \\neq (0,0) \\cr 0, & (x,y) = (0,0)}${"altText":"f(x,y) = \cases{\frac{xy(x^2-y^2)}{x^2+y^2}, & (x,y) \neq (0,0) \cr 0, & (x,y) = (0,0)}"}
%[text] In this case, by definition
%[text]{"align":"center"} $f\_x(0,0) = \\lim\_{h \\to 0} \\frac{f(h,0)-f(0,0)}{h} = \\lim\_{h\\to 0} \\frac{0}{h} = 0,${"altText":"f\_x(0,0) = \lim\_{h \to 0} \frac{f(h,0)-f(0,0)}{h} = \lim\_{h\to 0} \frac{0}{h} = 0,"} and
%[text]{"align":"center"} $f\_y(0,0) = \\lim\_{k \\to 0} \\frac{f(0,k)-f(0,0)}{k} = \\lim\_{k\\to 0} \\frac{0}{k} = 0${"altText":"f\_y(0,0) = \lim\_{k \to 0} \frac{f(0,k)-f(0,0)}{k} = \lim\_{k\to 0} \frac{0}{k} = 0"}.
%[text] Thus, both partial derivatives exist at $(0,0)${"altText":"(0,0)"}. However, for all points $(x,y)${"altText":"(x,y)"} that are NOT the origin,
  %[control:button:185e]{"position":[1,2]} %[text:anchor:M_325d]
% Perform this computation symbolically under the assumptions that (x,y) is
% not the origin and that both h and k are nonzero values that could be
% used to compute a limit
syms x y h k
assume([x y] ~= [0 0])
assumeAlso(h ~= 0 & k ~= 0)
f_function = x*y*(x^2-y^2)/(x^2+y^2);
fx = simplify(diff(f_function,x))
fxy = subs(fx,[x y],[0 k])/k
fy = simplify(diff(f_function,y))
fyx = subs(fy,[x y],[h 0])/h
[X,Y] = meshgrid(-5:0.1:5);
Z = (X.*Y.*(X.^2-Y.^2))./(X.^2+Y.^2);
Z(isnan(Z)) = 0;
figure
surf(X,Y,Z,EdgeColor="none")
%[text] %[text:anchor:M_436c] See complete step-by-step computation in the [appendix](internal:M_5216).
%[text] %[text:anchor:TMP_457c] ![Exercise icon](text:image:279a) **Exercise 6.** The "Generate a Problem" button can be used repeatedly to create additional randomized practice problems. Generate as many variations as you would like to strengthen your understanding and build your problem-solving fluency.
  %[control:button:5801]{"position":[1,2]}
[myFun,myDerVars] = GenerateExercise6(2,randi([2 3],1));
%%
%[text] Enter your solution in the [edit field](internal:M_4256).
mySoln = str2sym(""); %[control:editfield:1984]{"position":[18,20]} %[text:anchor:M_4256]
  %[control:button:78bc]{"position":[1,2]}
CheckEx6(myFun,myDerVars,mySoln)
%%
%[text] ## **Connections to Other Topics**
%[text] - [Multivariable: Space and Functions](https://www.mathworks.com/matlabcentral/fileexchange/180356-multivariable-space-and-functions) is available on [![File Exchange badge](text:image:0e6f)](https://www.mathworks.com/matlabcentral/fileexchange/180356-multivariable-space-and-functions) or [![Open in MATLAB Online Button](text:image:1111)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Space-and-Functions&project=Space.prj&file=README.mlx) or [GitHub](https://github.com/MathWorks-Teaching-Resources/Multivariable-Space-and-Functions)
%[text] - [Multivariable Calculus: Integrals](https://www.mathworks.com/matlabcentral/fileexchange/181588-multivariable-integrals) is available on [![File Exchange badge](text:image:7246)](https://www.mathworks.com/matlabcentral/fileexchange/181588-multivariable-integrals) or [![Open in MATLAB Online Button](text:image:9387)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Integrals&project=Integrals.prj&file=README.mlx) or [GitHub](https://github.com/MathWorks-Teaching-Resources/Multivariable-Integrals)
%[text] - [Applied Partial Differential Equations](https://www.mathworks.com/matlabcentral/fileexchange/172650-applied-partial-differential-equations) is available on [![File Exchange badge](text:image:58c7)](https://www.mathworks.com/matlabcentral/fileexchange/172650-applied-partial-differential-equations) or [![Open in MATLAB Online Button](text:image:275f)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Applied-PDEs&project=AppliedPDEs.prj&file=README.mlx) or [GitHub](https://github.com/MathWorks-Teaching-Resources/Applied-PDEs) \
%[text] ## Further Resources
%[text] - [Optimization Onramp](https://matlabacademy.mathworks.com/details/optimization-onramp/optim)
%[text] - [Symbolic Math Onramp](https://matlabacademy.mathworks.com/details/introduction-to-symbolic-math-with-matlab/symbolic) \
%[text] %[text:anchor:TMP_31ac] [⇦ Main Menu](file:../MainMenu.m)
%[text] ## Appendix
%[text] %[text:anchor:M_5216] ### Computation details for mixed-partials counterexample
%[text] [Return to script](internal:M_749f)
%[text]{"align":"center"} $f(x,y) = \\cases{\\frac{xy(x^2-y^2)}{x^2+y^2}, & (x,y) \\neq (0,0) \\cr 0, & (x,y) = (0,0)}${"altText":"f(x,y) = \cases{\frac{xy(x^2-y^2)}{x^2+y^2}, & (x,y) \neq (0,0) \cr 0, & (x,y) = (0,0)}"}
%[text] In this case, by definition
%[text]{"align":"center"} $f\_x(0,0) = \\lim\_{h \\to 0} \\frac{f(h,0)-f(0,0)}{h} = \\lim\_{h\\to 0} \\frac{0}{h} = 0,${"altText":"f\_x(0,0) = \lim\_{h \to 0} \frac{f(h,0)-f(0,0)}{h} = \lim\_{h\to 0} \frac{0}{h} = 0,"} and
%[text]{"align":"center"} $f\_y(0,0) = \\lim\_{k \\to 0} \\frac{f(0,k)-f(0,0)}{k} = \\lim\_{k\\to 0} \\frac{0}{k} = 0${"altText":"f\_y(0,0) = \lim\_{k \to 0} \frac{f(0,k)-f(0,0)}{k} = \lim\_{k\to 0} \frac{0}{k} = 0"}.
%[text] Thus, both partial derivatives exist at $(0,0)${"altText":"(0,0)"}. However, for all points $(x,y)${"altText":"(x,y)"} that are NOT the origin,
%[text]{"align":"center"} $f\_x(x,y) = \\frac{2\\,x^2\\,y}{x^2+y^2}+\\frac{y\\,\\left(x^2-y^2\\right)}{x^2+y^2}-\\frac{2\\,x^2\\,y\\,\\left(x^2-y^2\\right)}{{\\left(x^2+y^2\\right)}^2} = \\frac{y\\,\\left(x^4+4\\,x^2\\,y^2-y^4\\right)}{{\\left(x^2+y^2\\right)}^2}${"altText":"f\_x(x,y) = \frac{2x^2y}{x^2+y^2}+\frac{y\left(x^2-y^2\right)}{x^2+y^2}-\frac{2x^2y\left(x^2-y^2\right)}{{\left(x^2+y^2\right)}^2} = \frac{y\left(x^4+4x^2y^2-y^4\right)}{{\left(x^2+y^2\right)}^2}"},
%[text] So
%[text]{"align":"center"} $\\matrix{f\_{xy}(0,0) &=& \\lim\_{k \\to 0} \\frac{f\_x(0,k)-f\_x(0,0)}{k} \\cr &= &\\lim\_{k\\to 0} \\frac{-k^5/k^4-0}{k} \\cr &=& \\lim\_{k\\to 0} \\frac{-k^5}{k^5} \\cr &=& -1}${"altText":"f\_{xy}(0,0) = \lim\_{k \to 0} \frac{f\_x(0,k)-f\_x(0,0)}{k} = \lim\_{k\to 0} \frac{-k^5\/k^4-0}{k} = \lim\_{k\to 0} \frac{-k^5}{k^5} = -1"}.
%[text] On the other hand,
%[text]{"align":"center"} $f\_y(x,y) = \\frac{x\\,\\left(x^2-y^2\\right)}{x^2+y^2}-\\frac{2\\,x\\,y^2}{x^2+y^2}-\\frac{2\\,x\\,y^2\\,\\left(x^2-y^2\\right)}{{\\left(x^2+y^2\\right)}^2} = -\\frac{x\\,\\left(-x^4+4\\,x^2\\,y^2+y^4\\right)}{{\\left(x^2+y^2\\right)}^2}${"altText":"f\_y(x,y) = \frac{x\left(x^2-y^2\right)}{x^2+y^2}-\frac{2xy^2}{x^2+y^2}-\frac{2xy^2\left(x^2-y^2\right)}{{\left(x^2+y^2\right)}^2} = -\frac{x\left(-x^4+4x^2y^2+y^4\right)}{{\left(x^2+y^2\right)}^2}"},
%[text] so
%[text]{"align":"center"} $\\matrix{f\_{yx} &=& \\lim\_{h\\to 0} \\frac{f\_y(h,0)-f\_y(0,0)}{h} \\cr & = &  \\lim\_{h\\to 0} \\frac{h^5/h^4-0}{h}\\cr & = & \\lim\_{h\\to 0} \\frac{h^5}{h^5} \\cr &=& 1}${"altText":"f\_{yx} = \lim\_{h\to 0} \frac{f\_y(h,0)-f\_y(0,0)}{h} = \lim\_{h\to 0} \frac{h^5\/h^4-0}{h} = \lim\_{h\to 0} \frac{h^5}{h^5} = 1"}.
%[text] [Return to script](internal:M_749f)
%[text] [⇦ Main Menu](file:../MainMenu.m)
%[text] %[text:anchor:H_0AAABA39] ## Local Helper Functions
%[text] If you want to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternatively, select **Output Inline** using the icon ![live script output inline icon](text:image:42d0) at the top right of the Live Editor pane.
%[text] `GenerateExercise1` uses [`GenFun.m`](file:../FunctionLibrary/GenFun.m) to randomly generate practice problems involving combinations of polynomials, sines, cosines, exponentials, and logarithms for computing partial derivatives. The variables that may appear are $x${"altText":"x"}, $y${"altText":"y"}, $z${"altText":"z"}, $w${"altText":"w"}, and $t${"altText":"t"}.
function [myFun,myVar] = GenerateExercise1(numVar)
syms x y z w t f
[myFun,myVar,~] = GenFun([x y z w t],numVar,[-4 4]);

displayFormula(['"Compute the derivative of "' "f == myFun" '" with respect to "' "myVar" '"."'])
end
%[text] Function to check the solution to Exercise 1.
function CheckEx1(myDer,myFun,myVar)
syms x y z w t
displayFormula(['"My solution is "' "diff(f,myVar)==myDer"])
correctAns = diff(myFun,myVar);
if isAlways(correctAns==myDer,"Unknown","false")
    displayFormula('"This is correct."')
else
    displayFormula('"This is incorrect. Please try again."')
end
end
%[text] Function to check the solution to Exercise 2.
function CheckEx2(idx)
arguments
    idx (1,1) {mustBeInteger,mustBePositive}
end
opts = ["""A, B, C or D?""" """Increase the budget""" """Decrease the budget""" """It depends on the values of p, b, and N""" """This question isn't answerable without additional information"""];

feedback1 = ["the default value." ... 
    "correct!" ...
    "incorrect." ...
    "incorrect." ...
    "incorrect." ...
    ];

feedback2 = ["Please select one of the options: A, B, C or D." ...
    "Increasing the budget (incrementally) while fixing all the other variables" + newline + "will result in increasing profits when the partial derivative is positive.." ...
    "Decreasing the advertising budget (incrementally) while fixing all the other variables" + newline + "will result in decreasing profits when the partial derivative is positive." ...
    "While the partial derivative may well depend on the values of the variables," + newline + "once we have fixed those values, the interpretation of the partial derivative is also fixed." ...
    "Partial derivatives exactly track what change will happen in a function with respect" + newline + "to changing exactly one variable."];
disp("You selected " + opts(idx) + " which is " + feedback1(idx) +newline + newline + ...
    feedback2(idx))
if idx > 2
    disp(newline + "Please try again.")
end
end
%[text] `GenerateExercise3` uses [`GenFun.m`](file:../FunctionLibrary/GenFun.m) to randomly generate practice problems involving combinations of polynomials, sines, cosines, exponentials, and logarithms for computing gradients. The variables that may appear are $x${"altText":"x"}, $y${"altText":"y"}, $z${"altText":"z"}, and $w${"altText":"w"}.
function [myFun,varList] = GenerateExercise3(numVar)
syms x y z w
[myFun,~,varList] = GenFun([x y z w],numVar,[-4 4]);
if numel(varList) == 2
    syms f(t1,t2)
    f = subs(f,[t1 t2],varList);
else
    syms f(t1,t2,t3)
    f = subs(f,[t1 t2 t3],varList);
end
displayFormula(['"Compute the gradient of "' "f == myFun" '"."'])
end
%[text] Function to check the solution to Exercise 3.
function CheckEx3(myDer,myFun,varList)
syms x y z w
myDim = numel(varList);
if myDim == 2
    syms f(t1,t2)
    f = subs(f,[t1 t2],varList);
else
    syms f(t1,t2,t3)
    f = subs(f,[t1 t2 t3],varList);
end
displayFormula(['"My solution is "' "gradient(f)==myDer"])

if numel(myDer) ~= myDim
    displayFormula(['"This answer is incorrect. The solution must be a vector of length "' "myDim" '"."'])
    return
end

correctAns = gradient(myFun,varList);
piece1 = myDer(1);
piece2 = myDer(2);
if myDim == 3
    piece3 = myDer(3);
else
    correctAns = [correctAns; 0];
    piece3 = 0;
end
if all(isAlways(correctAns==[piece1; piece2; piece3],"Unknown","false"))
    displayFormula('"This is correct."')
else
    displayFormula('"This is incorrect. Please try again."')
    PartialCheck = isAlways(correctAns == [piece1 piece2 piece3],"Unknown","false");
    if any(PartialCheck(1:8))
        gradF = gradient(f,varList);
        displayFormula(['"Remember that the gradient of "' "f" '" is "' "gradF" '"."'])
    end
end
end
%[text] `GenerateExercise4` uses [`GenFun.m`](file:../FunctionLibrary/GenFun.m) to randomly generate practice problems involving combinations of polynomials, sines, cosines, exponentials, and logarithms for computing directional derivatives in directions $\\vec{u}${"altText":"\vec{u}"}`=MyVec`. The variables that may appear are $x${"altText":"x"}, $y${"altText":"y"}, and $z${"altText":"z"}. The dimensionality is defined by `numVar`. As used in this script, that is `numVar=2` or `numVar=3`.
function [myFun,myVec,varList] = GenerateExercise4(numVar)
syms x y z u
[myFun,~,varList] = GenFun([x y z],numVar,[-3 3]);
myDim = numel(varList);
if myDim == 2
    syms f(t1,t2)
    f = subs(f,[t1 t2],varList);
else
    syms f(t1,t2,t3)
    f = subs(f,[t1 t2 t3],varList);
end
myVec = randi([-10 10],[myDim 1]);
displayFormula(['"Compute the directional derivative of "' "f == myFun" '" in the direction "' "u==myVec" '"."'])
end
%[text] Function to check the solution to Exercise 4.
function CheckEx4(myDu,myFun,myVec,myVars)
arguments
    myDu (:,1)
    myFun (1,1)
    myVec (:,1)
    myVars (:,1)
end
syms x y z f D_u 
assume([x y z],"real")
gradf = gradient(myFun,myVars);
uNorm = myVec/norm(myVec);
DuSoln = simplify(dot(gradf,uNorm));

if all(isAlways(myDu==DuSoln,"Unknown","false"))
    displayFormula(['"Yes, the solution is "' "D_u*f == DuSoln" '"."'])
else
    displayFormula(['"No, the solution "' "D_u*f == myDu" '" is incorrect. Please try again."'])
    if numel(myDu) ~= 1
        displayFormula('"Remember that the directional derivative is a scalar function, not a vector."')
    end
end
end
%[text] `GenerateExercise5` uses [`GenFun.m`](file:../FunctionLibrary/GenFun.m) to randomly generate practice problems involving sums, differences, and products of polynomials, sines, cosines, exponentials, and logarithms for computing partial derivatives using the chain rule with $x = u(s,t)${"altText":"x = u(s,t)"} and $y = v(s,t)${"altText":"y = v(s,t)"}.
function [myFun,myVars,myVarFuns] = GenerateExercise5(degs)
syms x y t s f(x,y)

[myFun,~,~] = GenFun([x y],2,[-3 3],"simple");
if max(degs) == 1
    [xFun,~,~] = GenFun(t,1,[-2 4],"simple");
    [yFun,~,~] = GenFun(t,1,[-4 2],"simple");
    symStr1 = ['"Compute the derivative "' "diff(f,t)" '" "' "" ""];
    myVars = t;
else
[xFun,~,~] = GenFun([t s],degs(1),[-2 4],"simple");
[yFun,~,~] = GenFun([t s],degs(2),[-4 2],"simple");
symStr1 = ['"Compute the partial derivatives "' "diff(f,t)" '" and "' "diff(f,s)" ""];
myVars = [s t];
end
myVarFuns = [xFun yFun];
displayFormula([symStr1;
    '"where "' "f == myFun" '","' "" ""; ...
    '" with "' "x==xFun" '" and "' "y == yFun" '"."'])
end
%[text] Function to check the solution to Exercise 5.
function CheckEx5(dfds,dfdt,myFun,myVars,myVarFuns)
syms x y s t f
comboFun = subs(myFun,[x y],myVarFuns);
f_s = diff(comboFun,s);
f_t = diff(comboFun,t);
if any(ismember(myVars,s))
    if isAlways(dfds==f_s,"Unknown","false")
        displayFormula(['"Yes, "' "diff(f,s) == f_s"])
    elseif isAlways(dfdt==f_s,"Unknown","false")
        displayFormula(['"It looks like you switched "' "s" '" and "' "t" '" in "' "diff(f,s)" '"."'])
        displayFormula('"Please check your work and resubmit."')
    else
        displayFormula(['"No, "' "diff(f,s) ~= dfds"])
    end
elseif isAlways(dfds==0,"Unknown","false")
    displayFormula(['"There is no dependency on "' "s" '" in this problem."'])
else
    displayFormula(['"Where are you finding an "' "s" '" in this problem?"'])
end
if isAlways(dfdt==f_t,"Unknown","false")
    displayFormula(['"Yes, "' "diff(f,t) == f_t"])
elseif isAlways(dfds==f_t,"Unknown","false")
    displayFormula(['"It looks like you switched "' "s" '" and "' "t" '" in "' "diff(f,t)" '"."'])
    displayFormula('"Please check your work and resubmit."')
else
    displayFormula(['"No, "' "diff(f,t) ~= dfdt"])
end
end
%[text] `GenerateExercise6` uses [`GenFun.m`](file:../FunctionLibrary/GenFun.m) to randomly generate practice problems involving combinations of polynomials, sines, cosines, exponentials, and logarithms for computing higher-order partial derivatives. The variables that may appear are $x${"altText":"x"}, $y${"altText":"y"}, $z${"altText":"z"}, $w${"altText":"w"}, and $t${"altText":"t"}. As coded, the value of `order` can be 2 or 3 in this script.
function [myFun,myDerVars] = GenerateExercise6(numVar,order)
syms x y z w t f
[myFun,~,varList] = GenFun([x y z w t],numVar,[-4 4]);

myDerVars = randsample(varList,order,true);
var1 = myDerVars(1);
var2 = myDerVars(2);
if numel(myDerVars)>=3
var3 = myDerVars(3);
end

combVars = prod(myDerVars);
str = "diff(f,combVars)";

switch order
    case 2
        str1 = '"second"';
    case 3
        str1 = '"third"';
    otherwise
        error("Unexpected value of order in GenerateExercise6.")
end

displayFormula(['"Compute the "' str1 '" order partial derivative "' str '", where "' "f == myFun" '"."'])
end
%[text] Function to check the solution to Exercise 6.
function CheckEx6(myFun,myDerVars,mySoln)
syms x y z t w

order = numel(myDerVars);

combVars = prod(myDerVars);
str = "diff(f,combVars)";

var1 = myDerVars(1);
var2 = myDerVars(2);

step1 = diff(myFun,var1);
step2 = diff(step1,var2);
switch order
    case 2
        CorrectAns = step2;
        str1 = '"second"';
        str2 = ["var1" '" and "' "var2"];
        str3 = "diff(step1,var2)";
        str4 = "diff(diff(f,var1),var2)";
    case 3
        var3 = myDerVars(3);
        CorrectAns = diff(step2,var3);
        str1 = '"third"';
        str2 = ["var1" '", "' "var2" '", and "' "var3"];
        str3 = ["diff(diff(step1,var2),var3)" '" = "' "diff(step2,var3)"];
        str4 = "diff(diff(diff(f,var1),var2),var3)";
end

if isAlways(CorrectAns == mySoln,"Unknown","false")
    displayFormula(['"Correct! The "' str1 '" derivative of "' "f==myFun" '" with respect to "' str2 '" is "'])
    displayFormula([str3 '" = "' "CorrectAns"])
else
    displayFormula(['"Incorrect! The "' str1 '" derivative of "' "f==myFun" '" with respect to "' str2 '" is not "'])
    displayFormula([str4 '" = "' "mySoln"])
end
end
%[text] [Return to use of `DrawSlicesOnPlot`](internal:M_295d)
function [MyXLine,MyYLine,lgd] = DrawSlicesOnPlot %[text:anchor:M_3a50]
% Draw a surface with constant slices and return handles to the constant-x
% line, constant-y line, and the legend so the lines can be redefined

% Define the domain
x = -5:0.02:5;
y = -5:0.02:5;
[X,Y] = meshgrid(x,y);
% Define the surface
Z = X.^2.*Y + 3*Y.^2;
MySurface = surf(X,Y,Z,EdgeColor="none",FaceAlpha=0.6);
colormap sky
xlabel("$x$",Interpreter="latex")
ylabel("$y$",Interpreter="latex")
zlabel("$f(x,y)$",Interpreter="latex")
hold on
% Add a line f(1,y)
MyXLine = plot3(MySurface.Parent,ones(size(x)),y,y+3*y.^2,LineWidth=2);
% Add a line f(x,1)
MyYLine = plot3(MySurface.Parent,x,ones(size(y)),x.^2+3,LineWidth=2);
hold off
lgd = legend(["" "$f(1,y)$" "$f(x,1)$"],Interpreter="latex");
end
%[text] [Return to use of `DrawSlicesOnPlot`](internal:M_295d) [Return to use of `MoveLinesOnPlot`](internal:M_7d2a)
function MoveLinesOnPlot(ConstX,ConstY,MyXLine,MyYLine,lgd) %[text:anchor:M_0d97]
% Use the graphics handles returned by DrawSlicesOnPlot to update
% the plot with new slices at z = f(ConstX,y) and z = f(x,ConstY)

% Define the domain
x = -5:0.02:5;
y = -5:0.02:5;

% Compute the values for the slice along x = ConstX
MyXLine.XData = ConstX*ones(size(x));   
MyXLine.ZData = ConstX^2*y+3*y.^2;

% Compute the values for the slice along y = ConstY
MyYLine.YData = ConstY*ones(size(y));
MyYLine.ZData = x.^2*ConstY+3*ConstY^2;

% Update the labels in the legend
lgd.String = ["$f("+ConstX+",y)$" "$f(x," + ConstY + ")$"];
end
%[text] [Return to use of `MoveLinesOnPlot`](internal:M_7d2a) [Return to use of `DrawGrad`](internal:M_4f76)
function [EdgeStrength,direction] = DrawGrad(EdgeImage,Position,Shift,DrawRealTime,ScalingFactor) % Function to calculate and draw gradient - This function can probably be part of the script. %[text:anchor:M_2b3e]
% EdgeImage -The edge image picture
% Position -The position coordinates
% DrawRealtime - "DrawNow" or "Static"

if isstring(EdgeImage)
    EdgeImage = imread(EdgeImage);
end

[nx,ny,~] = size(EdgeImage);

PixelIdx = round(Position);
PixelIdx(PixelIdx(:,1)>nx,1) = nx;
PixelIdx(PixelIdx(:,2)>ny,2) = ny;
PixelIdx(PixelIdx<1) = 1;
Col1 = double(EdgeImage(PixelIdx(1,2),PixelIdx(1,1)));
Col2 = double(EdgeImage(PixelIdx(2,2),PixelIdx(2,1)));

% Define two positions from the drawn line
Position1 = Position(1,:); % First position [x1,y1]
Position2 = Position(2,:); % Second position [x2,y2]

fx = (Position2(1)-Position1(1)); % Change in x=(x2-x1)
fy = (Position2(2)-Position1(2)); % Change in y=(y2-y1)

% Calculate the magnitude of the Position vector
magnitude = norm([fx fy])/ScalingFactor;

EdgeStrength = abs(Col1-Col2)/magnitude;

% Calculate the direction (angle) of the vector in radians
direction = atan2(fy,fx); % Direction in radians
direction = abs(direction*(180/pi)); % Direction in degrees

if strcmp(DrawRealTime,"DrawNow")
    % Animate the drawing of the line from Position1 to Position2
    numFrames = 200; % Number of frames for the animation

    prevX = Position1(1)+Shift(1);
    prevY = Position1(2)+Shift(2);
    % Animate the line
    for t = 1:numFrames
        % Compute current position
        currentX = Position1(1)+Shift(1) + (fx*t/numFrames);
        currentY = Position1(2)+Shift(2) + (fy*t/numFrames);

        % Draw the growing line
        drawline("Position",[Position1(1)+Shift(1),Position1(2)+Shift(2);currentX,currentY],Color=[0.3010,0.7450,0.9330]);

        % Update figure
        drawnow limitrate

        % Store previous position only in the last iteration
        if t == numFrames - 1
            prevX = currentX; %#ok<*NASGU>
            prevY = currentY;
        end
    end
else
end
% Compute the step displacement for quiver
quiver(Position1(1)+Shift(1),Position1(2)+Shift(2),fx,fy,0,LineWidth=2,SeriesIndex=6,MaxHeadSize=0.5);

end
%[text] [Return to use of `DrawGrad`](internal:M_4f76) [Return to use of `Visualize1DGradientDescent`](internal:M_104d)
function Visualize1DGradientDescent(L,alpha,w0,n) %[text:anchor:M_815d]
% Plot the function L(w) and the initial guess w0
% Then follow the gradient descent algorithm with learning rate alpha
% and plot each step w1,...,wn
syms w
J = matlabFunction(L);
gradL = gradient(L,w);

PtVals = nan(n+1,1);
PtVals(1) = w0;

fplot(L)
hold on
s = scatter(w0,J(w0),40,"yellow","filled",MarkerEdgeColor=[0.5 0.5 0.5]);
hold off
for k = 1:n
    wk = PtVals(k);
    % Calculate the gradient at the point wk
    gradLwk = subs(gradL,w,wk);
    PtVals(k+1) = wk-alpha*gradLwk;
    % Plot the new value
    s.XData(k+1) = PtVals(k+1);
    s.YData(k+1) = J(PtVals(k+1));
    pause(0.1)
end

ylabel("Loss value")
xlabel("Minimal value (w_k)")
title("Visualizing 1D Gradient Descent")
PtVals = s.XData;
for k = 1:10:(n+1)
    wMin = round(vpa(PtVals(k)),4);
    idx = k-1;
    displayFormula(['"After "' "idx" '" iterations, the minimum value is calculated to be "' "wMin"])
end
end
%[text] [Return to use of `Visualize1DGradientDescent`](internal:M_104d) [Return to use of `PlotGradientDescent`](internal:M_676d)
function PlotGradientDescent(L,gradL,alpha,w0,n) %[text:anchor:M_2a88]
% Plot the surface z = L and the initial guess w0
% Implement gradient descent with learning rate alpha for n steps
% Plot each intermediate guess w1,...,wn
syms w1 w2
assume([w1 w2],"real")
J = matlabFunction(L);
figure
[u1,u2] = meshgrid(-4:0.1:6, -4:0.1:6);
surfc(u1,u2,J(u1,u2),"EdgeColor","none","FaceAlpha",0.4)

title("Energy Consumption Cost Surface")

PtVals = nan(n+1,3);
PtVals(1,1:2) = w0;
PtVals(1,3) = J(w0(1),w0(2));
hold on
clim([2.1 65])
CDataVec = nan(n+1,1);           % preallocate color values
CDataVec(1) = PtVals(1,3);
s = scatter3(PtVals(:,1),PtVals(:,2),PtVals(:,3),40,CDataVec,"filled",MarkerEdgeColor=[0.5 0.5 0.5]);
subtitle("Guessed minimum: " + PtVals(1,3))
view([66.6 26.9])
hold off
xlabel("Minimal value (w_1)")
ylabel("Minimal value (w_2)")
zlabel("Loss Function (L)")

for k = 1:n
    wk = PtVals(k,1:2);
    gradLwk = subs(gradL,[w1 w2],wk);
    PtVals(k+1,1:2) = wk-alpha*gradLwk';
    PtVals(k+1,3) = J(PtVals(k+1,1),PtVals(k+1,2));
    s.XData(k+1) = PtVals(k+1,1);
    s.YData(k+1) = PtVals(k+1,2);
    s.ZData(k+1) = PtVals(k+1,3);
    s.CData(k) = PtVals(k,3);
    s.CData(k+1) = PtVals(1,3);
    s.Parent.Subtitle.String = "Guessed minimimum: " + round(PtVals(k+1,3),4);
    pause(0.2)
end
end
%[text] [Return to use of `PlotGradientDescent`](internal:M_676d) [Return to use of `PlotIAsImage`](internal:M_2b44)
function PlotIAsImage(I,Ix,Iy) %[text:anchor:M_1da3]
[x,y] = meshgrid(1:200);
tl = tiledlayout(1,2);
nexttile
quiver3(x,y,min(I,[],"all")*ones(200),Ix,Iy,zeros(200))
set(gca, XTick=[], YTick=[]);
axis image square
grid off
box on
view([0 -90])
title("The gradients of I")
nexttile
contourf(I)
set(gca, XTick=[], YTick=[]);
axis image square
box on
view([0 -90])
title("A filled contour plot of I")
title(tl,"I Plotted as a function")
end
%[text] [Return to use of `PlotIAsImage`](internal:M_2b44) [Return to use of `PlotXrayImages`](internal:M_5767)
function PlotXrayImages(I,Islice,EdgeStrength,nx,ny) %[text:anchor:M_4d74]

fig = figure(Units="normalized",Position=[0.05 0.05 0.9 1.1]); 

tl = tiledlayout(fig,4,4);

nexttile(tl,1,[2 2])
img = imshow(I);
drawrectangle(Position=[1 max(ny-669,1) nx-1 min(ny-1,669)]);
title("Original image")

nexttile(tl,3,[2 2])
imshow(EdgeStrength,[0 20])
title("Edge Strength")

nexttile(tl,9,[1 4])
boxchart(EdgeStrength(:),Orientation="horizontal")
title("Box and whisker plot of edge strength")

nexttile(tl,13,[1 4])
histogram(Islice(:))
title("Histogram of image intensity values")
end
%[text] [Return to use of `PlotXrayImages`](internal:M_5767) [Return to use of `AddDirectionalDerivative`](internal:M_29cd)
function AddDirectionalDerivative(ax,x0,y0,u,lgd,opts) %[text:anchor:M_48d7]
arguments
    ax 
    x0 
    y0 
    u 
    lgd
    opts.ManyUs (1,1) logical  
end
syms x y
assume([x y],"real")
f = x^2*y+3*y^2;
fFunc = matlabFunction(f);
uNorm = u / norm(u);
hold on
Duf = subs((dot(uNorm,gradient(f))),[x y],[x0 y0]);
z0 = fFunc(x0,y0);
DuVec = quiver3(ax,x0,y0,z0,Duf*uNorm(1),Duf*uNorm(2),0,LineWidth=2,MaxHeadSize=1,SeriesIndex=3,DisplayName="$D_uf(x_0,y_0)\hat{u}$");
uVec = quiver3(ax,x0,y0,z0,u(1),u(2),0,LineWidth=2,MaxHeadSize = 1, SeriesIndex=4,DisplayName="$\vec{u}$");
title("$D_u f(x_0,y_0) = $" + double(Duf), Interpreter="latex");
hold off

pause(0)
if opts.ManyUs  
    theta = linspace(0,2*pi,24);
    uLength = norm(u);
    pause(0.1)
    subtitle("$\vec{u} = (" + u(1) + "," + u(2) + ")$",Interpreter="latex")
    pause(0.4)
    for idx = 2:numel(theta)-1
        uNew = [cos(theta(idx)) -sin(theta(idx)); sin(theta(idx)) cos(theta(idx))]*u';
        Duf = double(subs((dot(uNew,gradient(f))),[x y],[x0 y0])/uLength);
        uVec.UData = uNew(1);
        uVec.VData = uNew(2);
        DuVec.UData = Duf*uNew(1)/uLength;
        DuVec.VData = Duf*uNew(2)/uLength;
        ax.Title.String = "$D_u f(x_0,y_0) = " + Duf + "$";
        ax.Subtitle.String = "$\vec{u} = (" + uNew(1) + "," + uNew(2) + ")$";
        pause(0.5)
    end
end

end
%[text] [Return to use of `AddDirectionalDerivative`](internal:M_29cd) [Return to use of `VisualizeDirectionalDerivative`](internal:M_7942)
function VisualizeDirectionalDerivative(gradf,uNorm,u,f,opts) %[text:anchor:M_025e]
% Plot a surface z = f(x,y) with an overlay of the directional derivatives
% D_{u}f over a square domain -MaxMin <= x,y <= MaxMin with a spacing of
% Refinement points in each dimension.
arguments
    gradf 
    uNorm 
    u 
    f 
    opts.MaxMin = 2
    opts.Refinement = 4
end
n = opts.MaxMin;
xVec = -n:0.01:n;
yVec = -n:0.015:n;
xSp = linspace(-n,n,opts.Refinement);
ySp = linspace(-n,n,opts.Refinement);
[X,Y] = meshgrid(xVec,yVec);
[Xsp,Ysp] = meshgrid(xSp,ySp);
spacing = 58;
syms x y
DuFunc = matlabFunction(dot(gradf,uNorm),'Vars',[x y]); % function handle
Du = DuFunc(X,Y);   % numeric grid of directional derivative values
DuSparse = DuFunc(Xsp,Ysp);
if isnumeric(u(1))
    u1Sp = u(1)*ones(size(DuSparse));
else
    u1Func = matlabFunction(u(1),'Vars',[x y]);
    u1Sp = u1Func(Xsp,Ysp);
end
if isnumeric(u(2))
    u2Sp = u(2)*ones(size(DuSparse));
else
    u2Func = matlabFunction(u(2),'Vars',[x y]);
    u2Sp = u2Func(Xsp,Ysp);
end

% Trim values for plotting
cutoffVal = 1000;
maxVal = min([0.9*cutoffVal max(Du(~isinf(Du)))]);
minVal = min([0.9*cutoffVal max(-Du(~isinf(Du)))]); 
% Du(Du > 1000) = NaN;

figure
surf(X,Y,Du,EdgeColor="none",FaceAlpha=0.9)
colormap(parula)
colorbar
hold on

% Overlay the (unit) direction vector at that surface point
% quiver3 takes (x,y,z,u,v,w); set w=0 to draw arrow tangent to XY plane
quiver3(Xsp,Ysp,DuSparse, u1Sp, u2Sp, zeros(size(DuSparse)), 'LineWidth', 1, 'MaxHeadSize', 1, SeriesIndex="none")

% Mark the base point
scatter3(Xsp,Ysp,DuSparse,'ko','MarkerFaceColor','k')
% xlim([-1.3*n 1.3*n])
% ylim([-1.3*n 1.3*n])
zlim([-minVal maxVal])
clim([-minVal maxVal]) 
% Labels and appearance
xlabel("x")
ylabel("y")
zlabel("D_{u}f(x,y)")
title("Directional Derivative $D_{u}f$ with Direction Vector $\vec{u} = " + latex(u) + "$",Interpreter="latex")
subtitle("$f = " + latex(f) + "$", Interpreter="latex")
view(45,30)
hold off
end
%[text] [Return to use of `VisualizeDirectionalDerivative`](internal:M_7942)

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[text:image:80be]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
%[text:image:6cf6]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:7c7e]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:8ece]
%   data: {"align":"middle","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:0d75]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:0d89]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:19cf]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:516e]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:1add]
%   data: {"defaultValue":"-x.^2 + 2*x.*y + y.^2","label":"f(x,y) = ","run":"Nothing","valueType":"MATLAB code"}
%---
%[control:button:9418]
%   data: {"label":"Plot surface","run":"Section"}
%---
%[text:image:422d]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:9aab]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:editfield:650a]
%   data: {"defaultValue":"x^2*y + 3*y^2","label":"f(x,y) = ","run":"Section","valueType":"MATLAB code"}
%---
%[text:image:214b]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:6f78]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:65a7]
%   data: {"label":"Generate a problem","run":"Section"}
%---
%[control:editfield:373a]
%   data: {"defaultValue":"\"\"","label":"The derivative is: ","run":"Section","valueType":"String"}
%---
%[control:button:4521]
%   data: {"label":"Check my derivative","run":"Section"}
%---
%[control:button:8b88]
%   data: {"label":"Draw the plot","run":"Section"}
%---
%[control:slider:8ef3]
%   data: {"defaultValue":1,"label":"ConstX","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.02}
%---
%[control:slider:74af]
%   data: {"defaultValue":1,"label":"ConstX","max":5,"min":-5,"run":"Section","runOn":"ValueChanging","step":0.02}
%---
%[text:image:8704]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:08a1]
%   data: {"defaultValue":"1","itemLabels":["A, B, C or D?","A","B","C","D"],"items":["1","2","3","4","5"],"label":"Select an option: ","run":"Section"}
%---
%[control:button:922c]
%   data: {"label":"Plot the contours and gradient of the paraboloid","run":"Section"}
%---
%[text:image:2a58]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j4gbEASHJNlwZYtW\/93dHTixDCDQTRMDKRn8FhATBDNmTOH\/CAiBI4cOQI2HETTLBW9fv2a\/FRUtPXVf\/WeuyRhkB6iLQBp2HLvP0kYpGfUglELhpMFNM9oNKlw6FHp06TZAgAoeVix9Bg9oQAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:1942]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:16b0]
%   data: {"label":"Plot contour and surface together","run":"Section"}
%---
%[control:dropdown:1f31]
%   data: {"defaultValue":"\":\"","itemLabels":["no lines","solid lines","dotted lines","dashed lines"],"items":["\"none\"","\"-\"","\":\"","\"--\""],"label":"Line style for mesh: ","run":"Section"}
%---
%[text:image:8167]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:0290]
%   data: {"align":"middle","height":20,"src":"data:image\/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxOCAxNy44Ij4KICA8ZGVmcz4KICAgIDxzdHlsZT4KICAgICAgLmNscy0xIHsKICAgICAgICBmaWxsOiAjZmZmOwogICAgICB9CiAgICA8L3N0eWxlPgogIDwvZGVmcz4KICA8ZWxsaXBzZSBjbGFzcz0iY2xzLTEiIGN4PSI5LjEiIGN5PSI4LjgiIHJ4PSI4LjkiIHJ5PSI4LjgiLz4KICA8cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTEuOCAuNCAxNi43IC42IDEyLjkgNS4yIDExLjggLjQiLz4KICA8cGF0aCBkPSJNOSw0LjVsLTMuOCwyLjF2NC40bDMuOCwyLjMsMy44LTIuNHYtNC4zcy0zLjgtMi4xLTMuOC0yLjFaTTksNS42bDIuMiwxLjItMi4yLDEuMy0yLjItMS4zczIuMi0xLjIsMi4yLTEuMlpNOC41LDExLjlsLTIuMy0xLjV2LTIuNmwyLjMsMS40djIuN1pNMTEuOCwxMC41bC0yLjMsMS40di0yLjdsMi4zLTEuNHYyLjdaIi8+CiAgPHBhdGggZD0iTTE0LjgsM2wtLjUtLjUsMS42LTEuN2gtNHY0bDEuNi0xLjcuNS41YzEuMywxLjQsMS45LDMuMywxLjksNS4yLDAsMy45LTMuMSw3LTcsN3MtNi45LTMuMS02LjktNi45UzUuMSwxLjksOSwxLjlWLjlDNC42LjksMSw0LjUsMSw4LjlzMy42LDgsOCw4LDgtMy42LDgtOGMwLTIuMi0uNy00LjMtMi4xLTUuOGwtLjEtLjFaIi8+Cjwvc3ZnPg==","width":20}
%---
%[text:image:7c1b]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:803e]
%   data: {"defaultValue":"x.^2+y.^2","label":"f(x,y) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:74fe]
%   data: {"defaultValue":6,"label":"n","max":20,"min":2,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:editfield:2209]
%   data: {"defaultValue":0.5,"label":"Step size","run":"Section","valueType":"Double"}
%---
%[control:checkbox:8e46]
%   data: {"defaultValue":false,"label":"Show contours? ","run":"Section"}
%---
%[text:image:4a97]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:540c]
%   data: {"label":"Generate a problem","run":"Section"}
%---
%[control:editfield:793c]
%   data: {"defaultValue":"\"\"","label":"The gradient is: ","run":"Section","valueType":"String"}
%---
%[control:button:2cac]
%   data: {"label":"Check my gradient","run":"Section"}
%---
%[control:button:968d]
%   data: {"label":"Run the example","run":"Section"}
%---
%[control:slider:39d3]
%   data: {"defaultValue":1,"label":"x0","max":3,"min":-3,"run":"Section","runOn":"ValueChanged","step":0.1}
%---
%[control:slider:140b]
%   data: {"defaultValue":2,"label":"y0","max":3,"min":-3,"run":"Section","runOn":"ValueChanged","step":0.1}
%---
%[control:editfield:7521]
%   data: {"defaultValue":"[1 1]","label":"u","run":"Section","valueType":"MATLAB code"}
%---
%[control:checkbox:859d]
%   data: {"defaultValue":false,"label":"Plot for many different values of u? ","run":"Section"}
%---
%[text:image:26cd]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:35c9]
%   data: {"label":"Run the example","run":"Section"}
%---
%[control:editfield:5331]
%   data: {"defaultValue":"x^2*y+3*y^2","label":"f(x,y) = ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:6c53]
%   data: {"defaultValue":"[x -y]","label":"u = ","run":"Section","valueType":"MATLAB code"}
%---
%[text:image:05a0]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:7869]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:3a91]
%   data: {"label":"Generate a problem","run":"Section"}
%---
%[control:editfield:5582]
%   data: {"defaultValue":"\"0\"","label":"The directional derivative is ","run":"Section","valueType":"String"}
%---
%[control:button:5d1e]
%   data: {"label":"Check my directional derivative","run":"Section"}
%---
%[control:button:8e33]
%   data: {"label":"Show the computation","run":"Section"}
%---
%[control:editfield:095b]
%   data: {"defaultValue":"x^2 + y^2","label":"f_func","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:01bc]
%   data: {"defaultValue":"t^2","label":"x","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:9f9e]
%   data: {"defaultValue":"sin(t)","label":"y","run":"Section","valueType":"MATLAB code"}
%---
%[text:image:5b26]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:8803]
%   data: {"label":"Generate a problem","run":"Section"}
%---
%[control:editfield:9313]
%   data: {"defaultValue":"\"0\"","label":"The partial derivative of f with respect to s is ","run":"Section","valueType":"String"}
%---
%[control:editfield:23ab]
%   data: {"defaultValue":"\"0\"","label":"The partial derivative of f with respect to t is ","run":"Section","valueType":"String"}
%---
%[control:button:100d]
%   data: {"label":"Check my results","run":"Section"}
%---
%[text:image:959e]
%   data: {"align":"bottom","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
%[control:spinner:5ead]
%   data: {"defaultValue":0.1,"label":"alpha","max":1,"min":0,"run":"Section","runOn":"ValueChanging","step":0.05}
%---
%[control:editfield:71c9]
%   data: {"defaultValue":0,"label":"Initial guess: ","run":"Section","valueType":"Double"}
%---
%[control:spinner:76aa]
%   data: {"defaultValue":30,"label":"Number of iterations","max":140,"min":10,"run":"Section","runOn":"ValueChanging","step":10}
%---
%[control:button:545d]
%   data: {"label":"Visualize gradient descent","run":"Section"}
%---
%[control:editfield:0458]
%   data: {"defaultValue":"(w1-3)^2 + (w2-2)^2 + 0.5*w1*w2","label":"L","run":"Section","valueType":"MATLAB code"}
%---
%[control:spinner:602e]
%   data: {"defaultValue":0.08,"label":"alpha","max":1,"min":0,"run":"Section","runOn":"ValueChanging","step":0.01}
%---
%[control:editfield:1db0]
%   data: {"defaultValue":"-3","label":"Initial guess for w1: ","run":"Section","valueType":"MATLAB code"}
%---
%[control:editfield:79f5]
%   data: {"defaultValue":"-3","label":"Initial guess for w2: ","run":"Section","valueType":"MATLAB code"}
%---
%[control:spinner:0ef4]
%   data: {"defaultValue":30,"label":"Number of iterations","max":140,"min":10,"run":"Section","runOn":"ValueChanging","step":10}
%---
%[control:button:3007]
%   data: {"label":"Visualize gradient descent","run":"Section"}
%---
%[text:image:3f7a]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:1fb9]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:6120]
%   data: {"align":"bottom","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
%[control:button:5469]
%   data: {"label":"View example","run":"Section"}
%---
%[text:image:51e9]
%   data: {"align":"baseline","height":117,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAARAAAAEPCAYAAACKiptbAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAABcRAAAXEQHKJvM\/AAAgAElEQVR4nO19+XPcSHbmlwCqilW8b7F1tM6e6Tns8XjGdtgbG+F\/3euN2PV63DPtmekedY9OSiJF8WaRxSoAuT+gQEGpPF4mElWghC+io0Ug872XCeDle99LoBjnnKNBgwYNHBBM24AGDRpcX0T5PzjnuLy8xPn5OYbDITjnYIx91EF2TAWbtjZ9qpJbhX5bW6uS7bPt5z7+vI3qGSkr16c8l\/Y2cq8cyHA4xI8\/\/ojf\/e53ePr0KYbDIVqt1gdC8\/+KSkRlYjuxrep4jiAIlOdl\/xflyeyR9dG1U8lUtdGN2zRP4jHZ+FU6RF3Fvrpxmf6v0qVrpxqb7GbM7TTp18lT2aYbd9lx2IyVYpOpH\/X+MN1bunmSyQ2CQGm7iCsHkiQJ3r59i2+\/\/RbffPMNzs\/PMTMz84HyomDTTadqa3IQOh35Od1NpJu8\/P9hGGofIlsdAK5kUuTI5OpsyyEbf1GW6ECKbVVj1snT\/VfUIXMIups2H4epnzgO8Xyxv+q+Ul0HyvUIguADHbq5olwP0V7b61GcO8pcqeZPvB6inDRNlW1FXDmQ\/ObtdDrodrvgnJdyIKqJKONAXB5u6kNaRgegdm6qB0k3P7K5VekoypI5kPyYyw0rs1\/lpExzZjMOcewqHWEYXqURVTiQolzTQ0m9HtR5p8yLKFc3Dt29K5Opq60U20fFE0EQIAxDRFGEVquFKIrID7fOUNkFkckw6XB5uCehI587VVtRjkyuzjadjqIsXQTiy4HoHiTKuCnjEMdOsUd3zXWyKfOgGodKrulBpehT2SZD8WHXtZMhb5\/LYIwpnYdMdlOFadDgGmAauy0451d6i\/8uonEgDaQo3jCUVc10o1WBum9hktlXXPGLc6aTUfyvKKMKiLpUx3I0DqRBgwbOaBxIgwYNnBGZmzRoUF+UIRCp8lXkaVF\/Tj4W25rISBVx6aovP58fF8lXason6hLlF2U2EUiDBhOED97GRkbVPFETgTSwQtkVn7La1g2Usma+MhfbynYGF9tSxy4jT2X68ja6CKIMZPY2DqTB1FB8MKpyJLLQX2WH6rwMVVZEZPa4zJVvByKrxDQpTIMGDZQolnDTNP3ofBOBNGggwPYt2yphawslmnKNTIrRUP5vkgOR5VRVhp0q+Mi\/ZXJ0TDVFz3XI66sIucUxF28syrsUqrYy7oASwpt02vATNtu5VTBtEKPCltcoXgcVT1LGplJVmLrv\/qPiUxnHdYNq3qu6HtO8zmV1m\/qLu1R1O0arwieZwrhEES6yTXJt6vy+bJNFU5OIiMSV27dO6j4Iioxcjm8bXWVWcb+aIilXmcV9JoDgQKbhwXxCV+7yKZPafpopXm5DflxXjZA5Nx8PbFXw4Zh1\/SjjVKXDthvCVPp1f5tkVVXGlcn7JCOQBg2uA8pELL4cucwp2MhuyrgNGjRwhjICEXMdX1CF2bJw21ZOldxCrsOnvKJMVdipY9PL2KQKoXUpjk3KoLqOpt2Tom0UXTpQ7iuZPaprbsNX6NraVqkoG+J0+k1jL47ZpnpUyxTGxnHVJS\/3iTqMaRI2qHTIjvuwx3fobyurDJEuOg7TAqA7brJNxsGoFrDaOpAcZS+4adW0jS4oF8sGJhk251V7G8rYVSayM5F\/Ve4DkUURLns7KBGzCrJ7LX8YbcZRPEbRW9ShGodMvkq2LjL5rDgQH6y0jQzfJbRPGddtfJO4l9I0ddLjaptLBdY5AtGt3D4jCNuymGnnnYt3NvETon6dTNU4fK34Ju7CZ1piO0aZjVTYlpXFsNslcpGNg3Jv6drallhFLlIXKcj6iXaWcUjeU5iyhJqNDBt7VBfVJe8sk6tOmsdQ3dwmEo5C6poe2EnChdS1ka1zCqIunfMRUzGxLYU4l5032VDGWchQdCAfpZteNDRo0OAjyB5gHVlZRi6lj8qeMo6mchK1ylWrirB8WjCV6apYbUXoqiK+dFLGUZdIJ4frvFNTGNuxUqNJX9DJNDoQXzePSY5LrkpJE6p+IKoApVogZcQtqjAqHbqbXjzv855weQhM\/ETeJl9lxXR2ksQtNQ0qQufQXSkDF+hSmFqWcRt8jLqtyq6Y1jhUzqWOoJKfrgUMW3LVG4laJRlqCuFdQQnLp0l21vUmpsBUrbAhCYvtqZGUriJSxnZXfEQwFsYxSb7DR1+ZnIZEbdCggVc0DqRBgwbOIKcwNhtzysI1j5s0fNjgm5SkyLAJ\/Sn7QExkaPFY8R7K5cn6iX+r2qrGVSRPbfqJoBC1qrZpmnojmqltTFSAbG5l7Uzyc9QmAvGRI9aNT7AZk6mti2OwhWs50KZK4yMvr5pPsH1oTXssTP+Z5JjOqdqpdLjIVeGjCEQcnO+HUrb6ycqzsva6FaRsBFB2dRLl2KxURRm2K6xqhdStnNTVpthWjEBtdFBIVNnfxfYmQlY2Dl0\/igzbfrYPoum+lZWabatJKsdGOSaekzmbibwLY6relHFSppBNdhGo+w5c7PKZ4ukeFtkD7fo2ruzBd02FZA+sKoURz1MewDJ7RkRnqBuHTRSist90PagO1HTORqZqEXB1IKVSGB\/haNVQhW91tn1atunCZ2o\/0xy7XoNJ97OVPY3+VYGSbuWw2omqC5mL0K2UqpWNsg\/EFIabIgnV6lhVdKSCbsXXpQGu+xxEWa62iqDOq20Ko9NlOy6VbTaRi43c4jFbHZR73yZa8wWdrqYKUwI+bKA8PDayXFOP\/P9VOB7TokOpHFBlFdvZcjIyuDyo03jIq0RlKUwDf6jbzebTORbhWulxtWeaC40tWSlrKz60qlTCJEOl31aeiNr\/Lgw1bakqIjKlcCJswnKVnipXfZ9zJEsLfEVSRbiS2VXMYxnYPld1iWScUpjckZSpRBRRtpzmqt+U79qw2pSwWKWPwgPJ7HFta0oTqKBeL9n8mPq52OT6MFXRz9Z+WRVIx6EUj8vuHRPn58vx6Did5m1cz5CFixTHWIYwlcmoK1Rjq4qwrgrTtLfMok5x8jbyGw6kQYMGzmgcyDVBnVfnSRCcruSraz8KJsVNlCVOq8TEUhhTOF8VGVo21KTU5vPzVRCVKn22eqogBl3sKVsqdu3rUlbOz+nu2etKjNqgEg5ER+pMcrU0bcDyBYoDdCVKi\/1FB2ozLtXbn6Z+xRsk335dnFfVQ2TaSGaC6mGifs1c1leni7oZTRyv6noFQWAdGVS5f6oqFO8P8X74pLaym+wxVVDqgjrYM81qh+qBddGRpqmTPTL42ObgI71I0\/SDcRXtEueJc05um8sV2+hs9rqVvYxnpeyfcNFlCpmpZUqqDbJSHdVOmT26aMS0clP7FSMJ2TlT2inaKRuHCrL7SmeDzfUSV04qdKV4WRtqWkIdBxW20Y9rW908fuBAdIOTheg+bixXR2Fzo4uydCGxqMM2FZHpoYTMKnt0URP1oXXpZ\/vA2jz0MnsoD5+vB9bV2cnkF\/tTU0WZDBs7bJ2QOL+m+0vmQFTXqDZVmKpCZtX5OqQJRUx6RfIpdxJz7CMV8WnPpFO8ScAlvapkJ6oopwhKROJKIlJ12kBM4UxyKasRZbU2RWYyUFIYGUzjcIkCqSs+JRVTrZK+IgkdVGN3iYhcdU7b6eh4kFJVGNVAP9UqjI3cYnvbeXEdi89+ZTgHG\/0UR+CD8LapwqhsMd3v04oAq0bRgWg5EBfBdSpJ1cGeaeovO35Vf5NcE8fiww5XHT7viUmlw7Ypow33ouNDVPJ1qU1pB1JE1Q9PFVFGmaiJeiFcI5FiH855qZ+upOgs3lz5g0chp3XyRFtk4zClMGVQtKE4Jp1+sX\/VEYZM5yT1maBLYWpDojZo0OD6oXEgDRo0cIbyg0K6sCWHC1usaiMLNX3BptKj6m8K53Whv+2YZO2oeyV0Y7DRTQmj8zHJUg5TP5lOXXvVvOrk+EgB8tcDTHNLTRFd7DKNt+pUR+cPPtsIpC755XWAaa5UezTqMMdlbMgfmHx7t6qN6bytDdQF3NRfdU6ny1ZfbUjUIsHoM\/qQsc7i35OunNiw4JMo4\/rSTdkHYroeYt+8TdnV1uY6y8hu28qIT0zbEZeqwhQnc9JlUp2DcrnRZU7KdLPY7h+w3Wtgk16ZQvRiKkGdOxvbROjSHeq8yXRU8cDk9y5Fdh2rINNEnsZdmyqMzwlzlSWWHqnybNra9CvDL7nAVZb45uckdZvg881cX7BNHYptZf0oPKbLeZWN2t\/GFY8XvRCFUMzbqc4Vz5tCX9U5XVRh0qFrb1pVZf1UMkzjMtmS\/98UOdjOncs4KP3E+4d6D1DsUfVRyfURTeSRnW\/HRrVt2hGIzol85EDEm75syiJLEWTni\/ptdNo6HlUfnXwfKQwVdUlhXMZBeWBVobAL10PpQ1lgXPSpFlLTIqW7X3UOeZrQRUi1SWF8pxo5bIgwVx2ubW36TfMm8rlC1jGNMKGquZ+2Y\/CBUi\/TqSIUXXipWjWKXpgi1yVy0RGnKvhKYXQyZbbJzpsih+InDX2lMFTb8vOUqJWSfsjO53NqG0FS29r0VY25aKetXlV05sPRUDIB3TlyCqNT7COlKYMyebyrLJfqhU3bsryGi1zTdTSF37J2ZebGBiIX5wLTPWwrW+QGfUcW045UrkUK4wpTROAjbbFJg1xTJhPJOu2bSAfbVXaS+nz0U8nSyVOd1\/XTHRf7if822WPSYbJNhWvvQBo0aDA9ND9t2cAIn2mrK0dSpT4Tqk7bbTg5n\/pUOsUoRBfhkB2IL\/5DlitPegJFuBCyZXS4yFbxDMVjuu9oiPqpN5HrPNhwUjY8UBm5VFBKrz5QBV9SBcgORGRbRadBffhtL7Iox7Y6outnukgmfT4usE31pizB6ANl9kwUZaiO2ziM4nnxJi7jMCgPr27Phq1eCjleV2eiq8J8tGSZBuFCtFQJir1VyLXtV6c5o4C66let2+W8b5iITyp5KUsNqoQsINC1cQG5jAtUw6Cr9kFQS4Ou\/UR7VBECNTqRpQWm\/RO+4ZpmlonQVHKqCPdt5ar2ZlRh36cMnYPx9tu4Ph2NKv92ydtVDsWUmqnGZdqIQ+knGwflATHtA6GG0i6O2RZVPqCq9EN3L4qpcgM6ig5EdCa1KeNWdaOqVsW69VPJcOnvGz51l7nOxZu4cGb8HxCAo8UTBDyFTEu+jb5MyG7bV2yv+lt8QCkpkyotovQ39ZX9J3sNQRqBFDvZhPCy47aghv7UqKHYjxpVuKYiLv2KN0Peh0oG26yo4kqsstsGruSzC6EovXZX\/+dgSJEiQIIADADjKbhifZwkaVl3gpQCnVOy4kCKoITlxXOmtIaSClFDf5sURhUK26YiZfpRYeqn+rkEUbeNA\/HN5ZhSKFP6yhgDQxZthDwFz9wFQqR4F8xgL5zDRnKGreQMw6CFeOxQirpdKik6e2T9KXNctXOxSYt1bXQRTS03klEcjks\/3c3j0q+sPao+VcA2naLY7sOh2CB3HAGAFAznrIXDoIt+2EYIjtfhIp5HS7gdHIMDWEqHCJAihdyBuyx0Jogy6p56lrVPuw\/EpLg4WaaVmSJPDOFdQ3\/xYclX5uJ5XcqgOq8bc5l+KttE2aYfXCq+jSvKdAU1IhRBuR46HdLoDhzgHDELcco62A3n8UN7Da9ai0hYgBFCnLE2XkSLOA06+B+DF9hI+xiyiDQHvudu2lA5Spc2Kr9QywikQYMicnKUg+E06GKnNY\/taAk70QJeRYt4F\/aQsAAtngKc4yxoYym9xCV7hVBKpzbwhcaBNKgtAnCwcTQ2YBGOwh5etZbxQ2cN29ES+kEHCRg6PAF4AgZc\/d3hMRh44z4qhtaB2OSEulCXgk+ZRBVtoob+4nFXos+k35RSUSDaZyLltOc4R8AYGFIEnOMcHbxoreKHzgbetBZxGHZxwVpIWYCAc4TIy4tZmtNB5kACzgEOcAbAMhVx5UNsKmPXBaWqMDpURZp9jiSqDwLPp9xiv6rHwYEs0gAQpDECcCSIcBa0cdiaw+v2Ep601\/CqvYyzoAMAiHiKkCcfyIlZAMY5NpMz3IqP0eYxsjgkI2DTNNXySDmHVGxjqjTmeyNEuarjRVlFviw\/ZlpoZG1NizdlwXANAKwciKsS26iiKlvECa+6XxEu9tpWOagRkeka6KIuim4dCS+NCMfFWACIEWIURjgOunjbWsDTzjqed1ZxGsyAAQh5Oi7cfiw\/BcMsH+LBcB8\/Ge5hJh1iBHpkZNOG2udTiEbIJKpYCcj\/LZ4Xj5tQl7LWtGBKfYrIVxbf80RNYcRzFHtMlTC1w2Ljsmz292XQwmFrDtudVbxsreA46uEk7OIknAEHy3aZShwHH7ugNh9hPTnDnfgQ68kZQnCkkmjCJm0V24hjoI5Zdf46PA+VpTBVhd2fO8Ry7LSh+2WyImSOQjUOBo6Ij8DAMAjbOIpm8ba1iJ3OMl50VrEbLSIJQrR4jNaYIFXaN\/7\/cnKOh8N3uBGfjHkRBmh7+kfVz0TRccki4rJcpCgj\/1t17b2RqGUh8+h17pf3VcmkHC\/CtIqp9oYUYfNBIR\/nZLbL8voP2mZHAWQP\/iBsY6e1jKfdTbzsrOIkmsUgaAEMCHkCxvUugCPbmdriMW7Ep7g\/PMBScoEEnyahOQ2UikB04ZzqhjJVGXTHbfu69sthu6rq+uoeeBXplfczOWtbHkLXh0IaU\/TKVkO5LeyK5wh4ihAp4iDCm\/YyXvQ28Lqzit32Ik7CHmIWIkSKiNN+PyZhDBFPsZRcYGt0gpXkDO00xohFYA7VlzrChyOkpGc6HofEgdQFPqseFFm+Iy1dtUfVPoeNYzaN1QdxW+xrQxTmxwIGBDwB4xycMVwGES6iWRy0F\/Gku4VnvU0cR7PjkmyKFo\/JSQcHQ4IAXT7C7dEh7owO0U5HSMZni2b5uL62jlWEikNROWLdvJsWJJ0dPqMyq08aytrqogJVP9VxkYij9DX1M3lvUwpjE9lQQnhVP4o+E3T2iDcmdU5cIzsAVwVUDo6EMVyEMzhsL+BlbxMvuxs4aC1gGERIWDBuyy2cR4YQKRaSC9wd7eOL0RECniIJgmzcMD9M1wE+FjhTGk151mVoIhALfdQUQdWe0s+nA1HJpTgQVT+lfIy5Cs7Hb8pm\/eKwhX7Uw157CTszqzhsz+NdewkH7QXELEA7jREJ+zko4OMKztqoj4fDPWyNjtHhI4wQXbkhXYqlQ1mnQ6m4FXXI\/l3sK7NfNSbdcZ09OjQcyAQ5ENEeSiojzmWZFYeSDpnGLHM2FDn5XwkCjIIAl2EHx6157M0s43nvBl531zAMWtnuUZ6O93TY39DpmDidTS5xb\/gOPx3sYj4dZC\/N4eMFJB9HAxpkfNa14kAaXD\/k1RXOApxHMzhsL2K3u4q9zgoO2\/M4bfUwCDvjqkn21TAXcAApC9DhI6zFp7gzPMR6fIoOjxGzsGBLg0mgNvtAirJsy6q6fhRZ12F1mjQZbCVrzDeAMfSjLl73NrDd28Kb7ipOo1kMgwgBgFYaZ81LPuIJGLrpCHeH73BruI92GmfvuxjNnMy2BBfy2rav7VgokZhLevORA7EhUVWYVMpQdT+xr478tJHtI7fO5VDybRe59uAADzEI29jrLGO7t4Hj9jyC9H1Jll+Vc93sHL9dghkeY2N4gjuX+1iJzxAHEWIE5JKtKs28zkRrlWg4EE8OzReJatJHrSbZkINlHKypXIjcDs4RJSO0k2H2gR8WocOGYJwjBQMYEKVZ+hKzCOlV9YWGrFrDsDU8xqPBG6yMzgCelWszKeZr2TgJe+iqMLX5KnsRrhdZVeatSp9PWXW+sSm2peNy7dywj\/XBARZGZ4h4DM4YRkEEBmA+Psfq5REWRv3C90yJNoCBgaGbDHH7ch93B3vopEMMWf4yP33+xAfC9DdVnqmfSoeqnyhXRW669LEdowrefhfGtl8OlzzOpp9qc46tTlMVQqbHRldxlZeljpybP2mog48IzZTqMACdZIjlyxOsD\/Zx0prHeTSDEByLo1OsXR5iJhnhuD2HE2QbyyjPPQdDyjLncXN4gFuX7zAXnyNAihihc0rUgAZyFcbkvWTwlT\/a7D2wyV0pm6h0TsZHSkXhGFzCaxMHUpYfMZWWP5DJ8q1gwOyoj3un2ziL5rDTXcfG5QG+6O+CM4b9zjKOW3NIghAB6JUYDobF+Aw\/6W\/j9sU7hDxBygLt2GTlcdlxUYYqbVPJyv+mbsCrEmXSNJXtOl9Quozra6JcHh6X9IQSARWjANUmH1kfFcnpK41ynSNTNKSaEyuSlnNwMIxYiJDHuHG+h\/Ooi148wPrlAXrxANuzm9idWcFxa+7qvZhiGiP\/xkfmJHrJJbYuD3BnsIeFuI\/LsA0wvxm46Rqr+lDPF+8FykYyijwXG2zsN6F0GTdH2fKYTQRA2ayl01Om8qJqJ8onkY8WoEROlK+d29jjkidzZKlMKx3h1ulrzI\/66LdmsT27ieezX+C0PTv+4afxtTOkHwnLvgOyeXmA24M9zCSXiDlDyt\/LmCZU0fC0tga4OMFiX0DuZDjPfplOm8LIhOkwiUkq6xyoDqOKsbjKnfY4VFGb1pkCV46BI\/u8YJBmv8nyuruOZ3M3cdKeAwBEaXr1lkw7HaGVxhgFIYZB+2qXKYCMIwEwk1zi5uAdbg7eIUpjDMcbxlCwq2izLOoypb2qldnUXowgVPI+mi+J7apUmppGUWxwSXN1lIbVT1tSQyGbcyr9ura6i6uLWHSyxPY+y8ouYaPtOGR9KLm8zh7Zg6nVf\/WjTwHOwy7edVfxcv4Wns99gZPWHAKegnFcOY9OMsRc3EcnGeGs1cMwaIMzNnZC2Y6R2WSAmxfvcPPiHeZGfTDGkLCQFH3YRk9l+AMTzzZJlNUt9td9S9ZqH4grYUfxchRvKbYVc3zVA11mQm2djytMqc8kb0oV96N1puP\/JyzERdjFu84Kns3fwvbcFzhrz2YfBuJ5W45OOsTC6Axz8XnGc3C8fwlu\/P+AJ1i\/PMKj\/kusDw8BzpES5mHaRGZdQIociW0qIVGrCv0nraNBOTCevYHLWYCzVg87s5t4NbuF13NbOG1laUs4\/mEoDoZOOsTS8BTrgwMwpHjXWcFF1L36uli+Y3U2HmBrsI+bg330ksH4XZfmXqgTmpfpGpQCQxZRxCxEvz2HN3NbeDF\/G7uz6ziPutnPNXCOFAECcMwkl1gf7GNzkL3DsjezjKP2PC6iDoI0BeOZrE46xMbgEFuDd+ikw6sf0W4cSL1g9UEhMaT2wY\/I2qh0iG191N1tS5wucqmEnfhvW+6EOu82Y5KVHq\/OXb3XwnDWnsOLhTt4sXAbBzMruIg6ABgCZJEHGNBORlgbHODhyXOsDw7xbP4mtmdvoB\/1AJ7vZWUAY5hJhrh18RZfXOyhxUdIWfD+myMCVKSzbG5sU3LbuaL2oZRxJ5GqUWTI\/EKOUoX0SeSYNjpkbV0JS1fkPyhUBr65lWr6cQRpCs6B484CXizewZPFu9iZ3cRFNDP+qFC22StlDN14gK3zHdw\/eYY7p6+wOjjAwvAUvdEFgjRBykLEQVZdWRid4ebFLrYGe5gbXQCcI6G8blsSquqTbb+yNug4B1eZJn2uuPYkqs1xGXxdqOJKbXtRfERSog02ck3VJJmMgKdIWIDTzgJeLNzBs8W7OJhZQcLCq299pOM3ZGfSIW70d\/Hw5Cm2zt+iN7oAY8Cds1dg4Ph+8QHe9NYRByFaaYKti3d4dPYSS6MzjFiYvWfD859pmAw+dwK2CKsyrimFoaQgrnsYRNjU0mV\/62QXddiE\/rrxly2biu1tHCFFro09H1d9cnoTYDwFwHHYXcHTlYfYXryNo84S4iD6YHt6GgSYiS\/wxdkbPDh+hq3+DmbjiyzxYQG68QBfnm5jJr7E6uUX2O2uYRS0sDI8wsbgADPxIHvXZZy7FK9v84BPDqr0BbgGJGrZCgx134mL0zPJ8llBojphn\/qEI8jSlgRpEOFkZhlPl+\/jyfIDnMwsgKU82+cBPuYrGGZHfXxx9gb3j59h62wHM8llVoYdv5bPGUMnHuLLs1dYGJ1h+fIE560u1i4P0YkvwVMOHmTeQ8V9AO73iMzJU\/g6mW7V30WoNoGZFj5TP5UOmSxVG9c0xzqFkRGYJmNsJ4lqE9UeiizRXtdISybDNZIotpOlJ6Jc6tu6FFL3Y2eUl2oZTjoL+OvqQzxZeYh+Zw7g7wlVDgZwoJNe4vbJK\/zk8DFWLw7QTkbjr4YV7WZIwBCCY254hnvJS6RhePXNkKTwspxP5zgt1O0XB6mwikB0KYzYzpdxunNFG0y5ugtUKYzNiqRyYqr5ozjYvK+KGM51qbgXWwevOs8YAzjPftsFDIe9VTxdfYhnK\/dxMrOU\/VAUz3+JhSEJIvRGfdw+eYlHBz9i4\/xt9lst4w8e80zBlc6UsavfhOnF5wji7JunaRAiZeN9IZZcmGyuKHC9l2yjjklDl\/LZVmHEuZz4RjKbSbQhXF3t0ekuI4saCottVc6LEq6KFSDqXOvbZalJghBn3UU8W3mIp6uPcDqzgDBNrl6Gy1+t7436uHmyja\/2H2Ozv4sAHDGLrt5rgUwXz75YNmIMAWPvy7WcS1+1o14bW+LYB0y2qRYKSl+ZnKIs8Tilb1lYORBViO4qI5fj2jc\/VlyNXewRL5zqgpbx4rL2otx8pbCNulQpYtkbhQFAmrEfp90FPFn9Cs9XH+KsMz\/+XZb33zoFY2iPLnH7+AUe7T\/G2vkewjRGGoTSKEJuGytQsNeLJC3eh3UjeCmZhMnpVUKi1i0vrdoeigOR2VC1TbakmBEse6Et4AnAGA57a3i+9hWerz7AUXc5S1vScdrCAiQsRG90hptHL\/Hg4C\/YONtFmMZIggicM+kr+5N6yFwfaJt+dXMYvlHKgbiESjYVDV1oTolWquBATPa5tNHNHYWvUPcp3BoAACAASURBVLH9+THTPNiMMRinLXEQ4bS7jGdrX+H52lfod+YR8PT9Pg8WAAzoxue4efwSj\/a+w2Z\/F4xxpPkr94rfqDWleLLz1HCfuqqKc1iMIqiyTNfH9PyI0aNq3CJM95PKTsp52TnV+dqXcRtMFgx8\/OZsipPuMn7Y+ltsr9zHRbsHMIbgKvJg4AjQiQe4dfQcj\/a+f5+2hBGQp2DTHEyDylEbB1JV+kGRO4lUrG7pngyMp4jSGGkQYX\/uBp5u\/hzP1r9Cv7OATjwAGzuPvEoyNzjFraOneLD\/A9bPdsdRSzj+fnqDaYEaNenaUGH8oJAKtmVCW4JR9sCVSVNEOS6pj8ke1Zz4zJFdUxXjteTZHo9R2MZpdxk\/3vgFnm38DMNWB+148P4jP8F4e\/roHLcOn+Dr3W+xfHGAlIXjb3UAIgFqSgmoIbou3G9QHXT+IJI1Kv7nckPqoHrAfHIZJsbf5eazLRvq7Jk2PiJ50wQMwCDqYX\/xJl6v3ser1fsYtHsI03j8LY8APAgQBxFmh6e4u\/cYj3b\/jOXzfQRIkYTqb3VQ83pfoFbOfNhF4T5M\/WyqfjYLSJk2RVy7KoyN3LqlBq72TGUcfLz9nKcYtOexu3QHzzd\/ht2VOxhFHbTjSwAcyfhDPlEywvzFEbaOX+Lh7p+wfrqDJGwhDjsAGr7jc4TzT1vqYFvV8LEqqfK6sqGujW3UqMMmNaOuOC4yAmQbtQbtWewt3cbzza+xu3wbcdhCmMTIUxHOMuex1H+HO\/s\/4tbBU8xfHCJmIXjhpxXKRqUu1YhPDT75CV86rKowuhSGqtiWV6CG\/i5lXJl8lT4ZXDkS3Vz5LOPahs5ZdYQjSmKABTjrLuHt6j28WnuEd0s3MYo6V2lLwkLwIECQJlju7+HLt49x5+BHzA+OwcEQR+0PfqLhusE2lKfIMznyaTtBig02jqtUCuPTQ\/oI4X0Sr676c+QXqg7pVdHJsDQFQ\/aDTv3uInbWHmB782scLNxAEkRoJUMA2ceROWNojwZYOtvD7Xc\/4tb+X9EbHGEURuAsBAgO3ta+\/G+bvRhUubJzIqiOmRo1qXSqiGGT\/WX2c8hgy4GIcN5Ipmtrc6Hzm6V4QcRjKlvEttRwjFIVkNngyxnJxmUah+qGs04Xx9\/yOOsuYWftIbY3forDsfNg\/P3WdM5CtEcXWD\/Zxu29H3Dj6CV6l2dXr+pPeyX1AVkk6pqyFx8wXTQ57QWFYoM4B2maXv13LUhUV7jYY0p9bNIdmQyZDtUqR7FH5ehUuosIkxE4C9DvLmFn\/SFebf4UhwtbGeeRxmA8RRpESBGgHQ+wdryNO2+\/x9bhM3RH5+AszH6TxZIupSxCdbiPbMl7wD0toVRhbGzwCXE8ZA5E5D9kN6wu13YhEG1AWaEpMnSciGijLiJyhWru8uO6Gyk\/J654eXuRQB53AuMpOMvSlt2Nh3h1433kEY0JU87C7GcX4gusHW3j9u532Dx8gc7oHEkQggehaI5yPLZjN52nRKO6fpTooCxs+bhpwLcNXj8oRPGIFONdWHebFMa2n4s9sv6iDTZyOedXHwyynedgvM+jP7uMnfVHeLX5NY4WvkASRmBpltJwxpAEWdpy5TwOnqEzOs82iI0\/FASHt2SrSANtdE\/7ob3uEIOKImqTwlRJolJyPqpu3c\/8TaotCTz7fE+Yplna0lvC7vojvLrxNY4Wv0ActhGmo6u0JSNML7B2+PLKecwM++MP+2Sv5AeOr9hTUpj8WyamOVClfaqoNJdLiQ5kOmx4DUpao2ur6qeav\/zfxe\/AmFJE1VfRXJ89q9\/GFduojLBNYcqs7GXTJhfdZUN2m7bF1MQ2cuEcSMFw0V3E7vojvN76GY4Wt5AG0dh5AHxMirZGA6wevsDtne+wcfgcncszJEEEsOCq2jKJddx3tGCzONQ1WrGJ4KjRrA3IHEiDTwF87BiAOOrgcmYe+2v38GYrizySsJWlNDzjPNIgRGt0jtXDl7i18x02Dp6iMzzP3rZlzUtxDfRoHMgnBT4OExiSsI3z2VXsr93F242vcDx2HmESj7+vzsB4gs5wgOWjbdx68yds7j\/DzOgMPIiUhGmDcpBFkaYqjO54UZaNXtV51TlVFKLciUoRrIKOMbfNQVVydDJkZShX6MLHsuSqdzngAMveqD2fXcHByh283fgKR0s3kQbR1bc8gIxY7V6eYuH0Lbb2HmPj4Bk6wzMkQZjtVvUYyk+TRG1QHlYORNZZBV9VGJvNUSpZqpvUlNeaSoQU\/T7IX5UccnmaZ3FFHLVx3l3E\/upd7G3+BMeLW1dpS1ZtyZxHZ9jH0vEbbL79ARuHz9C5PANY9oX04vc8RP0iyWlDMqpAIR+vxmnhbF2I0zL6bHRQIhAd+exjTLo2oi5VJUbpQEwkqqmfymDf0E26D7mUCsK0wXgCgGHYmcXp4g0cL9\/G\/voDHC99gTjqIExGABjSIPui2MzgFMtHr7H57kesHTxH5\/IUaRACQWF7usexXoc5nDRUUbnq\/jWlGC56fcD4Mp0KMs+cr+Y2RooboKiOS9Tj4q1V52yrOz5SGFl5jrIa5y+yxa0OjpduYffmz3G8fAuD7uJV5MEZA+MMYRpj5uIUi8dvsPH2MVYPn6Nz2S\/s81BXgXKIZcDrsHmqjqCUcSnps0pu2Taq9mIf5x+W0gl2LakW5ZrCeZ2ToOwRkPVT9VfZ7ZrCUPsp5xdjviPlCNIYo04PR6t38Pbmz7C\/\/gCD3hIAnn0oiHOkQQTGE8ydvsPauydYPtzG0vFrdC5PgfGPQQGAbAeG6cb1kcK4tDXJyUG99qo9H5Q0QJRZRUSse7Zs9Lk4dDIH4hIKlZ0sl5BNdV6Wdog2qmRRck\/fK6ntfF\/ZwvlV2nLZmcPx2pfYvfkLHK7fx7AzV3jjFkiDEGESo9d\/h43dx7ix8z16\/X1EaYyEBWCB3T6PzyWiKDNOW36GwoG46PDVJn+JzooDERXIwiuX1aLMzUeNDMQ+tiSqDDrPbzsmmxSl+O+rMYMDnCOJOjjYuI83X\/49TpZvYdTuAmDj916ylgBH7\/wdNt98h43dx5g93UOYDrP3XrLToLkOkGyWjcGnw6k66iuLqhwsJRJWnfehmxSBTBOu4SslEioTgdjI8QX1XHCwlCPgMUYz8zjceIA3d36Ng\/UHSFodBEl89dJcGkQIkhiLR69x482fsbb7I+b6+2D5h4JYME5Z7MPZInzk4mXSWl8QbaGkZvl51b\/L2FFGBlV+Ea66yA5E9ZDZhvgUD+oa0sm8P+f8o9KjSxkrt8smCvJFsl7J49mHgIatHo7W7+HNl7\/B4cZ9pGGIYPw6PhgDZwHCZIjZkz1svfwWm2\/+jM7lGbIffAqAMWFKTVlMBLeOCCSNy4ILqjrqqxpV2F9lmp3LVMl1fhcmb1dEmVRAVdVxJcRMOnWgrKrFdjapSLG91c3Es8gjbvdweOMRdu\/+BkdrXyJuzSBIRlc\/y5D\/iPXc8Q62Xv4B62++x8z5USYijDIC9opKqQeXURc7Gsih4j+AGqUwRZRJZ2SrY1nYVHVM9ri0ZTxFkCYYzszhaPMhdu\/+PY42HiKJWh84jzSIECajK+ex8fpP6J4fIQ2yX4qbVArWwD+q5kBcZdTSgTR4DzZ+VTtu93C88RBv7v8DTtbvZd\/y4Ol4HwgDGEOQxpg72cUXL77Bxus\/oT04e\/9SXOM8GlQAZw4EoBNotoSazc0uVipE\/TqdtrBNVUxyZLZ\/8G+eIkhGGHW6ONp8hN37v8HJ2j3E7Z6QtoRg4Jg\/eo0bL77B2pvvMNM\/Qhqw7MU44IO3aqusSFBli5yJbY6v4110q7SKo6HoUI1DRryqdMjuTZUOE89oikZkcKEZSqUwxQ5ljTfpsCHTKO3zPq4lP1GGFy5D079wJtvLkaa47M7j6MZX2L33W5xsPkAaytKWGHMnO7jx4vfYePVHzJwfIwmC96\/jEwnTOmMS+08moeM6glzGFT2NLpJQTbRY9bAtkVLIWxVkD7rPm8IUHVFtNzkcxrN9HnGrg4Otr\/H6p\/8T\/eWbGfvJeXae5WlLgtmTHdx49jusv\/oT2oPTbAOZ5hOEdalITANVl4MnCZdI0nVBtarCUJWb\/naFSo6qnKcq+1J1FeVRjlMiJVVlSSYTyB7zzHEkYPEIcW8BB7d+iZ1H\/4zTtS\/BgwjR8PyqfRq2AJ5i8d1TbD39T6zs\/AWdi2MgCMc\/vYCPPgbkK3UxLQIN6gvfDpRcxpWF9TojbSDTQZEha+NDt4rr8c2BfNCXpwBPwYMQl7NLOL7xE7z5yb\/gZONRlrLEF+M9Hizbnh4P0Tt6jRt\/\/b\/YePF7RPEQSdQGy39qMo9SNPrLcDbUcVEg4wEoslwiKRXnQImMXWDiL8pEgWVTZ5v2pBQG0O97N6UDVYfGVWyYMUUJ4vgpe1FMpN7HtnMEPPtWx6i7iMPbf4O9B79Ff\/U2wNPxey8pgBAcARgH5g5fYevxv2N9+08IR4Psw8iZcOux2oK6T4aKzzGVmiYoRQ2xPdmBlEVZ\/qIu9shkmJyMS7rDeEaWJmELg6UbOL75M+zf\/w3O1r4EwBEOBwBjSIMWGFJ0zo8xd\/gKqy\/\/gNWXf0Tr4gTxTA8IQuP3S6tOYa7GVILzoqaUVEJd1k+1OLhEJiaoHlaVLmpxgsLtuVRcqP1yOH+RjFKVkMmgcBvUFU5GmKraqUC5aYoXy+QUbEjbABxIk7Hz2MLh3V\/h8O6vcbG0CZbECHgCsAA8yPR1+sdY3HmMjWf\/hYW9J1mJtz0DIPsuyHVdx+sYgTQVmfdQZSRAiQhE5bl0K7Wsn84JUduK7W2qMBQORIVSeTHnYGmMNIgwWLyBw7t\/h4N7v8ZgYSN7lyUdAkjBgxY4ONoXx1h88xesP\/1PzO89RRhfIg1b2ScIiXbUtfpSN3vK4FN0PNZVGOoE+EwPqG2LyC9WGRuqCFu1+gCwJAYDELdm0F+7jZPbv8TR3V\/hYvEGGE+ztCUIxmkLQ7t\/hKVX32Ht2e8wv\/cEwWiIuN0B8q+IVVj9oKQ9smvgk6j1lXrZwHRfUZ8RU4oiHqMuZJT73mVRFPvlf5M4EDFUmYYnnRSzbCu76KyoKZI0uuEcSFMknRn01+\/i8P7f4+TWzzCcXy28URuAswCMp2j3j7Hw5jHWnv4n5t8+QcATpFGL7Dd0OW4VlQUXh+GD1HWRoXq4y9hTFZfnAl9Fh0pSmAb2yHaXjpC2ejhfv4fD+3+P4zu\/xHBuBQAQJEMAHGnUAUtTzJy8xdL2n7Dy8o+Y3XuGYHQJ3m6DsxC4toxHg08JjQOZEPLvkybtLs437uPwwW9wcvuXGM4uZ+fSJNvnEURj57GLlRffYuXZf2H28DVYkiBtdcb7PBrn0aAesPpZB9dwVeyvI0MphKeqnykEzdvY2q4qOdKRfeA4ac+gv3EPhw9+g9Pbv8icB0+ztAUAH\/8O7czxLpZefIvl579H7+AVkCZXL8XBU6pWF0KV848\/+OQiwws\/Vbg\/fZGhFKKfYk+Z81R9OjtIHIiL4CJcyqhiexXPIJNj60DKwkouy0qrLE2ANEbS7uFi4z4O7\/8WJ3d+gdE4bWFJDIAhjdpgaYrOyS6Wnv8BK89+j97hNpDESMPWBy\/G+RpLXXJ1yrxWXd2wlT9tB+x7PnR8SSkOROXFbKoXYlvTwE1ybPu5thNhtWqk6fhV+wC808P5xn0cP\/gtTu\/8EvHsKlgag6U8+w1aFmRpy\/EOlp7\/HstPv0Hv8HXmeMJWJjhNsy+oe6g4qcZEXR1l94To+G1WTZPzt7XRppJBPad7YGX3N3UORbnUjWSU864kqsqByGB8F0YHWUQgC0kpcmRpgi7isOkn2uueipiRyeRZoBCESLoLGKxs4fje3+Hs9i8xmlsGrj4ExAEWAeDoHO9i8dnvsfTsG3QPtoE0BQ\/DD+T6qFaI\/1Y5A6ocn9WUacImtXBp7xu+71+TM3VOYcrkcCoZk4Rqom0ugJgba5GmAOPgQYR4ZhaD9S9xevdvcXrrZ4jnVwAGsGSURRKMIRxeoNU\/wMLz\/8bSk9+he\/Aqq9REnSwysRxrEbo9BzbjFx2LLrqoS1qUo4421RE2UVMRxn0gpjBIRqz6XomoTovKweTndaGfy43HeZpxFEELcW8Rg\/Uv0b\/zC5zd+hqjhVUEaTp2MAHAU4SjATqHO5h7\/T0Wn3+L7v42wNPsVX1AuT3dFJkVj5uiClMqYQqpVQ7JpE+V1vrgFlxkmO4d3XHZGKqOxqrUoUthjByIyYGUuTi2\/cT+1L5iqO4r9NfK4RwMHDwMEXfncbl6G2d3\/wb927\/AaG4VjOOKAOWcIxpeoH38FnOvvsPi8z+ge7ANliRAGGUOxqRPAtvU0RYUZ3Sd05gGGUpzIDaK6hQeVpEX6tKA9wezyIIHAZKZOQw27qJ\/92\/Rv\/1zjBbWMqojGWWOYZy2tI92ML\/9HeZf\/Dc6+9tAPETS6oAF799tcS2T5\/A1FzYEadnSvkqHLkKhVO1sbKcQnLI2pvTQxDdRHLBtRGlqo7KPCmcORIdpl7hsYBu6fgwOcA4ethDPLWO4cQf9O7\/E+e2fYzS\/ln1VnafA+Ddog0EfnYMdzL75C+aef4uZ\/ZdZqTaIsgglTce\/3WL\/8FdJDF+HaynDdba9LhBJ1OJ8WqUwNgoBe0Y771O1A6KsTLLj0lUuTQEGjObX0L\/\/K1zc\/hrD1duI51czojRNsr6MIbw8R3fvBeae\/zd6bx5j5vA1WDwED8Jsn4eHVKt5WBr4hugTiqjNVva6pUNG8Ox1fB5EGC1ton\/vVzh79I+43PgSPGxl29PjGDzIKinh+Ql6b\/6KuRffYnb7e7RP9sCQIA3bV\/JwncbvCBuH\/SnDdbw+0khTVXRiHMjni3HaEkSIlzbQv\/9rnD36LYarN8GjVlZpAR+XYTnCwTm6b37A4g\/\/ge7Oj4j6J1mFJWymv8H1BokD0W06Ettyrt9IRiIliTCRUvlxv+Qiz6olAIbrt3H203\/C+d1fYbTyBdJWG0iTcVoTgIcRwosT9F59j\/kf\/wO9V39B1D8CGAMPI1x9AHlCuC6bpHyiqkrUp4Ky80NaAlX7P1Q5t84oisE2N7DJAZnssyFRGQPAOZJ2L4s8vvonnP70n5EsbgA8zd574RhHFhzh2QFmX32HhR\/\/H3qvHyO87ANBAB6EpSssJltVbXTtynIoqoqEyg4dbPpdR97HleebRCnd5t4k\/ayDilAUH17VRjLdzSuTSYWMcKVEOEUddH0c4JmceGENZ1\/\/C\/qP\/hHJ\/Fr28Z80GfMYWVQRDvqYffYHLH7375jZf4Fg\/HFk\/gkTnZMYl8\/FpUpQuArd+TJyy45ZvI5pml79RyJRJ31xZKSNyY6icytjhxWplxOnYBgtbmC0tJmVZ5M4cx5BgDRsITo7xOyzP2Dh+\/+NmdePEcSX4GEbPAwyaoTRx+kTpj0XVHt00RpVlmnfhc7pi7B5mCgrt24\/BzXCstnPUXZvh81cydqL8EqiqiaxuPpTZOTQDVaMXkwT4cqB2OAjeWmCsH+E9s4TDFe+QLy0CR61M06Dc0T9Q\/SefYuFP\/4bujs\/AGmCNGgBhjJt3UqwdbMnh23oP+0xVKV\/2uPK4fRNVNuLSPGgNh5ZJtN1Qq1WEsbAWQg26KP75BukYYSLr\/4Bo5Wb4K0ZBOcnmH3yDeb\/\/L\/Q2X0CNrwEj6IsSinAtIpNCqZIpGoU9dbVYTWA1h9M\/avsVciqEjyMgCRGtPcSPc6BIAT\/KkI6M4vu8z9i7s\/\/jplXfwGLYyTjSgtlVHUb\/6Ttqdv4TbBKfQ39qXxJEVRe0SSv7JxLd6Lm\/5\/GikCZUEC+atrmnzI5xv55uzRFa\/8Vuo\/\/AzxqI211MPeX\/4POzo\/gSZJ9njATprVFNgZq2VzsaxqHS36uOy+DLQlO7WMzTlv9MhnTjg7rBFIEIktfikRlVcgvlIsjqNIm0gM5GqL1bhuzf\/w38CBA+\/ANMLwAxp8gVDkPnYNQOY2yD70NXFNUW911diAN3kNHa5RKYT5VqJzYB1Uflm0GQzxEe+evWYOwBR62jFvSdQ9BUQclAhHb+kgD0jS1kiVrTylfiv1UaQzn\/KO2aZoq9VHTg1xmEVWR8b5AiQ4plZoclDFZV2HEi6HK86hf06ZWYa4T3o+DAUGYRRseoijbqK8uN3bVuG4cyaeEfP8HOQJpYAHGrviO5gZv8Llhsi9jNGjQ4JPCVQQipi152KKrWIh5qCjLJ+Gl0uEC17RiEuRunW0r6sxhs6Gw7sjTQRs+qWw5V+xjU\/7VnRfblOHInPeBiJ1M\/IXLxiSfN59PItFWb5mbzVVeUWYOU4n1U3nYRZgI57JOQUfwyu57GyLTpMNkm8mesiCRqEWnIXa2UVQWtvtAXHW4tNddHJcVyFcZV8fIq3TpbjLXfSCmB0iHMvZUBR\/3vmkOXZ83avXEB6wjEIpBstA1V5JXZ2weItvqgwy+bjQXOyjtq3gQpr1npkF9IbsnXKLQogMhV2GoHs53SKzjTUyhqa8URjcuU86bg7LLsYx9IkzpIyVCoubPlFWVGqnZ6HDZ40DdNiC7f1xTU1M6pWtDHZ8NtaDrK4PN\/Wn8qLJKsGqgqgthQtnoY5orsO7GrtouGyd+nfeMXGfbrzvIKYzoPHykFYAduarz4qb2k0hhbDkQ0zlX+1T2NClNA9\/QBRW12QfiesPX4UGxJdCq0uezXx3mtW7QrcQ+5OrOu9jlaqsskFDJMX7SULWyq0hUHXR5edlIoiwH4pqri7rF\/roxUKssOnn5fJkiI8pxWxkUVJV62Mydiwybqpht1Owbprkoa4POkVj\/Ml1RoAo+U4miHOoeB9cbvShrWjCVWG3klJXRoAHwoQMRn0HnFKbKsN028mjQwDdswn9q2zLVEZ0OUwpT5SJSGw6kQYMG1w+l3sa1KSG6ygfs6utldVUhexp2uPBBqj4u\/JBpHCZdpuM6m2R2mPZSqGxVjYmqV2xLlUE5Tx2T7rhOlgpFWV4\/qlxmH4go53PO3at2zBR87tegwXuUIlEnARVBM0nUiUSdhA1lKlafKnKn+TnOjS6yER1H8bzVTlQdbMLUqjBtJ+TDBtc58z3XdZhLG7imTDbyqVvKbefOZJtJd5XpfP63yhd4cyBlINtTYgKljJy3q3InqEkuNbKZdLrnsg8kByW1peb1Kl3U4w2qh47acH4blwKbi07ZjOXbETRo0MCMiXIgxdXHJsQqft3MJgQ0RRg6x2QLWwfnItv0bgu1OmHbz7ataQyUlEJmo8quvD3FXpkOsY8IFfnvUiGxiQopEaqpemOKCH1Bpse4ld1UCtMJd0GZbcF1qBxMwoYyaYvNjT3tuWxQD1hxILLOrqlImbzVxYGI7fM+vlIf270JLrKpEYWrXJt+jQNpAOh3tNaijFuE7EeKqD90VIfKwSRscNVh00\/1wewGflHmfqGkcD5AjkB0bKsNbLmBMnqKslXpj231w\/WCiLmzbh4olYwyf4t6KBENtQJC0eGzalJVZUZ3PVxkT7pSVBUHIsrT+YTmXZgGDRo4o3EgDRo0cIaxCkOFrrxWNzLOVAq0JWtVaYAqlcnb+ZgXnQ6bfjZ9RdT1OpeBj9J81bomzYGQSFQx36GWccsamMNlL4gvfeIxqhyqQzJVhyg6ynIdpj0zFNiU03V22nAnuj0joh6dDtM4VA6VstfE1F6lj8qHUfuVhY1DkpKoLqhiMJOIZKq6CKLzrQqT2BPyOWOSc+T72fNNosrOWe0DkR3zxbJXxeCbUKUDaXC90DhVOchlXLGDbjKrTjFswukydlDSsyrHOkkdLrAN42V\/u+gzcTOcv\/8FRIqdqtSn2EeX0uhWeVm6ZUqPKDClX3W4X5zfxk3T9IMLqANlX4jNhJtuAJuJVeXasvPU\/SyUlcz0gFA5DpP8MsRoMWyV7bcR5fsgZG3wqUcLdSGnrUhUkyDAfWs5dXVxhQtJZeNAVDARfNR+Ze2gyqb2p+TWvh2IqWI1aSfVQB9UTOSbqOJW9OLfvsIw1XZ33ZZs2bn8WH7cdXxBEBgjIrFfcT5F2yhRXPG8qr\/YTlW9kM1nUbbMLtnxYj+bcVBAmQsdf6c6Tq3i2OrQjUGmQ+cgJ8nXWEcgqg7iBIspzDRWhLpWOnwz6j7QVGwauIBMooqhiimErVMKo9s\/MK0UhkLAufSzsaVBg7LQ+YRSW9nrcJM2ZN3nBRO5X2eY7LYZV13moHkXpkGDBs6ovQMxkVF1qIX7RlUrUR15GZkuUZ9Mf11W4M8Burn2+lV2U2WAUrY07buwYdFNdqoYdJNdk4KqQiKzx9dxij2m6gBFro959XltZBUXVz5qEmR1LaswMhJ10gw8ZYMV9ebMZZTdUyHKVT3M4t+5btt+nyNcyrqf83xNEtZl3GlCjEBEB6CrscscHqXSYmsb1SGU7Uexwfa4yrlR9Zrs1K3iKnmyNsU9JUEQXP1N2b4uVrVMNos2yPqLoEaHlMXLZgGhVvao8ijQZSPeP6rsE7YRUN32K9R1j0rdYLrpRWfTYLLQ0RreftYh7+cTn6sDuc5jdoFuNc+P2UQHDfyiGLWKqPSHpXzA5uvgk\/qSODV8pH5NXiZflorJMO2vp7twFzIZpjTAlBpRyHdRlgpUQl+nQ2YXxTaqDpMsEWXvkYmmMGVye1WOK8q2aaNqa9uOmqOKPIMrqqjC5H9Tc2nTQ1Emva0beWy6XlXwC9cBYgpTHPtHVRhZZ9cLXXZ1qpsDcbGzzI1WpQPR2U61xYc9Kj02EYjNHJuiA51dJtKWcs7UxuZes4lAKPJVfXUyrb6JSoXY3jWfd5kgG3227SadKpgIRZfj1OjI5LB82EMJ+VV9dDqK510cJtUuU3+f58q2rypiunIguYI0TT\/4j\/JaehGMsY9eiS\/q0B3nnJM\/UuQbLMPwCwAABkFJREFUtvluEWVzbpk8MVTUpSIyDkFmR7Ft\/m\/qWIttXfkA3XHdeVW0YWOPKN+lHzVqKBN12EQQNtE3Rb7umoj3Y47abGX\/nHLKOqCZ7wY+UBsH0qBBg+sH71WYYhpiQ6xNm5H\/XBn2Bg1MUFVggBpuZb\/u0FULbGS4cBO2tjXwA1\/VxjLcUvG8z6pnflzFgXj9pGHehsrg60CNCEzlQlEGlZybZBRCGYNIhortKXNdtoRbp8isTMRYt\/HY7jOitvUFlfMAHN\/GtR1EFXsRxH4mmS6OwufF8uVYRVl17tfg00CpFMZUS3cJu2QPNyX00vUrG4FQ7C4DWbRjcqwq6L6Yrgtti2+45m1VUUzx37ot+bpxibbpZOhsV41HHItMnuq6i1A5eJtNYaayqkmvCralWxtnT9lrRY5Aio11nYrKfa1M01odfa+ssoepytXbRn7xgXDt1+DTh8qBGDkQWQpjq8wVNp7Y5wNZVf48qVy1SUsa+IaNA6nNV9mbm9kNrvMmpjM+4WPhsVnE6gzTOCa5SKtkl5Ff6qctZb9+RsnRRHn5v6kVBl3un\/8tHi+eD4LggzHIbCy2l4Xwpry0qF9WrRLHJxu3ijuQ2WaKeGwrPTaEb7Gt7Z4hUYfpXqHcSyouRzxPscuW7xPhgwOR9dXJdbHTdH1VjtDrb+OqBmVLjqr6UxyISp4o2\/WB8wXV\/FD0uZRxbbiZMhWjupVIG5SHFYla7GAbdokriEjaiX0pDLDsmKpNGRa\/zHkXB2lzntLeVYfJCZW1rUoC1hSV1AGU+923\/ZOcl+ZdmAYNGjhjYlvZqZ6WmqaIMm1zVWpOTcnPTXoovFAZPkCXDtnsPbFNGynjUNlu0990nWWRb36euhpT5FL66nSp5LlEDJT73TWNtLHD6w9LiUZQbnCfcL3gNvJdMO3vljZoUAZWJGqxUdkH3GWvgQ1BKK4wVALPlUR1mY+GVGxw3aELKCpLYTjn0pW3bFnMpLNZ6euBOhOcNrapqla6vjbpJ6WfTVroY75lRDipCiN6mnxALnmkCFPZ0FS7t4ELB2KKRFT9VH1t07dJRypVp5dVl8ldottJwbdtJllV0gK5TOcIxMcDDZgnVXZeR+SVsc1EatqUPE3yJsX\/2KJxINcH0x6nFQdSpRHU89chFbEZj+oYpToja2tyrLJ+onMwpZe6SItaIaPY7prq6OZSF83aRoGmSo+pv+y8SoeuL9Velb6qIE1h8u3dtl9ll6U7YjpEmaxcjkxWUYZNeiWOU3eM8hCb2ptu2Gk4yOJ86a6HaJvLam+Tt7vgOiwynwqsUxhxdTClHrK+usqJSl+xTZVhm43s4jiqtGkSIXmVOj6HlKKqCKR43uccum5p0Dl96xTGJVSnHhcntI4lz0mlVpMYs6sOaqrkc26qitbK2On6LJjOV3Xty17v4t8qWVoHUsyVVd5TvNAuF4eS7sj0FfvK5Jj0UFB8eFQpUxkiMO+vurFN6ZFuTLrokBohFvuY8nOXHwWj2EGZX1UqVia6Fdu6pK2y87r+VTlhFSjPWP4jc7KMpHkXpkGDBs5oHEiDBg2cod3KLh4H7EqIYt\/rjutOolaN625\/gwwqDkT2zEsdiEn4dS+fFSciL1lT8vfi2IufBHT9QXCZblMVS4VpE9A6B1iHDXS+NkPm8MF7yc658jNVQqfnAweSpilGoxGGwyEAIEkSZUcV4VfcoyHbTyAjPVXHZOd1bXQkpE6ezAZZ2+KnEE06VGM26bPtZ9tW195FFqWfbsGh6NPpLHPeRr5Ohml8VL0qp0Al111AkTMcDtFqtRDH8QdkKlBwIJxzxHGMi4sLkmLTZiyfqNKBqPqIUUXe36cOU1tZZFI8NmkHYnpQZJsOq3IgPhyMTX9AHWnKxmyjh2qja9uycgaDARhjuLy8RBzHcgcSRRHu3LmDf\/3Xf8XKyspV9KG6EVxXcVGmbmCmdjY26R4m0zhs+lFXC9eVXtbW9JDayLUZg66fL3tUbajRga\/zk9JR1oYqZIxGI3Q6Hdy7dw8bGxsIw\/C9LD52J2ma4vz8HKenp+QopKxhvrxonWT5tKNK+VXbOS1dddBbJaYxppz7a7fb6PV66HQ67xcvPi1Wq0GDBtcezT6QBg0aOOP\/A1uiEGSjYcmIAAAAAElFTkSuQmCC","width":118}
%---
%[text:image:8862]
%   data: {"align":"baseline","height":119,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQwAAAEOCAYAAAB8RCmYAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAABcRAAAXEQHKJvM\/AAATnUlEQVR4nO3dW3PjyHnG8edtgAdRlDTSzmTXznrLrtw4VfkAyVX8rX3tSm5c5Ys4VblKlSu1cXzYnezuSCNSJIDuXACgQAggX81BM5v5\/1zwkEQ3unF6hBO5llJKAgCH8KE7AODHI29fxBi1Wq10fX2t9Xqt9sDDzAYrjn3+NuPedPz7mOa7GP+x1fsY+\/Q2499mfj\/EdN9Hvafu0y4w7u7u9Lvf\/U6\/\/vWv9fvf\/15lWSqEIDPbVWxfd4f+xM1MIYQH5bvvu3XGpi9p135\/Jg4N\/Rk9Vqbb1\/68dNvvvj4072NtDdVp2z623Pptvs1yGhp3aD7G+jZU\/l31rbtchqY\/tNw8y+rYdnhsPRzarg4tp7Fl+yb7x6FtpL+838c2sguMsiz19ddf6ze\/+Y1++9vf6l0Y6szYyh4rO7YAsyx7UK67cPptDLXTXZBD7XTrjdXvtjfUt0Mrw1Ov28bYMjo2D2PL9dDy7Q\/9vh0r36831MbYPGVZ5tqGuu+H6vSXW7feoe3w0DbZb6O\/XPp1x+b7WBvH1tlYG2Pz4d1GhraJrrw7YjKZaLFYaMzQDLS8C7y\/og4NhzboQwvDE0ptmccuyKEVNbQBezYGT73+8j0UAMfm4THL91AbYxv10PAmgXFsGxlabkN1hrbL7jYx1sahHfrY8vUExmO2Ec9wbFs\/Ng9D48bk3TchBOV5rslkoqIoDi4478782I3hTdp4k8AY2qAObQwfS2AcWk6eDdq7fI9t4J7196bbyccQGIfWn3fe36T8Y5btUBvvG3dJALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwyz90B\/BpMiWFlGT1m\/b\/8JHjCAMfhKU6NEypeY0fA44w8EFssqm2+UyZSadxo3kslCsphUyyTFFBSSYZUfIxITDwZExJkqkIE303f6aXJ89lkl5sf9Cz4rVmqVQIQZmpOV1JylJqosMkC810pPQhZ+QTRmDgyYSUVJnpdrLQnxaf6+uzv9U2THVWrjSvNpqmUou41VX5WpfFjZblWhfVnWapVFJQSpmSgkymKBMnMk+PwMCTsea44Hqy1Dcnn+nl\/FLr7ETfpkpJppCiTqu1nm+vdVVc67xc6aJca5EK5Yqax1KLVGiuSrNUapoKWTAp5VKSkpli0xLeDwIDT8ZSUjLT68lC19OlKssUUqWQklITJndhpr\/MrvRyeqEsRYWUlKdKi7jRi+JGn5evdFmtdFWtdBa3CiaZZcrMmphoT2GaNtvTGbwTBAaejKWkJNP1ZKnvZxcqLVPWBEYrybQNE93ZVFGmqCApaRpLvcpP9U11oUXcaBELnaRCs1TqIm31PK50Fjc6jxudpEJZkqIFpSQlq2MEb4\/AwJNpT0mCpCxGpRCbgMib26tpd6s1j7GpVV8olaSbbK6bfN7ejJUpaRYLPa9u9UV5o6u40mV1p\/O00TRVmljSXLE+hVHSLFV1\/Fh7LFL3KHEE4kZg4MnEEBRS1PO77\/Tzm\/\/RzfRUN5OlbvNZfdqQhnZd23t5HylSVNBdmOgbO9Or7ESTVClPSbkqzVKlq7jWT6rXehFX+kwbXWmrmardhdP7yabmEqpxKfUIAgNPprJMpqTP1y91Um20niy0npzoLpupDBPd5ie6npzqNj\/RKptrnU2UZM21jObJjJSUKe6mmSQVyrQJeXMKU4dJpqSzuNFfs6Uu4kbn2mqZCs0VtVCpK210kbY6S4XOVe6CpG6lfyUELQLjgSTF+u+XRZNZM4Ts\/nUztCw0zwfsygZZsAfl2zq79yk8eG9mCgNthPSw\/XYITb29PrXjFMbrNeMe1Bksu9\/+Xr\/HhmDN8xSd+VDSxeZaz7Y3Clmon8uyTNtsqu9nF\/p2dqlXs3P9MFnqJpurCvVDXIXlKi1TaUGVtTtz\/f+ZokKS2mOD9orIxnL9OVvqL9ly99lESc\/SnX4ab\/VFWukqbfRcG52qVDDTVElzJU2UNFVS3pz8RIXmVu6njcAYlO63Out8dqj8g\/qP27isM\/ja6I8bqdmvtn+Ev1frzds\/0HbaL1a3EZWl+jpGZpJZpUmqNE2VnpW3KjczFSHT1nKV2UTX+am+mV7oh3ypV\/mprrMTlSHsXSztRkXbm\/poIyiadkceW0mFTnSbTfTf6UxTVZqr0lRRp6nUT9JaP9WdrrTVCxU6U6WgpCgeGJMIjHup+UJDPlM8u1S6eKHq5FTW7Iuh95e1+8hyGPmLWz\/Z3JwZm+2qmO7\/Au+939VrzqV7RzHWaWOsvV15a8oH202\/O93BI6W2z0PlB9rvLgvr9fl4eSlYuH8tU2hOBHKz3d\/zEOvbqvNYaBG3ilWQKWmTJiotU2Hjpw7tyUXW28ujTDea6pWZqua9STq1Qn9KG32tO12o0KUKLRQ1T5V+YWt9pTtFme4UPtljDQKj1fy1SpOZqi9+rvKX\/6j4\/GeyqpRS8zhQ93sNey97O0SvjMmGy1vvvacNGy+\/\/7UL2\/us24exae0HzlgbA7tKfzrH6hzok6W6z90ayUzRTFJQMmmetspi1CrMVMlUWpA94m9\/aC6bBply3R81VAr6xuZ6qVlzE7Y+Ulyq1D+l7zS37\/RMxSd9g5bA6DElpdlC1ec\/V\/XlL2XFRkpVfQAy+melHdE\/NXhwXvPYzgxOatdaanfGtFekLmYPKw728ZFdsl227vWz26e23H4fW71zlKN9qr8G3x59tHc0okylZYpmjwqLbsv9eklSJdO2aSk27dwq07+kz\/Q6TvTP9lJfhbXKT\/SiKIHRF2M95BOl6bze8mMlyXf++v7OcUem\/MQn1U8+fyOj22sW73KXrS+gJmW9xqKkr9NCJtM\/2LX+TitVD7v0SSAwhlhz+c86QyM9ePHgzfvq1KM+PmS\/6x\/LZn9kRvqHMMdrvLW0+7e91vQpHlPsIzD6zKSQKWW5UhakmB86F3koHYqPt9g5R6f7BtNMnX8Oztojpp32\/vEVdha9P2FJzcXV+nmM96m5sa6o+sJoKVP1Ric\/\/78QGK32WkBZyF5\/r+zbP0qzhazc1qcoGr+IYd1X1v+sM\/3e5YSheoN1ByrZ6GeH643VHW57rM3ehYrB+tafrYcl7X5q3Xr3T142FyebJ0CT1dcttiHXpnku4+2uyLR3fu8f+GpXUVDSTLEZKn2pO\/3CVjpXqfITDg4Co9XeDtyulf31v2T\/8a+Kf\/mDrKrqy1+2f4tw8E5Fc4vw\/rbk\/fj2f03lXdnd+O6tUtn+dNtpt5912ti71dtLBTPtT7fT97b83j5vnfa7bbR7tu2X3x+nvXlsb5+Gfmp02rAHt5q1W371YyztNKRoptImus3n+iFf6H\/zpQrL1H6nxGPoqY02mLLdo2D1dYxTVbrSVs+10Qvb6md2py9Dfbt1m4KS9e8LfRoIjD31LYBw873CH\/5N9qf\/bPeFwSc3d7W6O2UwBQsPduah96H\/hOjA0G3DM\/TLH2qj7Wd39h\/TzoNnTvS4NrJQh0GQlJnqR8CDqQq51vlMt9mJVvlc1\/mpXuWn9c\/6WV7fTrWsnZxL97Hx9tQimDRLlZap0IW2OlP96PhSpV5oo2dWammVzq3U31ihpSoVqu+ifKq3VgmMnpQ135x8\/b3C7au9HW9s5wzZ\/k45VLZbJ9jwznywjQPT7I5refrSjruv42tjKDBcbTShkqt+wlMhU8wmKkOuKsu1yaYqsqk2+VS32YleTU51PTnVy8mFXk7OtQ25Qrp\/QPv+OKGz\/nT\/DdTUnAVaqh8fn6vSJMW6fSXNU6lnaavP0kafNU93LlXpwipd2VYzJcXmi2om01pvfwr0Y0dgDLLmYa3YnKrUv8nQGbt\/lJ3S3ueW0v3r3rCnf+Hu0IW8Nx431PCw+2sHQ0N6MB\/jZR\/Wa\/vSZke0oG0202p6quvpWR0Ms0v9MD1XETJFC82TnLm2oR6STNFCZ\/n2nz\/pXgmpH7oyJU0UtUxbXcY7fZbu9CxtdaJSl01YnFj9VfipUv2v1d8pMZky3V\/nAIExLmRSCO2FgL3Xqf2skZojhd34br3+0C93rF63jZFp7o1rOfqSmkezW\/HQKYi92RGGOqckWapUWa4\/Lr\/Qt4sXKrKJttlUt\/lCt\/mJfpie6XW+UFR9etJe8AxKylL3G6rNqYWF5jSjOXJT0jwWOk1bLWP9VfZ5qnSetrpKa52nQufa6kyl5ha1TKUWqVQIUqWs+Z2M+iH1befIor0yQ2QQGHhCeaxUZDN9vfxS\/\/787yWZslTudvgk0zRu1bypNRc\/K7u\/amCSQoqaxkqZoixJuaJO0laX1VpXca2raq2ztNXSSl2mjc5SUZ8GWf1t3Pp0MGlj7W9jPAwIPERg4Ol0zmWiBRUhVxZDc13i\/hZq6\/56xP0P55iSpqnQstroslrpWbXWIpVapK2u4lrn8U4zVZqlqImippY0s\/rr6ma7r7TJlHbPWvQDgrAYR2DgybQ7\/LJ4ravNK72anCo1O2+0+jcnytAe\/CflKWoWtzqptpqnQnmqdJJKXVRrXZRrXcQ7ncc7LVTpRKXO41ZTlUoWFC1TMsksU5RpY1n97VjVF14\/3e+bvh0CA0+mDYzTYqVl8Vo3k4W2IVMeS+UpytL9FYlJLHVa3emiWumqfK3zcq3TuNVZ2uiyWmueyvoujKQsmLJQf5N1q3zvek7zJXvi4R0hMPBkkpksJZ0Way2LlUz1hcuTWOqsXOm8uNVprP\/DRctyrWflrRaxPrqYp1LT5snLefOjNskyJQv1L5U1UVP\/0M39Scanfhv0XSMw8GRi87jTWXGrL1bf6i6fqwi5Ptu8av6jRbdaxo3mqdBpdadltVEwNXdzwu5uVRHyOgjaZz0scIrxRAgMPJn2tysW5Uo\/u\/2zzqqVJinqWfFakxSVWaqf+DQ1P4vXnqA0t2bNmqsb+FAIDDy5kKKWRX26MVGlWSylEJr\/crsphPqHcarusx+dpyE4lvhwCAw8sfrn9oKS8lRKZtpm0\/rooRmSfarf1Pj4sWbwQXQfteYU48eDwMAHc\/8LnfixIDAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4AbgQHAjcAA4EZgAHAjMAC4ERgA3AgMAG4EBgA3AgOAG4EBwI3AAOBGYABwIzAAuBEYANwIDABuBAYANwIDgBuBAcCNwADgRmAAcCMwALgRGADcCAwAbgQGADcCA4Bb3n0TY1RZliqKYvc+xrgbb2a7IYQgMzs4rj+EEBRCGKwzVt7TRve1pAdtjPWnLdt9320ny7KD89Rq2zs2\/22dbrlj9bptHFpOY8sqpTRarx3nWR\/96XjW37E2xqbRdWj8UPmhz4feH2qj\/1l3e+pLKR18763ndaxef3m\/a7vASCmpKAqtVquDnWk7XFXV0YkPrewsyw6OPxQYYyFxKDC6O9NjAqNfzxsYh9obC4y2\/GMC49D899sYm4dDgTy03h4bGIeCzMxUVdVonUN96gdtlmWDdYa2me56Glu2\/XCMMY5uI\/2yQ8E6tD4OLb\/+uG5fPYHR9tdbrzuu2+chu8CYTCb66quv9Ktf\/UqXl5e7ldlfOf0V0eWZ+aGFOPb6UPmhld8f1xpaSUPjDs3H0Dx1p9Gt219mQ6\/789B\/PzbvQ9N7zDwcW76H2npMv8bWhbdf\/fLH2hpqp79M+yHx2H55yo9tI\/3Px9b10L9j63qoX95AOjQfY9OWJEtNvMQYtVqtdHNzo\/V6\/bDgQGVvmQ9V1zP+Tet+rP3ylPmx9utt6rINvpt+7QIDAI7hLgkAt\/8DUKldDXwPi90AAAAASUVORK5CYII=","width":118}
%---
%[text:image:9fdb]
%   data: {"align":"baseline","height":118,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQ4AAAENCAYAAAD+JYsLAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAABcRAAAXEQHKJvM\/AAATbklEQVR4nO3d7W4cyXXG8f+p7nnnu7TyKnYMxLGDIMm3fIqTK\/Cl+gJ8B7mEwHAMBMgmBtbyRitSJOetu04+dPdwht3Dmd4o3tXU81toJZNNroxqHVWdc6rK3N0REekhfN+\/ARH5\/ChwiEhvefOL9+\/f8\/XXX1MUBVmWfZ+\/JxH5gSjLkjzP+fLLL7m5udl8fBM4fve73\/Gb3\/yGu7s7JpPJ9\/KbFJEflvl8zvn5Ob\/61a\/45S9\/ufn4JnD8\/ve\/59e\/\/jXv3r3j8vLye\/lNisgPy+3tLV988QW\/+MUvugPHx48f+eqrr1gsFnz48OF7+U2KyA\/PfD7n7u5u52NKjopIb5sZRwhhkxRVclREoEqOZllGCLtzjHz7fzSffP6QiKSpLMvOeLAJHGaGmW1+LSICu7GhkT9\/YPtnEZGueKA1iYj0trNUUY5DRJ4LIexfqijHISJdlOMQkd664oECh4i8SMlREfkkFDhEpDclR0XkRS8mR1WOFZEuL5ZjQclREWk7qqrSNS0RkTTtiwmtHIcCh4g09sWDVo6j+SEi0sSD58FDEUJEelOOQ0T2OmqposAhItsOJkcB5ThEZMe+HIdmHCKyV1fQACVHReQ7UOAQkd5UVRGRvVRVEZHejqqqKHCIyLaDM47moX1ZVBFJz1Gb3LYfFBE5esahwCEijX1n9Gh3rIjstS8eqKoiInupqiIivSnHISK97YsJSmaISG8KHCLSm5KjIrKXDisWkd4OHuQDSo6KyK59W1AUOERkL13IJCK9HZ3jyLJMOQ4RAZTjEJHvQEsVEelNLeci0psCh4j0pqWKiPS2Lx6ofCIivSlwiEhv2qsiInupj0NEetPRgSLSm66AFJHe1MchIr01+Q31cYjI0TTjEJHeju4c1aXTItLQjENEeju6qqIGsIS5d39cf5Ek66gGMEmYO3hsf9wMUOCQXQoc8jTTaM00FTCkmwJH6jxiscRHU3xyBpZVMw+zKpAUK+zxHso1mJawUlFyNGXuEDJ8dkn59q8p3\/4M8gHEsvp8WZK9+0+yr36LrReQZ9\/v71f+7I4qx2p3bEocyhKGU4o3P6X4+39h9Tf\/iA8nWFlAjISHD9i\/\/SuDr\/+D8BBxMyVKE3MwOarO0cR4lcGIIYPxGfHqDfH1T\/DRCCsdygKGI3x6DiGrsh0KHMlRH4e0mNX7EDxixRJbPoL7ZsZhqwUWC4z6nVDgSM6+WKClSqrcMQ8QrIoH9ceefsT6GQjBCFmGh6DAkRgd5CMtm7F+abi33wnNOJKjU86lxcxo\/un4bPudUOBIjm6rl5anbQZdY+6bvjAFjnTp6EBpeRrrfePtWP1cMCMqcCSn1yY3BY40tP+ieDbudUxpLVckGbqQSUQ+GS1VEtYe645t9V0JUkmGqirS0h7zatydZpVim+YvBY40qXNUWo4Z7yacKHCkad87ohyHiPSmlvNUuWME2HNvRsOCYc07oZbz5KjlXFqOG2\/lOFJ2dB+HAkc6dsZ8TxOYPXtOgSMtSo5Ky25A6HoANYAlTuVY2WVgfsxYa6mSMs04pOXQeD\/v4VDgSI82uUlL1yzT\/dmqZbNUCQocCVJyVFq6E6O7beeb5GjQjCNFYU+5Xg0bItKblioJO64cqxxHyo5aqoQQyLJMnaNJqA4r9mBPG1K6mBEskKlzNEm6V0VaDo53M8HY6uVQ4EjLUeXYlx6U07NdLekac22rF+2OFZFPRrtjk\/WU49g33u5UOY76ndCFTOnR7lhpMQt7qykV1ya3xKkBTFq2G7s6cxzP3gkFjvRor4q07AaFI54LL9Vt5RRpr4q0BDNic0BxxwHnQPuUcwWOpGipIi0Hx7zrPA4FjqSoHCsin4wCh4j0pj6OZDnBvR7vPcsPh8CzPg4tVZKiPg5peRrvPReNV00cynEkbN8kQsnRhG1vqd\/bCFZ\/2DZ\/6+jdSMnRfRxd0xI5TU9NXYC167Gdm9wUOJKiPg5p2TnEx7vnHK2WcwWOpKiPQ1qOGvO6jyOYERU4knNwxqGqSmqeqiqb5UoHs\/DsvVDgSImqKtKyk+PY9wxaqqRMSxVp6Rrz\/feqKHCkSLtjpaV7S\/1WdUV9HMnTXhUR+WQUOESkNy1VEraT4+i4BlINYKLkqLTsjPcLHecKHOlSH4c84wS8e4vBdvd5\/dKojyNN6uOQlmNmme1n9G6kZN\/eNQWOhB1q\/tp+ToEjTcpxSMsx473JcQQFjhQdvTtW2+rTcdRfEpvOUZ3HkSLNOKTl0Jg\/\/7wCR3qOnnEocKSjGet9Z45Wd60ocKTs6BmHyrGpqMuxFjD23SHrmFWZ9SwEosqxyVE5VloONYBpqSL74oGmFiLSmwKHiPSmqkrCDu1TqZ\/SUiVhqqpIy3Et5+ocTZn6OKRlM95HBAMFjjRpxiEtm27Qjs2xzYd0HkfaDs44th9S4EjDzixz\/\/0IChwJ01JFWg71cXQ+p8CRFC1VpKVrxrGzTFEDWPIOnsfRtJtnWaaW80RkQPn8Jrdnd083Lec6ASxNB1vOtVRJz3HjrRlHyrRUkZbWXxYGz6ccWqqkTVUVaWmNtXc80zwXdJBPirTJTUQ+GeU4EnZU56hazpPWxALlOGSjVY7tHHbb6R5V4EiLGsCkZScp2jXkVpVjMQgKHElSVUVaqqBxeLy1VEmXqirSYmZbM4mOz+vS6eQdnHFoqZKeQ2Pujja5JU4zDmmxcOj0r6qxQ4EjXUqOSstutaTj81tLGQWONCk5Ki1V4AgHx7z5fDDDFTiSctSMY3cXpJy64F7NKF5qAdt5L7KurnQ5Yc1u+YMzDl06nQ7Dqlvow\/5GDi1h07Zv7DW1EJHe8sOPyOfKcMwdq++JbX4dCRSW0S\/RaYAT3Mk8YvVZYRFws+oHyoGkQlWVk2ZgTqz\/gMPTznkDzMt6vNkTQ\/xpW71Vp6K7wZps8z12vytHXbUgnw\/1cSSkmWmsw4D7wZTHwYTHfMpDPuExn3C5uuOv7v6Lq9Uda6y+rb7zG9HsfcsMFiHn29Elf5y8Zj6YMC6WnK0fmK0fOVs\/MC6X9UxEToX6OBJiQBly3k9e8d+zL\/l2eMn9YMbt8Jzb4Tl\/ef8H3s6\/IV99qGcSL\/Rn1O9DjrPOhvxx9iN+e\/Vzvh1dMi0fuVrccr285e38T7yZf8NsPSfzSNQ7dBKO7uNQOfbzFtyJFpgPpvxh9iX\/fvkz7vMJAKtswDrkFGHAKh8Ts2FVRQt1F+kzzVwkC0ZmUOYDbkfnPAwmrEPORzvjcTbmdnRBGXIm5YqzuCKPkcL0Dp0CHVacCqtKZUOPuAXu8wkP+ZRhXGMOg3INwONgwmIw3urh2L\/EMDNygzIbcDc4ZxGG5F7gGIus+h5FNujoMpXPnXIcyTByLzkv5rxa3XK5\/sg65Fh9YUogsg55FQDyCeNyWdfk94x5eNohW4acx3zMMhsyLlcEIubOsFxzs7rjav2RDMct0zt0IrQ7NilGIDItF1yt77nPZyyzYfUZ9ypwDM+Y5xMmcUV4Yd4RoA4aA1ZhSPmsezRa9d+6LB64LB8Bq+5q+XP835T\/d5pxJCXgFph4wfX6nm9G1yyy0aafY5kN+dPomrvBjNerW4LF\/RcyAQTjfjDlw\/CckkDmcfOouZPHklFcM\/KSVcj1\/pwQVVUSYgTAGcc158WcYVxvrnYMHlmGAe+HF9wPZhAC4YXxDu5ggQ+jC74ZX7HKBtXH6v\/SyNfM4oIBEQ9hs2lOToN2x6bEwNwYEpnGFblHIrbpsXCMIuSssiFFNgALPA35VjOXVdUULHCfT7kdnFNYTiDiVnWSnhVzvljdMolr3LKjjiKUz4eWKgmx+l8jLzgrF4zjirAVEAJO8MgqDHjIJxQhw7y7qhJwzKoqzO3gjMKyuuRb9X6cFXNeLz8wjUs81IFDGY6ToU1uCakbxRnGNZfFAxfFY12OdRzbBImHbMxtPmNteRUgOr6XUX3NYxjzMRtTWNh8zDEmccV18cC4Xg5JGpTjOGGhnnVcFHPOygV3+ZRY\/8EHeMxH3A1mTMslwWGTCNmoNsSVIWedDShDXn2lbw4VrAJH+cDYC8r6Nnu9Padj3zEbOo\/jhHnICGZclHMuiwcesnG11MBx4C6f8j\/DSwbLb8mqfa47X2\/urMKA28EZizAkeGQ7shjO2NfM4ooBkdJyBY0Toz6OJGVk5lzEOeflvEpqYpiXgHGbnfFuUHBdPPD83OKmdDvPh7zzKz7mU\/Aq3+EYAWcY1wxjsXMEoZwWJUeTVBVmJ75m6lXLeTTD6qXGOmTMsyErGxA70l0BZxGGfDPIuc\/Gm8ASzRjEklfre66KOSFUYUbvzelRH0eKLJBhTL1gGlfPliNVZcWBx2zEIhvWKY4q2WFA5lCEAQ9ZxmMY1l9WbaIbeMGb9R035UPVNaI285N0VB+HDis+LU3D10VcclPOmcUVH32yqZ8EnNIy7gZTVk0PBoBX+Q0zZxlybrMp8zDYOvXLyD1yHedc+pIsGBAIKtKdnH27YzXSJ6wpkgwpOY9LLss5Iy82c47gztoy3ucz7rJplbuoS7VuRklgZTmLkNdHDVaiBXIil8UjF+ViU56VdGipcuos4F6VZa\/LR97FJbdhgtPMOAIPNgbYWqpU\/16EAbDb+9E8l3vJuS+Z+YplGNSdqXJqlBxNVH3EMGMvuSkemZZrPmTT6pN1MCjrP\/RNf0czg1haFTioqyiN3CNDLxkSn87gUNg4SUeVY5XjOD3N2eMji5yxYkhZLyt2W9C7NKd4NQGlmVWcxSWvykeG5niWE6xq\/JLTc7ABTIHjNDUziaE5M9aMKHjptK\/dr919zs3AnevykbflR2aUEDLMwr7jjuUzp+Roopri6shLrss5F3FB7uV3\/l4A53HJq\/KBoRebzW6SFgWOBFTJzMiZr7gqF5zFFZlX96300VzDNPMVN3HOyMt6ISSpUXI0EV53WVz4kqs4Zx4GrMg5dtlSfY\/qvZjFFVdxyZDIyjLNN06YttUnLtbZjsu45FVcMKjvPukzWzCc3CMjIkPKvUlVOX3q40iFVftWZr7mLC4JxM21kMeIGAMvufIFM1\/jVu2x1bty2o7aqxJCIMsyVVVOkGFkGBNKphQEP77b06k2ts3imrfFPTe+2LwjajM\/bU080JmjCQvAOQVXvmTsZd0NutvT0a3anzLykjf+yJUv6zNKgxq\/Tpw6R5NXHVY884JXvuDKl\/yJKU9N5vs5VXfpgJIbX3DBevOOKHCcNh3kI3V61JgQuWbBma+5t2G1F+XArCNijIi8qgPH2oL2pyRAMw4BIFrGkMjrOOc8LPlYB45DyxXDGRCZUjIiUlimsJGAo2Yc2w\/K6anmFZGhRa59xZkXAEQg2\/M1TTiZecG5F2RWBR9dg5AGzThkc3zPAJhZwZDm8OH94x0xMpwbX\/Ajf2BIJIZQH0oop06BQzaGOBe+5ow1GZHyhSAQMXKcV3HB2\/jImIibqimpUOeoAHUjF9VS5VVcMvVic11Clyb\/ccGKG6\/uiI0HU6ly6lRVSVAARkQuWXHlS+aWsSZ03ua2aVVnxWtbMqpnKHpD0qClimxUN6YEzm3Naxa8Z8SSrHPviQMZzoySM0qCPZ0YJqdPfRyy4XXH5wUFNywZenP7\/G5Z1oGcyMQLRs0xgajpKyWaccjGdiPYGSUZvrlxpRl5p1qmTCn40udcUBCtWc7o\/UiFZhyyw4ApJeesGVrXEqXanzLzgp\/wyDUrzKwOG3o\/UqEZh2w0d7+eU\/LGVlywJq832W9ve4sYEyt5w5ILCpr5iAJHOrStXnYYMKLggpJXrDijZL5ZiDTXJsCYki9syYWVNP2lejvSoW31ssOASMYA55WvuGTFgjElVWBoZhxDnGsrmBF5JD+4k1ZOi3IcsqNajhhDqANHwTueGr6Mqgw7MCc3yJTbSJJyHNISCYyJ\/DgsuPYVcw88kpPhjCj5OQ\/8g31kYs4a7YZN0cEZx0sPyWmKGGMif2FLfhwXXPmavG4\/v2HNP2fv+Sf7lgGRdZ3f0JuRlqNmHJKeahMb\/K09kIevWdYJ0hkFf8c95xRURxsraMgTBY7EFXU4+LHN+ak97nwuYjxopiEdlBwVoKqkNIf5NH0cavYSJUflRRFj1fFxvQlpUzlWRHo7unO0+SEi0sQDlWNF5Gjq4xCR3o5aqihwiMg27Y4Vkd6yLNNSRUT6UTlWRHrbFw+0JhGR3hQ4RKQ35ThEZC\/1cYhIb+rjEJHejj7IR4FDRBoqx4pIbzqPQ0R6O2rGoW31IrLN3bWtXkT6UVVFRHpTjkNEelNVRUR668pvgPaqiMh3oMAhIr3t5Dh0ApiIPPdiOVY5DhF5TrtjRaQ39XGISG\/q4xCR3rRUEZHetFQRkd6O3h3b7IYTEQE644GWKiKyl\/aqiEhvupBJRD4ZBQ4R6U05DhHZS30cItLbUX0cTdlFgUNE4CkuqKoiIr1or4qI9KYch4j0pr0qIvKdaMYhIr0cnHE0PytwiEjjqBzH9s8iIkflOPY9KCJp0iY3EfkkFDhEpLfWhUzurqWKiABs4sHBlvPm1yIioKqKiHwHR++OFRHZ9jx4KFKISG+dSxURkZd0JkdFRLYdvJBJROS5o6oqIiIvae2OFRF5TjMOEfk\/U1JDRHr7XzRv8Gl+IQbSAAAAAElFTkSuQmCC","width":118}
%---
%[text:image:35d9]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:8864]
%   data: {"label":"Start interaction","run":"Section"}
%---
%[text:image:4c13]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:850c]
%   data: {"align":"bottom","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE0AAABMCAYAAAAoVToVAAAEVElEQVR42u2c4ZG0IAyGrwRLoARLoIQtwQ7WEizBEiyBEiiBEiiBDjydifM5jiCQBPU+fuTX3e7iIyRvEuBnnuefamlWIVRoFVqFVqEx2\/f7FYtJMFGh\/QPTLPZZbFhML2YXmy\/Mwv8O8Nnmz0ODGdQvZiIAxZqB7xR\/ChrMCk0Iymfrb3xeDQ1ghZadW0zBclv9Vxv4Lrlbzgo+G1rGn1dBWx8+MLPWBxpDgBJ\/Zwy8GE3xO+zQYCb4HkAyzuou8KKGR0IDJ29KwzoZRx8IGOIx0MDfuJJ+xSNhxotA4SheINWyOA5OldRQMAaXEGW726B5gHVMUAaP2Ux50hWH5gG22kQchQ2jruuKQQMfFhrMQATMFRDEkh0aREkX4XDFC4BljTXngWKXy4CIgvZELnCCM2zQAsL1zARC721OvgeIssCMG8ihwZKZOWcZwodSWUsNTQd8wlHUNi+FpsmgQXXBm5ocwHXEKl+CWJ4L2YcKmvUAaw6+zuXMsl29TRequwWrw2hogaUhDjPC5fgyT7S82yQWmm9pjMfZQlxKutNUNjTwV+hok\/n97qLAODMLYJELrb\/44hEJTQcKlmK3fI+JuYbcd2SE1udCMxQhOuH7XWiwAEpcRHT2LOHKQc\/M0JodOBWbRUTmvxTWpEL7cEPbgWszxK69S7Nho9pI2F9Yl94E\/ipKvsD\/F89Hc6TGpe8h6iBtArq9Ua6oVGi+IKCwXZ0CFVnWYBB6MJZW3EPFrNcw0CSR75oKPrCjSPSzoRE6ezbf42uc7Pa5yZyXdjc0TvU+eAKKOZE3rtTyFATQOEs+OtBSbBN86nT8OwYaRUtOcVdcPQ0ZEeEm1C49k1TQLAG0vgC04TBrmoiAZEL1Q5TkeHggmMFfbT6rS2gSydDOAYy4NS+QHGpz9gnuYrzQkQaTRlHuz+AMCAbbCTs8t8Im7IZi2ycsIcUsalvE+CwmYZcXIV4QJOsWbNoKjFCSclxV10S\/K6mLkCSVDoYNMBPyReYXIRP8Dxc4WRLYiT\/TXI0V8n0bEU3qrLZbpK8laawI7sES5qsDsfgWHM1isj4BUe1tIJzVimtbwn6XkGCCZkpAOwkAuG0JCQGB9DRcYtqF3a5qU1YOVyT7EDVdWHWZxwVIEmgZ6Y8m0mqopm5G05luU1\/GctEFJYch9JmCFFpiNNMFBK7G+NATOUO\/UTlxmWrCCHp2fHsi9pdJ481Vzo4znQn8bodN206AJW955Uio3feB10IEgCWXkTgkQf8SYGUPlF0MZHwgsPERRxcvDqiaJyxRzxFx973zkOyFj3OcZaNIeeQoS+EcB\/8bjxyxHKeNI8roZ7qO5PhRyXKOhQdqGOWIfdUVEye+JHQAbcJesLS74GnibADdcW2OjMggttZgf3b91+FasAEgmYgNMWx3gZTyM6VO0qkSF6fccWdaTwxQbSeQ\/4ub+nZLTsUWAva3YNXrDeudkBVatQoNb78ox6WFMDJfcAAAAABJRU5ErkJggg==","width":25}
%---
%[text:image:61a1]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[control:button:727d]
%   data: {"label":"Calculate Edge Strength","run":"Section"}
%---
%[control:dropdown:39a7]
%   data: {"defaultValue":"imread(\"LungA.jpg\"); disp((\"Image Source: Mikael Häggström, M.D.\"+newline+\"CC0, via Wikimedia Commons\"+newline+sprintf('<a href=\"https:\/\/commons.wikimedia.org\/wiki\/File:Normal_posteroanterior_(PA)_chest_radiograph_(X-ray).jpg\">X-Ray of Chest<\/a>')))","itemLabels":["imread(\"LungA.jpg\")","imread(\"LungB.jpg\")","imread(\"LungA.jpg\"); disp((\"Image Source: Mikael Häggström, M.D.\"+newline+\"CC0, via Wikimedia Commons\"+newline+sprintf('<a href=\"https:\/commons.wikimedia.org\/wiki\/File:Normal_posteroanterior_(PA)_chest_radiograph_(X-ray).jpg\">X-Ray of Chest<\/a>'))) "],"items":["imread(\"LungA.jpg\"); disp((\"Image Source: Mikael Häggström, M.D.\"+newline+\"CC0, via Wikimedia Commons\"+newline+sprintf('<a href=\"https:\/\/commons.wikimedia.org\/wiki\/File:Normal_posteroanterior_(PA)_chest_radiograph_(X-ray).jpg\">X-Ray of Chest<\/a>')))","imread(\"LungB.jpg\"); disp((\"Image Source: Mikael Häggström, M.D.\"+newline+\"Consent note: Written informed consent was obtained from the individual, including online publication.,\"+newline+\"CC0, via Wikimedia Commons\"+newline+sprintf('<a href=\"https:\/\/commons.wikimedia.org\/wiki\/File:chest_X-ray_in_influenza_and_Haemophilus_influenzae.jpg\">X-Ray of Chest<\/a>')))","imread(\"LungA.jpg\"); disp((\"Image Source: Mikael Häggström, M.D.\"+newline+\"CC0, via Wikimedia Commons\"+newline+sprintf('<a href=\"https:\/commons.wikimedia.org\/wiki\/File:Normal_posteroanterior_(PA)_chest_radiograph_(X-ray).jpg\">X-Ray of Chest<\/a>'))) "],"label":"X-ray image choice: ","run":"Section"}
%---
%[control:checkbox:96d6]
%   data: {"defaultValue":false,"label":"Adjust the range of intensities to be comparable? ","run":"Section"}
%---
%[control:button:185e]
%   data: {"label":"Compute and visualize","run":"Section"}
%---
%[text:image:279a]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:5801]
%   data: {"label":"Generate a problem","run":"Section"}
%---
%[control:editfield:1984]
%   data: {"defaultValue":"\"\"","label":"mySoln","run":"Section","valueType":"String"}
%---
%[control:button:78bc]
%   data: {"label":"Check my solution","run":"Section"}
%---
%[text:image:0e6f]
%   data: {"align":"middle","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAREAAAA8CAYAAABB0Y7SAAAIR0lEQVR42u2du6skRRTG759gamZmamQ8gX\/AwOaiodmCYLiaiWAwgYFg4Ji5giBqsCCosCAoIgbeYBHdgfUBF1ldfLIg7Xzj1KXu4Zx6dVVPP76Cj92ZO9PdVV31q\/Oorjnruu7M0p1rj6732u6126ubg85eeJuiqDTt9trutQ5xwoLHak7gIEQoqgpQVkkQ2Q+0zRzhQYhQVBVtghA5ui4dIUJRVEBbFSJzt0AIEYpqY5H4MZCOEKEoKkMrHyI7QoSiqNxg6wEixzRuR4hQFFWg9SKCqYQIRbULsi7KlSFEKKrB+pElAYQQoagGIkQoipoFRL5\/7snun7vn3V\/nn3W7558iRCiKEMkTAOIK\/v\/t048TIhRFiKTpl5uvdrLc\/\/ANQoSiCJG44LpYpYVbw5tOUTOCCFyWhxf3TIj8\/sWtWULkic0t9f1n3vm8e+mjby6F1+ykaZJtt3r9Y7bLEiDy4JObXawg4DoWiPidNEePvfzB4fvo2Lv7fxzq9dvfD7vr73915fiffndxpe54PWRnKK3fGAasbDtcFwf4zCHy82vXDzf73z8fBCGCeMlYIFJa3CDbfnn3yvsAySMvvjsaiJSWMQxYQmRhEPHjIH5WRitwd+YCkffOfyBECBFCpIYF4qwPrAkJxURaBFhPCRHfndE6OiFCiBAiEesDgVK\/XLx5I6mT1kz31hxkX\/\/06wEMMfnWhgusyvfGCJHU+rmYDyFCiDSDh+ayAAywRFJKTZem5iCrPchLIAIgucFsZX3GUr9cAU4+rPpApKR9APqasEypR+h7fc5fs58MChFkVrTAKaDy4yvPZpnMtbI0pxxk6NiylEIEmR3EVGTRsj5D1A8p1hQ3x3fn3PVqg0Z+zhXElVKsOJwbg0W+j7K5fUc9hn9+7XsH13p\/XRYINDfWugYE2UuuAe\/he6F+1LqfDAYRrAHRLBBABdZJqhXiuz6EyP+zo9XBtc42ZP206\/JnT63+ci2M9hnNzZKzstZ22uDxYaDVQWbQrKINQA0UsXqkAlkCIAaRlv1kMIhY8Q5YILlWSE2XZuoQSekY\/qw9ZP0w62oDyXVq2fnlIEoBiD+QfJDktIsFgpzza5ZWSZEQhQVSUuS9QNu26idNIQLrA\/BwroefiXHWBD4TWxtilXs3rk0usOpTvi9EtBkK14DBAGkDKccH1wYqjhlSykwOuGjv+9emQQav3cpdmR73AWVBBG0T+r60RuT58ff1W7cP16a1vfy+ZW3g3ljXINvQqkfoHst+1LqfNIEILAs\/8wJI4D0\/sIrVqXgtMzQ5xR1jSile\/+b0hYiME+C1Dyn8X85AObNMjRnQsjhis5\/WNjIAqK2zsdpOto01QENWlLQSEEsJ1V8buPIatLYIXYN2DA1GoX4ij9G3n1SDCKwNZFhC6zxkajY1pWsVwKnvFgFThYhm5mrP1mCmSQ26tYBIilsgXRFtcGlWDqwC6\/wpKd5Y+5cEj0Ptp12DZpGFrk+zEEL1GKKf9IYIXJScoCg+7y9z71vc8ZYGEe2mo0PK51i0TpoaOKvhzlizYWxwpXxGplz9tq0JEee+oC39uoasiNQ6hK4hBJjUY2h\/S+0ng0EE1kWu+wGXpjQOIgsAtsSYSG7Qr8TfrblOxAoQam5G6gDsu9gsBSL4TCir0xIisg5W9iYXIqmleP1IaQwkBoUWAKmxZmSq2ZmpQUSznLTnhcYEES3m4bdFa0skdZ1QK4gUB1f7ZGIst8bFQloApO8y+DlBRDNTQ1sRDAURLbhqZVXGAhEtqIlj+m2nWVc1IRILmNZ0Z\/r0k+rZGRksrR0DsQKsS4OIFlSsvWlRLYiEZnTLdJYxFC1bgE4uO34tiGiWk7SYWkMkJUMVO8YQ\/aRJitetQHVP2\/bNwjhQwOLA2hBIpoZLA6xThYg2u1vxBXQ8mN65Pm4NiGCga+lcee3y2LG9VnJdgRoDOPf+9YWIZg1pMA1ZLNqS+Nr9pPmKVcQrEA+J7RMSKviu9vi\/H4spDbBOecWq9n33DARmScxCsALcgMW\/OR1E63y5O5tZS99jS941+KCD4zM4vvZ9f4D1hYiWvnXPt6ANrViDX\/e+ELHaD\/XEeawFa\/IYVj9xbdm3nwz6AF6JSxP7uQg\/zlKygnXqy95zljMPsdjMHyyaKe3+hsEYWyyX4gZZA7gvRLQZPPcaakDkFMverTjVaLYCyFmhCjikZF7cw30lK1inDhHM2KnPiWirHVtCRHtC1z9\/7ElffNaaaeVx5cxZIztjZZT884asqRoQKc2waK5Kq34yOEQAhVSA5Oxg5rJD3AqgM03XIXc20+qmPekq66itXg3VDaDSTO9a60TQbtq5XexA\/s239GpBJHQdqGds+X1OW1YJuo5lV\/e+K1GX+rszzld2D5r1eZAqZRezIXc2w7ExCFA3uErVN9OJbEY09HmtQDXuq3sQMCcV3KqfnAQiiF2MASD88SpqCgK0rM2XNGvIWtk6uz1WrQf1hgQIIUKNXf4Ttn7mDfCwXJyT7yc71ODV1o4MDRBChBq7cjNU1hqQWULE34wIVonbb4QQoairMZDU9KwVZJ71787A8jgVPAgRakouDVwUazsFt+PbyS2QMfwWLyFCUek\/9dDk5x4IEUKEoggRQoSiCBFChKIIEUKEoqhiiOwIEYqiCrUDRLaECEVRhdoCImtChKKoQq3P8ADgklwa3nSKqufKgB8OIitChKKoTK0uIXIEyYYQoSgqURvHjkuIHEGyJUQoiooFU31uXIHIEiwSdgCKqmOBmBDxYiQ7QoSiqMv1IMcYSBJEPJisjy7OjhChqEWCY4s0bogT\/wFdspil9uJFjwAAAABJRU5ErkJggg==","width":91}
%---
%[text:image:1111]
%   data: {"align":"middle","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAiAAAABQCAYAAAAgNM70AAAQD0lEQVR42u2dv6tkSRWA508wNXuZ6YuMDfwDHmwuz9BsQTAcXyaCwQYGgsFqtisIogYLgg4sCIrIBE6wiO7CqguDrLP4kwVp+4yvhpo7dU6dU7fqdt3ur+BjZ2f69bt9u358depU3QeHw+GBh\/de++z1kbsjj44c4P88+NpbAAAAl86jI3dHrr1e4RGP2yOPkQ0EBAAAwMHjI7fNAnIcXK+IdiAgAAAAK6IiVyEBOQ6sN0eeIRgICAAAwAqeHblxCcj9kgtygYAAAAD04tYUkPvIB2KBgAAAAPTmpigg9zkfLLsgIAAAAKOWY65KAkLCKQICAAAwNDH1JQEh7wMBAQAA2DIfJAkI53wgIAAAAJucE\/JcQO5POEUmEBAAAICtuH5wf7w6MoGAAAAAbMUdyacICAAAwObJqA+QCAQEAABgc5AIBAQAAAABQUAAAAAQkFn58ze\/fPjXk18e\/v7rdw4ffPWLCAgAAAACMpaPvv36IS\/\/\/ecnhz9+5fMICAAAAAIyBhGNUpFoCAICAACAgAzh459+96CVp28+REAAAAAQkP7RD1lu0coplmKoRAAAAGcuILLMUiuf\/OJtBAQAAAAB6cNf3\/7WwVu2jIJQiS6L6zfeOdz97HeH2x\/86vCZr\/+QewJwwXzhOz8vjkGP\/vC0+HrpM6TvkD5E+hIEZAfy8eHD1w6RIrJyTgJy9Y2fPK+wUqk\/+PgfLz7ns39\/+vzv3nj3vecNgQ5hLI\/\/8rdX6tqM9z3VFw3pAFvf23pfoeU9U4e8xCN4tetZg9zHfKApvWb099\/z92r3uVZXth4o5b6\/\/uPfmv3dzfff3Z2AlF4rfQoCMjG\/\/9LnXuR9fPr0Q5eAyOvOQUCkIUpF9hZprLM0zEuZ6fzoyZ92c615aYneSN2qleh7ynVoRQah2s+PLPkgL4NxqbRKlxet\/Wsz7Jb38hQZ\/L\/3m\/dfkrIR\/Z38jkh\/t0amtxYQ7bNddJ89u4D85\/0nL74oOXTMXTk3Opxs1BcjDau1SEVHGvqiDUDSMe9RQFo6bpGt3gJi1XPP7PCcBUQGZKtEZWCNgKytO556IG2ppUi9PNVyaERAtM83WmIRkEYkoTQ\/5yOXkVqR7bp7FZA18oGEbDsYSDh4jwISDf1akYo1AlJa1spLLfx\/zgKi\/c7W391LQHpLSI\/+TurRKSQkIiDa9zkyqoSANC67LHe8LE8\/rRVZttmjgHjC3N4y4+C4Z+R+5rMYmXnN2Hl4BCTa8XkHiZ4zfE8dPmcByfMftCWIUwmItIMeuSHeujrrpCsiIFLf8yii3MOL76NnPGZ9edaHREKsA8i0Is+L2ZOAiMFbYUipvDIQSEWW14qsSAX2dqLQr9OZedbi7dQ9ORaR5ZeogNTqrmeJSz6rhbbuLn9f+9l8Rr21gHi\/w0j71gSkdC+kb5HPVuuPRkqWRDVSEqx8F3JdtTqzdT5FdBdM6ufplycSENk2K4JROmQsHS5mHUB2ymWYrUKult1bs9OWZDU4z4TZ1mUY7\/JLVEBqM\/weg0ovcdhaQLzJmJFZvyYg1mcQ0baWyUYtvVifS+qDJkbRqNApBAQmEhBJFrXkQqIYkTNAtt4N0\/PL0BqVp5OxGnMpVFqa8eWz+jQDkoYkMx3585qBIJ2fITOY\/D2952nUrjffXy\/v33sLYZq1LGm5t2mbYboXva81Etb2RHLkWnsLSGSpcc1Me68C4k3IjCRBtwhIrW8ZEf3wfN9WHS\/1U5422dJ\/RJdgapE263Wl\/lTGBiH1zy15MCmant4vbXXe5KySmeVDll7ybbgtZfRumC1yP7yVygqxetbO09kH1ownutVXGrFnpisV3vqc2vXKz9TCsrX37j3TmfVaS4OaZw26lijaMiBpM3xtqaf1nuxRQLQBX7tn3oTQVgGxcnXWTEjW5iZZdcjbJj35TVab7JGEupQL7XVyzwQrl0fauLd\/ls8k97Amu0OPd5jhfI9SkR0v8prW6MdWyzCjQ66R2Z\/WkEphSS0k75151To9qdzevIH8OjXj1hq5d3BcmyW\/VkDk+z31tZZEsBay1gYf7bOsyXWS+qKJeCRfZe8CUmo3KdKh3beRAmLJQu\/IVGR3llZXSlEhrU16l7q0NrmlgETOSPF8p9Ftz0OSfGd8rkvK+2jN\/dhyGWb0gUORjteaqSwbT+9dAr0y7qVRlBp6j7JmsFgrIDNcq5ZUaIVZS8svMuBp3+8aUU5SW7rG1hMj9yYgWhtOkqENQp6oQauA9JCFXtfizU1a1ulRbXJLAYkWrU60yMcwCZnx2S5y9Lq8JnLw2Kl2w\/T6InrtYvG+T4+izZ7XNiBvCLVFbvYiICOuNa3xRpZhSpEOEYU1AqL9bBJPbZBtWY\/em4Bo+TZJztZEiFoGfastrzkLRIugRUP92vLuiP6u1CZnFhCtXXuTv3uNSVMIiORiiHTkORkiGssIh2zDlX8TaehVRj4hd7SARDtdrWFHGmR61kRKTrKWDpYdhrWVWN4nJUrVttQt7d17vfJf63pbG08vAYlca2sCmCUgpX\/TRLIUek8RqlYBqc3wrUG25cyEvQmINjjkUcHIZMAjIPKz8m9LaltkZ5hweaVqVP+xtYCk4+elHQnWjqDSd2S9d3qmWK3f77rDZ3Sex9M3H770DBcRjiQZ6TUp0pEeItdj6WVZ5PfsUUB6hTaXohCZ1UiF1CrjMiRnhWtLSyva65eDTfR6tc6zddbWQ0Ci19qa+GUJiDbIlX5XSRDT990qINr3vbw3pU61JSq0JwHRci2WEUEtt6omrL0OIutx9PksArK2\/9hSQOSaSvfd2sDgFdyS3Fv9frdzkEYMyhK9qC2fpB0u+c+Unv\/Sq+TSc4kC4mmQ1qzGm+CqVVhr4PdcS\/R6tTB+64CxVkCsa9UGlN7XmjoZSyxqnVUSFa0j6zHD7\/ngrj0JiHeXi7VLZrSASD3uEYKfQUB69B9bCohV1zzjhya4lthrda01KXyYgKTDxLxPrJUiorHcJps\/\/6Vnkd+FgNR3lbQkfNXetzZz9cymo9fbe8BYKyAzXau2tFLrrHLZbKmvkScKa7O66JkgexIQLZS+lDOtLba2s575BXsSkB5tchYB8UwItPwiS1yHPwOrx9Hp1o6WSIKoLNeMLCJJexOQaKhTa5CeHJDa2l7tva3zJ0przAmt40VAxl1rKVKVRxdKUZK802kRkOg5Ft4B+RwEJCpcWtTMijRGc0Cstrn2syMgfQXEM4nTcu6s71973255IGsH4JZntKSScj6SyIwuI84EmW0XjNZhnFJAWkt+zQhI32stzYbymVBtu26LgESFQhOWSPh3LwISFQotNG5FiFp2wVh5AGtyAUYLyLKOICB9I2DTCEjK34gmjeY7U7aQj5QAO6uAaJ1zdM3b27ARkMsWEC20mjLgW3JyLAGpPa8osgsjsgNjDwJiLW\/KZy3dmxYpaD17w0rKbM0F6HHu0cj+DgHZkYCk3SzepZhTyEdpyWcPB5FF1tosAVg7SCIg5yUg2qxbRKEUefDMKC0BiZ6KWyveLcp7EJDIs3Y8RRvE1xz+pYXvW5\/TYz2luMfBi55t\/AjIGQmIN48j342ytXxIkd05MwqItfVq7ePNewySVgVOg4HWGFPmfJTa2QcISPwo9lpUQgaUUjQu79AjolsbKEYnQe5BQCLP2vEUrc9YIyCaJLUORFpELLLVWrsm76MnLk1ALOmL9s3dHlI36tCx5W4YWf7YMuHUKj2TUUefAeBdF7UOACvNiKIN0rMLxnrNiHMDEJB1kTCrzliz3KiA9J7hRwaq2QXEave9I0QjIiCtAmJJqfesnsiZFgiI\/YyZoU+8PcVBZLIkk7bULrfbjtpqm4osBUmCq3YWSZ78OouA1LLUa8ZpPaiotCYcjbZoM5blenykUyjtBNBEBQF5a8hSnOcBV97DlzQBWXv0s1Y8+VGzC0jt6citpTSojMgBWTN4actyIpdb9HeXJiCW7Nbut9SBbmd\/bHkUu0Q90oFj+amno5ZXltGN0u\/smYza88uwOnatUVrHYlsdROT11kx5KRatz45IHYp2YioCMkZArFMUtehV5P2tTk9+tyfcq9Vvz+A3u4Bo7SodD15Du65ShGjELpg1z4Np6e9q8qG1MwTEngzId2w9vC7Vge5Pf97yAXQiB\/L8F8n9iBxY5im1k06X+Sa9Tkbd4lHcy4oig75UhNo+fe3JsrVnI+RrgmK9keeV1ML68vmk00rvL39evn9JQhCQMQJiDYLaIN8jwhLZyWLtoKkt7Y0WkNoZCiU88uddsrSWPZdy0HIOSG0ZbO3Sai0ClPd3Wn5Sfj3aIIqA1NuS3D+51\/nEQP5\/ec\/XSOc0T8PtuRTjlQlZBkrbhUWAZhQQK9zZM0Tdo2gN2KrkrUmGCMg4AbEGgVIdirx\/JC+pxyC7tYC0lJqcRfMqtEnLMnen5y6IXrPhWoQlUqKPe7hEAelVD6Z+FkyENaeotkQy8gRZicbMJiDLkNeIxthDQKzZhje3wJr1EAHZTkCiz4jwvr81w492YNogW4ukzCogllRF19ot4c\/vc08B6Zm42ENCWvq7SxWQtff7bCIgaVmmteTniUQTZCUxVuRnRgFJlaTl7ARPwqr1cCZPxfQkiaWO0bPLYtlwyQHZVkC0tWEtcdj7\/q3SsGaQ3YuAtH6eaIQol5keAiLteUQyonyGloRcqbeeZGQEpM\/40lU+ZhCQ1qWYted5pIPTZhWQvIJ7Kop06pHKYQ3+Vkcl\/xbZAy6dqcyWaiIiHckpQqgIiL5VVvuePe\/fc4Zfez9rh9WsAqKJfouceWWvVUCkbabcrbU5H56664meyjXJd+K9HgREv9+eeiHfSbdll9kERJZFIkWiF2lnzanZar+0NLSU9Z4j9t9SMWqNRgYfGSjS75E\/r62AKak1v37p1IZUbICOSB1tOUyvxKk+g7Rp7zXO0CZL\/UVrfwf1+i33djm+LA+EPEsBEUQq9iYfWwpIb3okvwEAAOxeQDwno84mHwgIAADAzgVExMIqsn225xHqCAgCAgAACIiZjCrykR\/ljoAgIAAAgIAM3ZIrO1VmW3ZBQAAAAM5IQPKDySTfo9dx6QgIAgIAAAhINQoyY64HAgIAAHDGArI39vrFl\/b+Rw4YAwAAQEAQEAAAAAQEAQEAAAAEBAEBAABAQBAQAAAABASRQEAAAAAQEAQEAADg\/AXkESKBgAAAAGzIIxGQO0QCAQEAANiQOxGQa0QCAQEAANiQ6weHw\/NlmMfIBAICAACwAY\/FPZKA3CITCAgAAMAG3LwQkHsJIRkVAQEAABiafJq8IxeQqyPPkAoEBAAAYADPjly9IiD3EnKDVCAgAAAAo5ZeigJCPggCAgAAMIDbpW+8IiBZJITlGAQEAABg7bLLTck1igKS5YSQmIqAAAAANCWc5jkfbgFZLMlwTggCAgAA4DrnQ4t6hAQkE5Hr+2PbiYogIAAAAMtox92Ra69X\/A+Gkaju8c43fQAAAABJRU5ErkJggg==","width":136}
%---
%[text:image:7246]
%   data: {"align":"middle","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAREAAAA8CAYAAABB0Y7SAAAIR0lEQVR42u2du6skRRTG759gamZmamQ8gX\/AwOaiodmCYLiaiWAwgYFg4Ji5giBqsCCosCAoIgbeYBHdgfUBF1ldfLIg7Xzj1KXu4Zx6dVVPP76Cj92ZO9PdVV31q\/Oorjnruu7M0p1rj6732u6126ubg85eeJuiqDTt9trutQ5xwoLHak7gIEQoqgpQVkkQ2Q+0zRzhQYhQVBVtghA5ui4dIUJRVEBbFSJzt0AIEYpqY5H4MZCOEKEoKkMrHyI7QoSiqNxg6wEixzRuR4hQFFWg9SKCqYQIRbULsi7KlSFEKKrB+pElAYQQoagGIkQoipoFRL5\/7snun7vn3V\/nn3W7558iRCiKEMkTAOIK\/v\/t048TIhRFiKTpl5uvdrLc\/\/ANQoSiCJG44LpYpYVbw5tOUTOCCFyWhxf3TIj8\/sWtWULkic0t9f1n3vm8e+mjby6F1+ykaZJtt3r9Y7bLEiDy4JObXawg4DoWiPidNEePvfzB4fvo2Lv7fxzq9dvfD7vr73915fiffndxpe54PWRnKK3fGAasbDtcFwf4zCHy82vXDzf73z8fBCGCeMlYIFJa3CDbfnn3yvsAySMvvjsaiJSWMQxYQmRhEPHjIH5WRitwd+YCkffOfyBECBFCpIYF4qwPrAkJxURaBFhPCRHfndE6OiFCiBAiEesDgVK\/XLx5I6mT1kz31hxkX\/\/06wEMMfnWhgusyvfGCJHU+rmYDyFCiDSDh+ayAAywRFJKTZem5iCrPchLIAIgucFsZX3GUr9cAU4+rPpApKR9APqasEypR+h7fc5fs58MChFkVrTAKaDy4yvPZpnMtbI0pxxk6NiylEIEmR3EVGTRsj5D1A8p1hQ3x3fn3PVqg0Z+zhXElVKsOJwbg0W+j7K5fUc9hn9+7XsH13p\/XRYINDfWugYE2UuuAe\/he6F+1LqfDAYRrAHRLBBABdZJqhXiuz6EyP+zo9XBtc42ZP206\/JnT63+ci2M9hnNzZKzstZ22uDxYaDVQWbQrKINQA0UsXqkAlkCIAaRlv1kMIhY8Q5YILlWSE2XZuoQSekY\/qw9ZP0w62oDyXVq2fnlIEoBiD+QfJDktIsFgpzza5ZWSZEQhQVSUuS9QNu26idNIQLrA\/BwroefiXHWBD4TWxtilXs3rk0usOpTvi9EtBkK14DBAGkDKccH1wYqjhlSykwOuGjv+9emQQav3cpdmR73AWVBBG0T+r60RuT58ff1W7cP16a1vfy+ZW3g3ljXINvQqkfoHst+1LqfNIEILAs\/8wJI4D0\/sIrVqXgtMzQ5xR1jSile\/+b0hYiME+C1Dyn8X85AObNMjRnQsjhis5\/WNjIAqK2zsdpOto01QENWlLQSEEsJ1V8buPIatLYIXYN2DA1GoX4ij9G3n1SDCKwNZFhC6zxkajY1pWsVwKnvFgFThYhm5mrP1mCmSQ26tYBIilsgXRFtcGlWDqwC6\/wpKd5Y+5cEj0Ptp12DZpGFrk+zEEL1GKKf9IYIXJScoCg+7y9z71vc8ZYGEe2mo0PK51i0TpoaOKvhzlizYWxwpXxGplz9tq0JEee+oC39uoasiNQ6hK4hBJjUY2h\/S+0ng0EE1kWu+wGXpjQOIgsAtsSYSG7Qr8TfrblOxAoQam5G6gDsu9gsBSL4TCir0xIisg5W9iYXIqmleP1IaQwkBoUWAKmxZmSq2ZmpQUSznLTnhcYEES3m4bdFa0skdZ1QK4gUB1f7ZGIst8bFQloApO8y+DlBRDNTQ1sRDAURLbhqZVXGAhEtqIlj+m2nWVc1IRILmNZ0Z\/r0k+rZGRksrR0DsQKsS4OIFlSsvWlRLYiEZnTLdJYxFC1bgE4uO34tiGiWk7SYWkMkJUMVO8YQ\/aRJitetQHVP2\/bNwjhQwOLA2hBIpoZLA6xThYg2u1vxBXQ8mN65Pm4NiGCga+lcee3y2LG9VnJdgRoDOPf+9YWIZg1pMA1ZLNqS+Nr9pPmKVcQrEA+J7RMSKviu9vi\/H4spDbBOecWq9n33DARmScxCsALcgMW\/OR1E63y5O5tZS99jS941+KCD4zM4vvZ9f4D1hYiWvnXPt6ANrViDX\/e+ELHaD\/XEeawFa\/IYVj9xbdm3nwz6AF6JSxP7uQg\/zlKygnXqy95zljMPsdjMHyyaKe3+hsEYWyyX4gZZA7gvRLQZPPcaakDkFMverTjVaLYCyFmhCjikZF7cw30lK1inDhHM2KnPiWirHVtCRHtC1z9\/7ElffNaaaeVx5cxZIztjZZT884asqRoQKc2waK5Kq34yOEQAhVSA5Oxg5rJD3AqgM03XIXc20+qmPekq66itXg3VDaDSTO9a60TQbtq5XexA\/s239GpBJHQdqGds+X1OW1YJuo5lV\/e+K1GX+rszzld2D5r1eZAqZRezIXc2w7ExCFA3uErVN9OJbEY09HmtQDXuq3sQMCcV3KqfnAQiiF2MASD88SpqCgK0rM2XNGvIWtk6uz1WrQf1hgQIIUKNXf4Ttn7mDfCwXJyT7yc71ODV1o4MDRBChBq7cjNU1hqQWULE34wIVonbb4QQoairMZDU9KwVZJ71787A8jgVPAgRakouDVwUazsFt+PbyS2QMfwWLyFCUek\/9dDk5x4IEUKEoggRQoSiCBFChKIIEUKEoqhiiOwIEYqiCrUDRLaECEVRhdoCImtChKKoQq3P8ADgklwa3nSKqufKgB8OIitChKKoTK0uIXIEyYYQoSgqURvHjkuIHEGyJUQoiooFU31uXIHIEiwSdgCKqmOBmBDxYiQ7QoSiqMv1IMcYSBJEPJisjy7OjhChqEWCY4s0bogT\/wFdspil9uJFjwAAAABJRU5ErkJggg==","width":91}
%---
%[text:image:9387]
%   data: {"align":"middle","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAiAAAABQCAYAAAAgNM70AAAQD0lEQVR42u2dv6tkSRWA508wNXuZ6YuMDfwDHmwuz9BsQTAcXyaCwQYGgsFqtisIogYLgg4sCIrIBE6wiO7CqguDrLP4kwVp+4yvhpo7dU6dU7fqdt3ur+BjZ2f69bt9u358depU3QeHw+GBh\/de++z1kbsjj44c4P88+NpbAAAAl86jI3dHrr1e4RGP2yOPkQ0EBAAAwMHjI7fNAnIcXK+IdiAgAAAAK6IiVyEBOQ6sN0eeIRgICAAAwAqeHblxCcj9kgtygYAAAAD04tYUkPvIB2KBgAAAAPTmpigg9zkfLLsgIAAAAKOWY65KAkLCKQICAAAwNDH1JQEh7wMBAQAA2DIfJAkI53wgIAAAAJucE\/JcQO5POEUmEBAAAICtuH5wf7w6MoGAAAAAbMUdyacICAAAwObJqA+QCAQEAABgc5AIBAQAAAABQUAAAAAQkFn58ze\/fPjXk18e\/v7rdw4ffPWLCAgAAAACMpaPvv36IS\/\/\/ecnhz9+5fMICAAAAAIyBhGNUpFoCAICAACAgAzh459+96CVp28+REAAAAAQkP7RD1lu0coplmKoRAAAAGcuILLMUiuf\/OJtBAQAAAAB6cNf3\/7WwVu2jIJQiS6L6zfeOdz97HeH2x\/86vCZr\/+QewJwwXzhOz8vjkGP\/vC0+HrpM6TvkD5E+hIEZAfy8eHD1w6RIrJyTgJy9Y2fPK+wUqk\/+PgfLz7ns39\/+vzv3nj3vecNgQ5hLI\/\/8rdX6tqM9z3VFw3pAFvf23pfoeU9U4e8xCN4tetZg9zHfKApvWb099\/z92r3uVZXth4o5b6\/\/uPfmv3dzfff3Z2AlF4rfQoCMjG\/\/9LnXuR9fPr0Q5eAyOvOQUCkIUpF9hZprLM0zEuZ6fzoyZ92c615aYneSN2qleh7ynVoRQah2s+PLPkgL4NxqbRKlxet\/Wsz7Jb38hQZ\/L\/3m\/dfkrIR\/Z38jkh\/t0amtxYQ7bNddJ89u4D85\/0nL74oOXTMXTk3Opxs1BcjDau1SEVHGvqiDUDSMe9RQFo6bpGt3gJi1XPP7PCcBUQGZKtEZWCNgKytO556IG2ppUi9PNVyaERAtM83WmIRkEYkoTQ\/5yOXkVqR7bp7FZA18oGEbDsYSDh4jwISDf1akYo1AlJa1spLLfx\/zgKi\/c7W391LQHpLSI\/+TurRKSQkIiDa9zkyqoSANC67LHe8LE8\/rRVZttmjgHjC3N4y4+C4Z+R+5rMYmXnN2Hl4BCTa8XkHiZ4zfE8dPmcByfMftCWIUwmItIMeuSHeujrrpCsiIFLf8yii3MOL76NnPGZ9edaHREKsA8i0Is+L2ZOAiMFbYUipvDIQSEWW14qsSAX2dqLQr9OZedbi7dQ9ORaR5ZeogNTqrmeJSz6rhbbuLn9f+9l8Rr21gHi\/w0j71gSkdC+kb5HPVuuPRkqWRDVSEqx8F3JdtTqzdT5FdBdM6ufplycSENk2K4JROmQsHS5mHUB2ymWYrUKult1bs9OWZDU4z4TZ1mUY7\/JLVEBqM\/weg0ovcdhaQLzJmJFZvyYg1mcQ0baWyUYtvVifS+qDJkbRqNApBAQmEhBJFrXkQqIYkTNAtt4N0\/PL0BqVp5OxGnMpVFqa8eWz+jQDkoYkMx3585qBIJ2fITOY\/D2952nUrjffXy\/v33sLYZq1LGm5t2mbYboXva81Etb2RHLkWnsLSGSpcc1Me68C4k3IjCRBtwhIrW8ZEf3wfN9WHS\/1U5422dJ\/RJdgapE263Wl\/lTGBiH1zy15MCmant4vbXXe5KySmeVDll7ybbgtZfRumC1yP7yVygqxetbO09kH1ownutVXGrFnpisV3vqc2vXKz9TCsrX37j3TmfVaS4OaZw26lijaMiBpM3xtqaf1nuxRQLQBX7tn3oTQVgGxcnXWTEjW5iZZdcjbJj35TVab7JGEupQL7XVyzwQrl0fauLd\/ls8k97Amu0OPd5jhfI9SkR0v8prW6MdWyzCjQ66R2Z\/WkEphSS0k75151To9qdzevIH8OjXj1hq5d3BcmyW\/VkDk+z31tZZEsBay1gYf7bOsyXWS+qKJeCRfZe8CUmo3KdKh3beRAmLJQu\/IVGR3llZXSlEhrU16l7q0NrmlgETOSPF8p9Ftz0OSfGd8rkvK+2jN\/dhyGWb0gUORjteaqSwbT+9dAr0y7qVRlBp6j7JmsFgrIDNcq5ZUaIVZS8svMuBp3+8aUU5SW7rG1hMj9yYgWhtOkqENQp6oQauA9JCFXtfizU1a1ulRbXJLAYkWrU60yMcwCZnx2S5y9Lq8JnLw2Kl2w\/T6InrtYvG+T4+izZ7XNiBvCLVFbvYiICOuNa3xRpZhSpEOEYU1AqL9bBJPbZBtWY\/em4Bo+TZJztZEiFoGfastrzkLRIugRUP92vLuiP6u1CZnFhCtXXuTv3uNSVMIiORiiHTkORkiGssIh2zDlX8TaehVRj4hd7SARDtdrWFHGmR61kRKTrKWDpYdhrWVWN4nJUrVttQt7d17vfJf63pbG08vAYlca2sCmCUgpX\/TRLIUek8RqlYBqc3wrUG25cyEvQmINjjkUcHIZMAjIPKz8m9LaltkZ5hweaVqVP+xtYCk4+elHQnWjqDSd2S9d3qmWK3f77rDZ3Sex9M3H770DBcRjiQZ6TUp0pEeItdj6WVZ5PfsUUB6hTaXohCZ1UiF1CrjMiRnhWtLSyva65eDTfR6tc6zddbWQ0Ci19qa+GUJiDbIlX5XSRDT990qINr3vbw3pU61JSq0JwHRci2WEUEtt6omrL0OIutx9PksArK2\/9hSQOSaSvfd2sDgFdyS3Fv9frdzkEYMyhK9qC2fpB0u+c+Unv\/Sq+TSc4kC4mmQ1qzGm+CqVVhr4PdcS\/R6tTB+64CxVkCsa9UGlN7XmjoZSyxqnVUSFa0j6zHD7\/ngrj0JiHeXi7VLZrSASD3uEYKfQUB69B9bCohV1zzjhya4lthrda01KXyYgKTDxLxPrJUiorHcJps\/\/6Vnkd+FgNR3lbQkfNXetzZz9cymo9fbe8BYKyAzXau2tFLrrHLZbKmvkScKa7O66JkgexIQLZS+lDOtLba2s575BXsSkB5tchYB8UwItPwiS1yHPwOrx9Hp1o6WSIKoLNeMLCJJexOQaKhTa5CeHJDa2l7tva3zJ0przAmt40VAxl1rKVKVRxdKUZK802kRkOg5Ft4B+RwEJCpcWtTMijRGc0Cstrn2syMgfQXEM4nTcu6s71973255IGsH4JZntKSScj6SyIwuI84EmW0XjNZhnFJAWkt+zQhI32stzYbymVBtu26LgESFQhOWSPh3LwISFQotNG5FiFp2wVh5AGtyAUYLyLKOICB9I2DTCEjK34gmjeY7U7aQj5QAO6uAaJ1zdM3b27ARkMsWEC20mjLgW3JyLAGpPa8osgsjsgNjDwJiLW\/KZy3dmxYpaD17w0rKbM0F6HHu0cj+DgHZkYCk3SzepZhTyEdpyWcPB5FF1tosAVg7SCIg5yUg2qxbRKEUefDMKC0BiZ6KWyveLcp7EJDIs3Y8RRvE1xz+pYXvW5\/TYz2luMfBi55t\/AjIGQmIN48j342ytXxIkd05MwqItfVq7ePNewySVgVOg4HWGFPmfJTa2QcISPwo9lpUQgaUUjQu79AjolsbKEYnQe5BQCLP2vEUrc9YIyCaJLUORFpELLLVWrsm76MnLk1ALOmL9s3dHlI36tCx5W4YWf7YMuHUKj2TUUefAeBdF7UOACvNiKIN0rMLxnrNiHMDEJB1kTCrzliz3KiA9J7hRwaq2QXEave9I0QjIiCtAmJJqfesnsiZFgiI\/YyZoU+8PcVBZLIkk7bULrfbjtpqm4osBUmCq3YWSZ78OouA1LLUa8ZpPaiotCYcjbZoM5blenykUyjtBNBEBQF5a8hSnOcBV97DlzQBWXv0s1Y8+VGzC0jt6citpTSojMgBWTN4actyIpdb9HeXJiCW7Nbut9SBbmd\/bHkUu0Q90oFj+amno5ZXltGN0u\/smYza88uwOnatUVrHYlsdROT11kx5KRatz45IHYp2YioCMkZArFMUtehV5P2tTk9+tyfcq9Vvz+A3u4Bo7SodD15Du65ShGjELpg1z4Np6e9q8qG1MwTEngzId2w9vC7Vge5Pf97yAXQiB\/L8F8n9iBxY5im1k06X+Sa9Tkbd4lHcy4oig75UhNo+fe3JsrVnI+RrgmK9keeV1ML68vmk00rvL39evn9JQhCQMQJiDYLaIN8jwhLZyWLtoKkt7Y0WkNoZCiU88uddsrSWPZdy0HIOSG0ZbO3Sai0ClPd3Wn5Sfj3aIIqA1NuS3D+51\/nEQP5\/ec\/XSOc0T8PtuRTjlQlZBkrbhUWAZhQQK9zZM0Tdo2gN2KrkrUmGCMg4AbEGgVIdirx\/JC+pxyC7tYC0lJqcRfMqtEnLMnen5y6IXrPhWoQlUqKPe7hEAelVD6Z+FkyENaeotkQy8gRZicbMJiDLkNeIxthDQKzZhje3wJr1EAHZTkCiz4jwvr81w492YNogW4ukzCogllRF19ot4c\/vc08B6Zm42ENCWvq7SxWQtff7bCIgaVmmteTniUQTZCUxVuRnRgFJlaTl7ARPwqr1cCZPxfQkiaWO0bPLYtlwyQHZVkC0tWEtcdj7\/q3SsGaQ3YuAtH6eaIQol5keAiLteUQyonyGloRcqbeeZGQEpM\/40lU+ZhCQ1qWYted5pIPTZhWQvIJ7Kop06pHKYQ3+Vkcl\/xbZAy6dqcyWaiIiHckpQqgIiL5VVvuePe\/fc4Zfez9rh9WsAqKJfouceWWvVUCkbabcrbU5H56664meyjXJd+K9HgREv9+eeiHfSbdll9kERJZFIkWiF2lnzanZar+0NLSU9Z4j9t9SMWqNRgYfGSjS75E\/r62AKak1v37p1IZUbICOSB1tOUyvxKk+g7Rp7zXO0CZL\/UVrfwf1+i33djm+LA+EPEsBEUQq9iYfWwpIb3okvwEAAOxeQDwno84mHwgIAADAzgVExMIqsn225xHqCAgCAgAACIiZjCrykR\/ljoAgIAAAgIAM3ZIrO1VmW3ZBQAAAAM5IQPKDySTfo9dx6QgIAgIAAAhINQoyY64HAgIAAHDGArI39vrFl\/b+Rw4YAwAAQEAQEAAAAAQEAQEAAAAEBAEBAABAQBAQAAAABASRQEAAAAAQEAQEAADg\/AXkESKBgAAAAGzIIxGQO0QCAQEAANiQOxGQa0QCAQEAANiQ6weHw\/NlmMfIBAICAACwAY\/FPZKA3CITCAgAAMAG3LwQkHsJIRkVAQEAABiafJq8IxeQqyPPkAoEBAAAYADPjly9IiD3EnKDVCAgAAAAo5ZeigJCPggCAgAAMIDbpW+8IiBZJITlGAQEAABg7bLLTck1igKS5YSQmIqAAAAANCWc5jkfbgFZLMlwTggCAgAA4DrnQ4t6hAQkE5Hr+2PbiYogIAAAAMtox92Ra69X\/A+Gkaju8c43fQAAAABJRU5ErkJggg==","width":136}
%---
%[text:image:58c7]
%   data: {"align":"middle","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAREAAAA8CAYAAABB0Y7SAAAIR0lEQVR42u2du6skRRTG759gamZmamQ8gX\/AwOaiodmCYLiaiWAwgYFg4Ji5giBqsCCosCAoIgbeYBHdgfUBF1ldfLIg7Xzj1KXu4Zx6dVVPP76Cj92ZO9PdVV31q\/Oorjnruu7M0p1rj6732u6126ubg85eeJuiqDTt9trutQ5xwoLHak7gIEQoqgpQVkkQ2Q+0zRzhQYhQVBVtghA5ui4dIUJRVEBbFSJzt0AIEYpqY5H4MZCOEKEoKkMrHyI7QoSiqNxg6wEixzRuR4hQFFWg9SKCqYQIRbULsi7KlSFEKKrB+pElAYQQoagGIkQoipoFRL5\/7snun7vn3V\/nn3W7558iRCiKEMkTAOIK\/v\/t048TIhRFiKTpl5uvdrLc\/\/ANQoSiCJG44LpYpYVbw5tOUTOCCFyWhxf3TIj8\/sWtWULkic0t9f1n3vm8e+mjby6F1+ykaZJtt3r9Y7bLEiDy4JObXawg4DoWiPidNEePvfzB4fvo2Lv7fxzq9dvfD7vr73915fiffndxpe54PWRnKK3fGAasbDtcFwf4zCHy82vXDzf73z8fBCGCeMlYIFJa3CDbfnn3yvsAySMvvjsaiJSWMQxYQmRhEPHjIH5WRitwd+YCkffOfyBECBFCpIYF4qwPrAkJxURaBFhPCRHfndE6OiFCiBAiEesDgVK\/XLx5I6mT1kz31hxkX\/\/06wEMMfnWhgusyvfGCJHU+rmYDyFCiDSDh+ayAAywRFJKTZem5iCrPchLIAIgucFsZX3GUr9cAU4+rPpApKR9APqasEypR+h7fc5fs58MChFkVrTAKaDy4yvPZpnMtbI0pxxk6NiylEIEmR3EVGTRsj5D1A8p1hQ3x3fn3PVqg0Z+zhXElVKsOJwbg0W+j7K5fUc9hn9+7XsH13p\/XRYINDfWugYE2UuuAe\/he6F+1LqfDAYRrAHRLBBABdZJqhXiuz6EyP+zo9XBtc42ZP206\/JnT63+ci2M9hnNzZKzstZ22uDxYaDVQWbQrKINQA0UsXqkAlkCIAaRlv1kMIhY8Q5YILlWSE2XZuoQSekY\/qw9ZP0w62oDyXVq2fnlIEoBiD+QfJDktIsFgpzza5ZWSZEQhQVSUuS9QNu26idNIQLrA\/BwroefiXHWBD4TWxtilXs3rk0usOpTvi9EtBkK14DBAGkDKccH1wYqjhlSykwOuGjv+9emQQav3cpdmR73AWVBBG0T+r60RuT58ff1W7cP16a1vfy+ZW3g3ljXINvQqkfoHst+1LqfNIEILAs\/8wJI4D0\/sIrVqXgtMzQ5xR1jSile\/+b0hYiME+C1Dyn8X85AObNMjRnQsjhis5\/WNjIAqK2zsdpOto01QENWlLQSEEsJ1V8buPIatLYIXYN2DA1GoX4ij9G3n1SDCKwNZFhC6zxkajY1pWsVwKnvFgFThYhm5mrP1mCmSQ26tYBIilsgXRFtcGlWDqwC6\/wpKd5Y+5cEj0Ptp12DZpGFrk+zEEL1GKKf9IYIXJScoCg+7y9z71vc8ZYGEe2mo0PK51i0TpoaOKvhzlizYWxwpXxGplz9tq0JEee+oC39uoasiNQ6hK4hBJjUY2h\/S+0ng0EE1kWu+wGXpjQOIgsAtsSYSG7Qr8TfrblOxAoQam5G6gDsu9gsBSL4TCir0xIisg5W9iYXIqmleP1IaQwkBoUWAKmxZmSq2ZmpQUSznLTnhcYEES3m4bdFa0skdZ1QK4gUB1f7ZGIst8bFQloApO8y+DlBRDNTQ1sRDAURLbhqZVXGAhEtqIlj+m2nWVc1IRILmNZ0Z\/r0k+rZGRksrR0DsQKsS4OIFlSsvWlRLYiEZnTLdJYxFC1bgE4uO34tiGiWk7SYWkMkJUMVO8YQ\/aRJitetQHVP2\/bNwjhQwOLA2hBIpoZLA6xThYg2u1vxBXQ8mN65Pm4NiGCga+lcee3y2LG9VnJdgRoDOPf+9YWIZg1pMA1ZLNqS+Nr9pPmKVcQrEA+J7RMSKviu9vi\/H4spDbBOecWq9n33DARmScxCsALcgMW\/OR1E63y5O5tZS99jS941+KCD4zM4vvZ9f4D1hYiWvnXPt6ANrViDX\/e+ELHaD\/XEeawFa\/IYVj9xbdm3nwz6AF6JSxP7uQg\/zlKygnXqy95zljMPsdjMHyyaKe3+hsEYWyyX4gZZA7gvRLQZPPcaakDkFMverTjVaLYCyFmhCjikZF7cw30lK1inDhHM2KnPiWirHVtCRHtC1z9\/7ElffNaaaeVx5cxZIztjZZT884asqRoQKc2waK5Kq34yOEQAhVSA5Oxg5rJD3AqgM03XIXc20+qmPekq66itXg3VDaDSTO9a60TQbtq5XexA\/s239GpBJHQdqGds+X1OW1YJuo5lV\/e+K1GX+rszzld2D5r1eZAqZRezIXc2w7ExCFA3uErVN9OJbEY09HmtQDXuq3sQMCcV3KqfnAQiiF2MASD88SpqCgK0rM2XNGvIWtk6uz1WrQf1hgQIIUKNXf4Ttn7mDfCwXJyT7yc71ODV1o4MDRBChBq7cjNU1hqQWULE34wIVonbb4QQoairMZDU9KwVZJ71787A8jgVPAgRakouDVwUazsFt+PbyS2QMfwWLyFCUek\/9dDk5x4IEUKEoggRQoSiCBFChKIIEUKEoqhiiOwIEYqiCrUDRLaECEVRhdoCImtChKKoQq3P8ADgklwa3nSKqufKgB8OIitChKKoTK0uIXIEyYYQoSgqURvHjkuIHEGyJUQoiooFU31uXIHIEiwSdgCKqmOBmBDxYiQ7QoSiqMv1IMcYSBJEPJisjy7OjhChqEWCY4s0bogT\/wFdspil9uJFjwAAAABJRU5ErkJggg==","width":91}
%---
%[text:image:275f]
%   data: {"align":"middle","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAiAAAABQCAYAAAAgNM70AAAQD0lEQVR42u2dv6tkSRWA508wNXuZ6YuMDfwDHmwuz9BsQTAcXyaCwQYGgsFqtisIogYLgg4sCIrIBE6wiO7CqguDrLP4kwVp+4yvhpo7dU6dU7fqdt3ur+BjZ2f69bt9u358depU3QeHw+GBh\/de++z1kbsjj44c4P88+NpbAAAAl86jI3dHrr1e4RGP2yOPkQ0EBAAAwMHjI7fNAnIcXK+IdiAgAAAAK6IiVyEBOQ6sN0eeIRgICAAAwAqeHblxCcj9kgtygYAAAAD04tYUkPvIB2KBgAAAAPTmpigg9zkfLLsgIAAAAKOWY65KAkLCKQICAAAwNDH1JQEh7wMBAQAA2DIfJAkI53wgIAAAAJucE\/JcQO5POEUmEBAAAICtuH5wf7w6MoGAAAAAbMUdyacICAAAwObJqA+QCAQEAABgc5AIBAQAAAABQUAAAAAQkFn58ze\/fPjXk18e\/v7rdw4ffPWLCAgAAAACMpaPvv36IS\/\/\/ecnhz9+5fMICAAAAAIyBhGNUpFoCAICAACAgAzh459+96CVp28+REAAAAAQkP7RD1lu0coplmKoRAAAAGcuILLMUiuf\/OJtBAQAAAAB6cNf3\/7WwVu2jIJQiS6L6zfeOdz97HeH2x\/86vCZr\/+QewJwwXzhOz8vjkGP\/vC0+HrpM6TvkD5E+hIEZAfy8eHD1w6RIrJyTgJy9Y2fPK+wUqk\/+PgfLz7ns39\/+vzv3nj3vecNgQ5hLI\/\/8rdX6tqM9z3VFw3pAFvf23pfoeU9U4e8xCN4tetZg9zHfKApvWb099\/z92r3uVZXth4o5b6\/\/uPfmv3dzfff3Z2AlF4rfQoCMjG\/\/9LnXuR9fPr0Q5eAyOvOQUCkIUpF9hZprLM0zEuZ6fzoyZ92c615aYneSN2qleh7ynVoRQah2s+PLPkgL4NxqbRKlxet\/Wsz7Jb38hQZ\/L\/3m\/dfkrIR\/Z38jkh\/t0amtxYQ7bNddJ89u4D85\/0nL74oOXTMXTk3Opxs1BcjDau1SEVHGvqiDUDSMe9RQFo6bpGt3gJi1XPP7PCcBUQGZKtEZWCNgKytO556IG2ppUi9PNVyaERAtM83WmIRkEYkoTQ\/5yOXkVqR7bp7FZA18oGEbDsYSDh4jwISDf1akYo1AlJa1spLLfx\/zgKi\/c7W391LQHpLSI\/+TurRKSQkIiDa9zkyqoSANC67LHe8LE8\/rRVZttmjgHjC3N4y4+C4Z+R+5rMYmXnN2Hl4BCTa8XkHiZ4zfE8dPmcByfMftCWIUwmItIMeuSHeujrrpCsiIFLf8yii3MOL76NnPGZ9edaHREKsA8i0Is+L2ZOAiMFbYUipvDIQSEWW14qsSAX2dqLQr9OZedbi7dQ9ORaR5ZeogNTqrmeJSz6rhbbuLn9f+9l8Rr21gHi\/w0j71gSkdC+kb5HPVuuPRkqWRDVSEqx8F3JdtTqzdT5FdBdM6ufplycSENk2K4JROmQsHS5mHUB2ymWYrUKult1bs9OWZDU4z4TZ1mUY7\/JLVEBqM\/weg0ovcdhaQLzJmJFZvyYg1mcQ0baWyUYtvVifS+qDJkbRqNApBAQmEhBJFrXkQqIYkTNAtt4N0\/PL0BqVp5OxGnMpVFqa8eWz+jQDkoYkMx3585qBIJ2fITOY\/D2952nUrjffXy\/v33sLYZq1LGm5t2mbYboXva81Etb2RHLkWnsLSGSpcc1Me68C4k3IjCRBtwhIrW8ZEf3wfN9WHS\/1U5422dJ\/RJdgapE263Wl\/lTGBiH1zy15MCmant4vbXXe5KySmeVDll7ybbgtZfRumC1yP7yVygqxetbO09kH1ownutVXGrFnpisV3vqc2vXKz9TCsrX37j3TmfVaS4OaZw26lijaMiBpM3xtqaf1nuxRQLQBX7tn3oTQVgGxcnXWTEjW5iZZdcjbJj35TVab7JGEupQL7XVyzwQrl0fauLd\/ls8k97Amu0OPd5jhfI9SkR0v8prW6MdWyzCjQ66R2Z\/WkEphSS0k75151To9qdzevIH8OjXj1hq5d3BcmyW\/VkDk+z31tZZEsBay1gYf7bOsyXWS+qKJeCRfZe8CUmo3KdKh3beRAmLJQu\/IVGR3llZXSlEhrU16l7q0NrmlgETOSPF8p9Ftz0OSfGd8rkvK+2jN\/dhyGWb0gUORjteaqSwbT+9dAr0y7qVRlBp6j7JmsFgrIDNcq5ZUaIVZS8svMuBp3+8aUU5SW7rG1hMj9yYgWhtOkqENQp6oQauA9JCFXtfizU1a1ulRbXJLAYkWrU60yMcwCZnx2S5y9Lq8JnLw2Kl2w\/T6InrtYvG+T4+izZ7XNiBvCLVFbvYiICOuNa3xRpZhSpEOEYU1AqL9bBJPbZBtWY\/em4Bo+TZJztZEiFoGfastrzkLRIugRUP92vLuiP6u1CZnFhCtXXuTv3uNSVMIiORiiHTkORkiGssIh2zDlX8TaehVRj4hd7SARDtdrWFHGmR61kRKTrKWDpYdhrWVWN4nJUrVttQt7d17vfJf63pbG08vAYlca2sCmCUgpX\/TRLIUek8RqlYBqc3wrUG25cyEvQmINjjkUcHIZMAjIPKz8m9LaltkZ5hweaVqVP+xtYCk4+elHQnWjqDSd2S9d3qmWK3f77rDZ3Sex9M3H770DBcRjiQZ6TUp0pEeItdj6WVZ5PfsUUB6hTaXohCZ1UiF1CrjMiRnhWtLSyva65eDTfR6tc6zddbWQ0Ci19qa+GUJiDbIlX5XSRDT990qINr3vbw3pU61JSq0JwHRci2WEUEtt6omrL0OIutx9PksArK2\/9hSQOSaSvfd2sDgFdyS3Fv9frdzkEYMyhK9qC2fpB0u+c+Unv\/Sq+TSc4kC4mmQ1qzGm+CqVVhr4PdcS\/R6tTB+64CxVkCsa9UGlN7XmjoZSyxqnVUSFa0j6zHD7\/ngrj0JiHeXi7VLZrSASD3uEYKfQUB69B9bCohV1zzjhya4lthrda01KXyYgKTDxLxPrJUiorHcJps\/\/6Vnkd+FgNR3lbQkfNXetzZz9cymo9fbe8BYKyAzXau2tFLrrHLZbKmvkScKa7O66JkgexIQLZS+lDOtLba2s575BXsSkB5tchYB8UwItPwiS1yHPwOrx9Hp1o6WSIKoLNeMLCJJexOQaKhTa5CeHJDa2l7tva3zJ0przAmt40VAxl1rKVKVRxdKUZK802kRkOg5Ft4B+RwEJCpcWtTMijRGc0Cstrn2syMgfQXEM4nTcu6s71973255IGsH4JZntKSScj6SyIwuI84EmW0XjNZhnFJAWkt+zQhI32stzYbymVBtu26LgESFQhOWSPh3LwISFQotNG5FiFp2wVh5AGtyAUYLyLKOICB9I2DTCEjK34gmjeY7U7aQj5QAO6uAaJ1zdM3b27ARkMsWEC20mjLgW3JyLAGpPa8osgsjsgNjDwJiLW\/KZy3dmxYpaD17w0rKbM0F6HHu0cj+DgHZkYCk3SzepZhTyEdpyWcPB5FF1tosAVg7SCIg5yUg2qxbRKEUefDMKC0BiZ6KWyveLcp7EJDIs3Y8RRvE1xz+pYXvW5\/TYz2luMfBi55t\/AjIGQmIN48j342ytXxIkd05MwqItfVq7ePNewySVgVOg4HWGFPmfJTa2QcISPwo9lpUQgaUUjQu79AjolsbKEYnQe5BQCLP2vEUrc9YIyCaJLUORFpELLLVWrsm76MnLk1ALOmL9s3dHlI36tCx5W4YWf7YMuHUKj2TUUefAeBdF7UOACvNiKIN0rMLxnrNiHMDEJB1kTCrzliz3KiA9J7hRwaq2QXEave9I0QjIiCtAmJJqfesnsiZFgiI\/YyZoU+8PcVBZLIkk7bULrfbjtpqm4osBUmCq3YWSZ78OouA1LLUa8ZpPaiotCYcjbZoM5blenykUyjtBNBEBQF5a8hSnOcBV97DlzQBWXv0s1Y8+VGzC0jt6citpTSojMgBWTN4actyIpdb9HeXJiCW7Nbut9SBbmd\/bHkUu0Q90oFj+amno5ZXltGN0u\/smYza88uwOnatUVrHYlsdROT11kx5KRatz45IHYp2YioCMkZArFMUtehV5P2tTk9+tyfcq9Vvz+A3u4Bo7SodD15Du65ShGjELpg1z4Np6e9q8qG1MwTEngzId2w9vC7Vge5Pf97yAXQiB\/L8F8n9iBxY5im1k06X+Sa9Tkbd4lHcy4oig75UhNo+fe3JsrVnI+RrgmK9keeV1ML68vmk00rvL39evn9JQhCQMQJiDYLaIN8jwhLZyWLtoKkt7Y0WkNoZCiU88uddsrSWPZdy0HIOSG0ZbO3Sai0ClPd3Wn5Sfj3aIIqA1NuS3D+51\/nEQP5\/ec\/XSOc0T8PtuRTjlQlZBkrbhUWAZhQQK9zZM0Tdo2gN2KrkrUmGCMg4AbEGgVIdirx\/JC+pxyC7tYC0lJqcRfMqtEnLMnen5y6IXrPhWoQlUqKPe7hEAelVD6Z+FkyENaeotkQy8gRZicbMJiDLkNeIxthDQKzZhje3wJr1EAHZTkCiz4jwvr81w492YNogW4ukzCogllRF19ot4c\/vc08B6Zm42ENCWvq7SxWQtff7bCIgaVmmteTniUQTZCUxVuRnRgFJlaTl7ARPwqr1cCZPxfQkiaWO0bPLYtlwyQHZVkC0tWEtcdj7\/q3SsGaQ3YuAtH6eaIQol5keAiLteUQyonyGloRcqbeeZGQEpM\/40lU+ZhCQ1qWYted5pIPTZhWQvIJ7Kop06pHKYQ3+Vkcl\/xbZAy6dqcyWaiIiHckpQqgIiL5VVvuePe\/fc4Zfez9rh9WsAqKJfouceWWvVUCkbabcrbU5H56664meyjXJd+K9HgREv9+eeiHfSbdll9kERJZFIkWiF2lnzanZar+0NLSU9Z4j9t9SMWqNRgYfGSjS75E\/r62AKak1v37p1IZUbICOSB1tOUyvxKk+g7Rp7zXO0CZL\/UVrfwf1+i33djm+LA+EPEsBEUQq9iYfWwpIb3okvwEAAOxeQDwno84mHwgIAADAzgVExMIqsn225xHqCAgCAgAACIiZjCrykR\/ljoAgIAAAgIAM3ZIrO1VmW3ZBQAAAAM5IQPKDySTfo9dx6QgIAgIAAAhINQoyY64HAgIAAHDGArI39vrFl\/b+Rw4YAwAAQEAQEAAAAAQEAQEAAAAEBAEBAABAQBAQAAAABASRQEAAAAAQEAQEAADg\/AXkESKBgAAAAGzIIxGQO0QCAQEAANiQOxGQa0QCAQEAANiQ6weHw\/NlmMfIBAICAACwAY\/FPZKA3CITCAgAAMAG3LwQkHsJIRkVAQEAABiafJq8IxeQqyPPkAoEBAAAYADPjly9IiD3EnKDVCAgAAAAo5ZeigJCPggCAgAAMIDbpW+8IiBZJITlGAQEAABg7bLLTck1igKS5YSQmIqAAAAANCWc5jkfbgFZLMlwTggCAgAA4DrnQ4t6hAQkE5Hr+2PbiYogIAAAAMtox92Ra69X\/A+Gkaju8c43fQAAAABJRU5ErkJggg==","width":136}
%---
%[text:image:42d0]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
