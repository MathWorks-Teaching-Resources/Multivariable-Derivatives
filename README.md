<a id="T_DEF03274"></a>

# <span style="color:rgb(213,80,0)">Multivariable Calculus: Derivatives</span>
<a id="H_053613DF"></a>


[![View on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/184323-multivariable-derivatives) or [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Derivatives&project=Derivatives.prj&file=README.mlx)

[![MATLAB Versions Tested](https://img.shields.io/endpoint?url=https://mathworks-teaching-resources.github.io/Multivariable-Derivatives/TestedWith.json)](https://mathworks-teaching-resources.github.io/Multivariable-Derivatives)

**Curriculum Module**

_Created with R2026a. Compatible with R2026a and later releases._

# Information

This curriculum module contains interactive [MATLAB® live scripts](https://www.mathworks.com/products/matlab/live-editor.html) that teach and apply standard concepts for multivariable derivatives.

<a id="H_F00D98E4"></a>

## Background

You can use these live scripts as demonstrations in lectures, class activities, or interactive assignments outside class. This module covers partial derivatives with applications to machine learning and computer vision. 

The instructions inside the live scripts will guide you through the exercises and activities. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the <img src="Images/EndIcon.png" width="19" alt="EndIcon.png"> Stop button in the **RUN** section of the **Live Editor** tab in the MATLAB Toolstrip.

## Contact Us

Contact the [MathWorks teaching resources team](mailto:onlineteaching@mathworks.com) if you would like to to request assistance, provide feedback, or if you have a question.

<a id="H_30BC7141"></a>

## Prerequisites

This module assumes knowledge of single variable calculus, vectors, including vector fields, and matrices, including determinants, as covered in the courseware listed here:

| **Courseware Module** <br>  | **Sample content** <br>  | **Available on:** <br>   |
| :-- | :-- | :-- |
| [Matrix Methods of Linear Algebra](https://www.mathworks.com/matlabcentral/fileexchange/94730-matrix-methods-of-linear-algebra) <br>  | <img src="Images/MatrixCard.png" width="171" alt="MatrixCard.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/94730-matrix-methods-of-linear-algebra) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Matrix-Methods-of-Linear-Algebra&project=MatrixMethods.prj&file=README.mlx) <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Matrix-Methods-of-Linear-Algebra) <br>   |
| [Calculus: Derivatives](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives)  <br>  | <img src="Images/ProductRuleCard.png" width="171" alt="ProductRuleCard.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/99249-calculus-derivatives) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Calculus-Derivatives&project=Derivatives.prj&file=README.mlx)  <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Calculus-Derivatives)  <br>   |

<a id="H_330E72C3"></a>

## Getting Started

### Accessing the Module

### **On MATLAB Online:**

Use the [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Derivatives&project=Derivatives.prj) link to download the module. You will be prompted to log in or create a MathWorks account. The project will be loaded, and you will see an app with several navigation options to get you started.

### **On Desktop:**

Download or clone this repository. Open MATLAB, navigate to the folder containing these scripts and double\-click [Derivatives.prj](<matlab: openProject("Derivatives.prj")>). It will add the appropriate files to your MATLAB path and open an app that asks you where you would like to start. 

Ensure you have all the required products ([listed below](#H_E850B4FF)) installed. If you need to include a product, add it using the Add\-On Explorer. To install an add\-on, go to the **Home** tab and select <img src="Images/AddOnsIcon.png" width="16" alt="AddOnsIcon.png"> **Add-Ons** > **Get Add-Ons**. 

<a id="H_E850B4FF"></a>

## Products

MATLAB® and Symbolic Math Toolbox™ are used throughout. Tools from the Image Processing Toolbox™ are used in the computer vision example. The function `randsample` from the Statistics and Machine Learning Toolbox™ is used to create Exercise 5 in the partial derivatives script.

<a id="H_E8C62B23"></a>

# Scripts

## [PartialDerivatives.m](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Derivatives&project=Derivatives.prj&file=Scripts/PartialDerivatives.m) 
||||
| :-- | :-- | :-- |
| <img src="Images/SeaSurfaceGradient.png" width="171" alt="SeaSurfaceGradient.png"> <br>  | **In this script, students will...** <br> $\bullet$ Compute and visualize partial derivatives, directional derivatives, and gradients <br> $\bullet$ Recognize notation for partial derivatives <br> $\bullet$ Apply the chain rule for partial derivatives <br>  | **Academic disciplines** <br> $\bullet$ Machine learning (gradient descent) <br> $\bullet$ Mathematics <br> $\bullet$ Computer Vision <br>   |

<a id="H_F61733D7"></a>

# License

The license for this module is available in the [LICENSE.md](https://github.com/MathWorks-Teaching-Resources/Multivariable-Derivatives/blob/release/LICENSE.md).

# Related Courseware Modules

| **Courseware Module** <br>  | **Sample Content** <br>  | **Available on:** <br>   |
| :-- | :-- | :-- |
| [Multivariable: Space and Functions](https://www.mathworks.com/matlabcentral/fileexchange/180356-multivariable-space-and-functions) <br>  | <img src="Images/ShapesCard.png" width="159" alt="ShapesCard.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/180356-multivariable-space-and-functions) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Space-and-Functions&project=Space.prj&file=README.mlx) <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Multivariable-Space-and-Functions) <br>   |
| [Multivariable: Integrals](https://www.mathworks.com/matlabcentral/fileexchange/181588-multivariable-integrals) <br>  | <img src="Images/LineIntegral.png" width="171" alt="LineIntegral.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/181588-multivariable-integrals) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Multivariable-Integrals&project=Integrals.prj&file=README.mlx) <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Multivariable-Integrals) <br>   |
| [Applied Partial Differential Equations](https://www.mathworks.com/matlabcentral/fileexchange/172650-applied-partial-differential-equations) <br>  | <img src="Images/PDEShockCard.png" width="171" alt="PDEShockCard.png"> <br>  | [<img src="Images/OpenInFX.png" width="91" alt="OpenInFX.png">](https://www.mathworks.com/matlabcentral/fileexchange/172650-applied-partial-differential-equations) <br> [<img src="Images/OpenInMO.png" width="136" alt="OpenInMO.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/Applied-PDEs&project=AppliedPDEs.prj&file=README.mlx) <br> [GitHub](https://github.com/MathWorks-Teaching-Resources/Applied-PDEs) <br>   |

Or feel free to explore our other [modular courseware content](https://www.mathworks.com/matlabcentral/profile/authors/37969341).

# Educator Resources
- [Educator Page](https://www.mathworks.com/academia/educators.html)

<a id="H_0FA5DA18"></a>

# Contribute 

Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks teaching resources team](mailto:%20onlineteaching@mathworks.com). If you want to contribute directly to this project, you can find information about how to do so in the [CONTRIBUTING.md](https://github.com/MathWorks-Teaching-Resources/Multivariable-Derivatives/blob/release/CONTRIBUTING.md) page on GitHub.

*©* Copyright 2026 The MathWorks, Inc
