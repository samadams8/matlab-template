classdef crop_to_size_Test < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function unimplementedTest(testCase)
            crop = crop_to_size(zeros(8,8,8,8), [3, 4, 5]);

            testCase.verifyEqual([3, 4, 5, 8], size(crop));
        end
    end

end