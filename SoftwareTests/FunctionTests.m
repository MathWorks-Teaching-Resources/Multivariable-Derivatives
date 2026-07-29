classdef FunctionTests < matlab.unittest.TestCase
    % FunctionTests
    %
    % Purpose:
    %   Unit tests for functions in FunctionLibrary/.

    methods (TestMethodSetup)

        function addFunctionLibraryToPath(testCase)
            import matlab.unittest.fixtures.PathFixture
            functionPath = fullfile(testCase.getRepoRoot(), "FunctionLibrary");
            testCase.applyFixture(PathFixture(functionPath));
        end

    end

    methods (TestMethodTeardown)

        function closeFigures(~)
            close all force
        end

    end

    methods (Test)

        function genFunDefaultModeReturnsValidOutputs(testCase)
            syms x y z w t
            rng(17);

            [myFun, myVar, varList] = GenFun([x y z w t], 3, [-4 4]);

            testCase.verifyGeneratedFunction(myFun, myVar, varList, 3);
        end

        function genFunSimpleModeReturnsValidOutputs(testCase)
            syms x y
            rng(23);

            [myFun, myVar, varList] = GenFun([x y], 2, [-3 3], "simple");

            testCase.verifyGeneratedFunction(myFun, myVar, varList, 2);
            testCase.verifyFalse(contains(char(myFun), 'log('), ...
                "Simple mode should not generate logarithmic terms.");
        end

        function genFunRejectsInvalidType(testCase)
            syms x y

            testCase.verifyError(@() GenFun([x y], 2, [-3 3], "invalid"), ...
                "MATLAB:validators:mustBeMember");
        end

        function getPositionReturnsSelectedLineWithSpoofedUI(testCase)
            expectedPosition = [1 2; 3 4];
            helperPath = testCase.createGetPositionSpoofHelpers("valid", expectedPosition);

            import matlab.unittest.fixtures.PathFixture
            import matlab.unittest.fixtures.CurrentFolderFixture
            testCase.applyFixture(PathFixture(helperPath));
            imageFolder = fullfile(testCase.getRepoRoot(), "Images");
            testCase.applyFixture(CurrentFolderFixture(imageFolder));

            [position, edgeImage, imageTitle] = GetPosition("Ramp.jpg");

            testCase.verifyEqual(position, expectedPosition);
            testCase.verifyEqual(edgeImage, imread("Ramp.jpg"));
            testCase.verifyEqual(imageTitle, "Ramp Edge");
        end

        function getPositionDoesNotAppendEdgeForLungImages(testCase)
            expectedPosition = [5 6; 7 8];
            helperPath = testCase.createGetPositionSpoofHelpers("valid", expectedPosition);

            import matlab.unittest.fixtures.PathFixture
            import matlab.unittest.fixtures.CurrentFolderFixture
            testCase.applyFixture(PathFixture(helperPath));
            imageFolder = fullfile(testCase.getRepoRoot(), "Images");
            testCase.applyFixture(CurrentFolderFixture(imageFolder));

            [position, edgeImage, imageTitle] = GetPosition("LungA.jpg");

            testCase.verifyEqual(position, expectedPosition);
            testCase.verifyEqual(edgeImage, imread("LungA.jpg"));
            testCase.verifyEqual(imageTitle, "LungA");
        end

        function getPositionReturnsDefaultPositionWhenSelectionIsInvalid(testCase)
            expectedPosition = [120 153; 270 153];
            helperPath = testCase.createGetPositionSpoofHelpers("invalid_after_uiwait", [9 10; 11 12]);

            import matlab.unittest.fixtures.PathFixture
            import matlab.unittest.fixtures.CurrentFolderFixture
            testCase.applyFixture(PathFixture(helperPath));
            imageFolder = fullfile(testCase.getRepoRoot(), "Images");
            testCase.applyFixture(CurrentFolderFixture(imageFolder));

            lastwarn("");
            warningState = warning("off", "backtrace");
            cleanupObj = onCleanup(@() warning(warningState)); %#ok<NASGU>

            [position, edgeImage, imageTitle] = GetPosition("Ramp.jpg");
            [warnMsg, warnId] = lastwarn;

            testCase.verifyEqual(position, expectedPosition);
            testCase.verifyEqual(edgeImage, imread("Ramp.jpg"));
            testCase.verifyEqual(imageTitle, "Ramp Edge");
            testCase.verifyNotEmpty(warnMsg);
            testCase.verifySubstring(warnMsg, "Default position assigned.");
            testCase.verifyEqual(string(warnId), "");
        end

    end

    methods (Access = private)

        function repoRoot = getRepoRoot(~)
            repoRoot = fileparts(fileparts(which("FunctionTests")));
        end

        function verifyGeneratedFunction(testCase, myFun, myVar, varList, expectedDim)
            testCase.verifyClass(myFun, "sym");
            testCase.verifyClass(myVar, "sym");
            testCase.verifyClass(varList, "sym");
            testCase.verifySize(varList, [1 expectedDim]);
            testCase.verifyEqual(numel(unique(string(varList))), expectedDim);
            testCase.verifyTrue(any(varList == myVar), ...
                "Returned differentiation variable must be one of the selected variables.");
            testCase.verifyFalse(isSymType(myFun, "piecewise"));
            testCase.verifyFalse(isAlways(myFun == 0, "Unknown", "false"));
            testCase.verifyFalse(isinf(myFun) || isnan(myFun));

            usedVars = symvar(myFun);
            if isempty(usedVars)
                testCase.verifyFail("Generated function should depend on at least one symbolic variable.");
            end

            testCase.verifyTrue(all(ismember(string(usedVars), string(varList))), ...
                "Generated function should only use variables returned in varList.");
        end

        function helperPath = createGetPositionSpoofHelpers(testCase, mode, position)
            helperPath = tempname;
            mkdir(helperPath);
            testCase.addTeardown(@() rmdir(helperPath, 's'));

            drawlineCode = [
                "function h = drawline(varargin)", ...
                "fig = gcf;", ...
                "parent = FakeParent(fig);", ...
                "position = evalin('base','FUNCTIONTESTS_FAKE_POSITION');", ...
                "h = FakeDrawline(parent, position);", ...
                "setappdata(fig, 'FunctionTestsFakeDrawline', h);", ...
                "end"];

            switch mode
                case "valid"
                    uiwaitCode = [
                        "function uiwait(varargin)", ...
                        "end"];
                case "invalid_after_uiwait"
                    uiwaitCode = [
                        "function uiwait(varargin)", ...
                        "fig = gcf;", ...
                        "h = getappdata(fig, 'FunctionTestsFakeDrawline');", ...
                        "if ~isempty(h) && isvalid(h)", ...
                        "delete(h);", ...
                        "end", ...
                        "end"];
                otherwise
                    testCase.assertFail("Unknown spoof mode: " + mode);
            end

            fakeDrawlineCode = [
                "classdef FakeDrawline < handle", ...
                "properties", ...
                "Parent", ...
                "Position", ...
                "end", ...
                "methods", ...
                "function obj = FakeDrawline(parent, position)", ...
                "obj.Parent = parent;", ...
                "obj.Position = position;", ...
                "end", ...
                "end", ...
                "end"];

            fakeParentCode = [
                "classdef FakeParent < handle", ...
                "properties", ...
                "Parent", ...
                "end", ...
                "methods", ...
                "function obj = FakeParent(parent)", ...
                "obj.Parent = parent;", ...
                "end", ...
                "end", ...
                "end"];

            writelines(drawlineCode, fullfile(helperPath, "drawline.m"));
            writelines(uiwaitCode, fullfile(helperPath, "uiwait.m"));
            writelines(fakeDrawlineCode, fullfile(helperPath, "FakeDrawline.m"));
            writelines(fakeParentCode, fullfile(helperPath, "FakeParent.m"));

            assignin('base', 'FUNCTIONTESTS_FAKE_POSITION', position);
            testCase.addTeardown(@() evalin('base', "clear('FUNCTIONTESTS_FAKE_POSITION')"));
        end

    end

end
