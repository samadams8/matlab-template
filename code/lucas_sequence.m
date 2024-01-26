function l = lucas_sequence(n, type, P, Q)
% Reference https://en.wikipedia.org/wiki/Lucas_sequence for more
% informatin about Lucas sequences.
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