classdef pad2sizeTest < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        % Test padding functions
        function padTest(testCase)
            a = [1, 2, 3; 4, 5, 6];
            b = pad_to_size(a, [5, 5]);
            b_ref = [0     0     0     0     0
     0     0     0     0     0
     0     1     2     3     0
     0     4     5     6     0
     0     0     0     0     0];

            testCase.assertEqual(b, b_ref)
        end
    end

end