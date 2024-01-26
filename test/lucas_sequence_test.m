classdef lucas_sequence_test < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        function test_fibonacci(testCase)
            % Test whether lucas_sequence correctly reproduces the
            % Fibonacci sequence for default values: type='U', P=1, Q=-1
            % 
            % This test verifies:
            % * Default values are as specified
            % * Function of type='U'
            % * Correct output for a common sequence
            % * Creation of vector output
            % * Handling vectors with nonuniform spacing
            % * Handling vectors that both increase and decrease

            n = [0:10, 21:-2:11];
            expectedResult = [0	1	1	2	3	5	8	13	21	34	55	10946	4181	1597	610	233	89];
            actualResult = lucas_sequence(n);

            testCase.verifyEqual(actualResult, expectedResult);
        end

        function test_pelllucas(testCase)
            % This test verifies:
            % * Function of type='v'
            % * Ability to use lowercase for type
            % * Generation of Pell-Lucas numbers

            expectedResult = [2, 2, 6, 14, 34, 82, 198, 478];
                % ref https://oeis.org/A002203
            actualResult = lucas_sequence(0:7,'v',2,-1);

            testCase.verifyEqual(actualResult, expectedResult);
        end

        function test_n_mustBeInteger(testCase)
            % This test verifies:
            % * mustBeInteger check on n
            testCase.verifyError(@() lucas_sequence(1.5), ...
                'MATLAB:validators:mustBeInteger')
        end

        function test_n_mustBeNonnegative(testCase)
            % This test verifies:
            % * mustBeNonnegative check on n
            testCase.verifyError(@() lucas_sequence(-1), ...
                'MATLAB:validators:mustBeNonnegative')
        end

        function test_p_shape(testCase)
            % This test verifies:
            % * IncompatibleSize check on P
            testCase.verifyError(@() lucas_sequence(1,'u',[1,2]), ...
                'MATLAB:validation:IncompatibleSize')
        end

        function test_type(testCase)
            % This test verifies:
            % * IncompatibleSize check on P
            testCase.verifyError(@() lucas_sequence(1,'a'), '')
        end
    end

end