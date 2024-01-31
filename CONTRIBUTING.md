## Versioning
In general, do not create changes that would break backward compatibility.

If you need to create a dramatically different version of a function, create a function with a new name. Consider marking the old function as deprecated using a `warning` to let users know that a newer version has replaced this particular API. This can be done by adding a warning to the start of the function:
```
warning('FUNCTION has been deprecated and may lose support in future versions. Use METHOD instead.')
```
It is often common to create new versions of certain functions or scripts as new features or needs come up. In this case, it is best to leave the previous reconstruction routine as-is and create a new version. This allows future users to go back and recreate any figures or images if needed. Add a warning to let users writing new code know that a more up-to-date version of the routine exists.
```
warning('A newer version of function_v1 exists. Consider using the most up-to-date version for new workflows.')
```

# Style Guide

## Function arguments
As of MATLAB 2019a, functions can be declared with an `arguments` block that makes it simple to configure optional and keyword arguments.

## Documentation
For all public APIs, create a docstring using a modified [NumPy docstring format](https://numpydoc.readthedocs.io/en/latest/format.html). The docstring consists of
* A one-line summary of functionality that does not use the function or argument names
* The function signature(s)
* An extended summary (optional)
* Several sections separated by headings

### Sections
Each section heading should be underlined with hyphens. Any included sections should be in the following order.
1. Input (define all positional arguments)
2. Options (define all name-value / keyword arguments)
3. Output
4. Notes
5. References
7. Examples
8. See also
9. Contributors

### Example
```
function out = foo(bar, baz, type, options)
% A sample function definition for our docstring style
%
% out = foo(bar)
% out = foo(bar, baz,
% out = foo(_, type)
% out = foo(_, Name, Value)
%
% The terms foo, bar, and baz are common placeholder names
% in computer programming and documentation [1].
%
% Input
% -----
% bar : (N,M) complex
%    Specify the shape (and type) of matrices in parentheses.
% baz : scalar, optional
%    For optional values, conclude the description with the
%    default value. Default is 0.
% type : {'a', 'b', 'c'}, optional
%    Specify sets using curly braces. Default is 'a'.
%
% Options
% -------
% SpecialFlag : logical
%    Options are always optional, so there is no need to mark
%    them as such. Default is false.
% 
% Output
% ------
% out : (N,M,3) real
%
% Notes
% -----
%
% References
% ----------
%
%
```
