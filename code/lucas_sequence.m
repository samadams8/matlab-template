function l = lucas_sequence(n, type, P, Q)
% Compute values in a Lucas sequence.
%
%  l = lucas_sequence(n)
%  l = lucas_sequence(n, type, P, Q)
%
% Parameters
% ----------
% n : List of indices
%   Query indices; which elements in the Lucas sequence should be returned.
%   Can include zero.
% type : {'U', 'V'}, optional
%   The type of sequence to generate. Default is 'U'.
% P : scalar, optional
%   Value for coefficient $P$. Default is 1.
% Q : scalar, optional
%   Value for coefficient $Q$. Default is -1.
%
% Returns
% -------
% l : List of numerics
%   Lucas numbers for index `n`.
%
% Notes
% -----
% Lucas sequences define two types of sequences that have the recurrence
% relation:
%
% $$ x_n = P \cdot x_{n-1} - Q \cdot x_{n-2}$$
%
% The first two entries in the $U$-type sequence are $U_0(P,Q)=0$ and
% $U_1(P,Q)=1$. The first two entries for a $V$-type sequence are
% $V_0(P,Q)=2$ and $V_1(P,Q)=P$.
%
% The Fibonacci sequence is a special case of the $U$-type Lucas sequence, 
% with $P=1, Q=-1$.
%
% References
% ----------
% [1]. https://en.wikipedia.org/wiki/Lucas_sequence
%
% Examples
% --------
% >> lucas_sequence(0:5)
% ans = 
%   0   1   1   2   3   5
% >> lucas_sequence([1, 2, 10], 'V', 1, 2)
% ans =
%   1   -3  57
%
% See also
% --------
% fibonacci
%
% Contributors
% ------------
% Samuel Adams-Tew
arguments
    n(1,:) {mustBeInteger, mustBeNonnegative}
    type string = 'U'
    P(1,1) = 1
    Q(1,1) = -1
end

N = length(n);

if N == 1
    % Compute the lucas number for a single entry

    % Set the initial sequence values
    if strcmpi(type, 'U')
        l0 = 0;
        l1 = 1;
    elseif strcmpi(type, 'V')
        l0 = 2;
        l1 = P;
    else
        error('Undefined sequence type %s', type)
    end

    % Return the appropriate value
    switch n
        case 0
            l = l0; return
        case 1
            l = l1; return
        otherwise
            % Recursion relationship for both lucas sequences
            l = P*lucas_sequence(n-1,type,P,Q) - Q*lucas_sequence(n-2,type,P,Q);
            return
    end
else
    % Compute the value of all requested numbers by calling self
    l = nan(1, N);
    for iter = 1:N
        l(iter) = lucas_sequence(n(iter), type, P, Q);
    end
end

end