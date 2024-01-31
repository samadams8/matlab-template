*After creating a new repository based on this template, be sure to configure the environment variables necessary to run GitHub workflows*

Contribution guidelines
- [ ] Code compiles and introduces no new compiler warnings
- [ ] All public APIs have [docstrings](../DOCSTRINGS.md)
- [ ] All public APIs have unit tests that show they work as expected
- [ ] No public API has been changed in a way that breaks backward compatibility
- [ ] [Comments tell you 'why', code tells you 'how'](https://blog.codinghorror.com/code-tells-you-how-comments-tell-you-why/)
- [ ] Private APIs are contained in a [private directory](https://www.mathworks.com/help/matlab/matlab_prog/private-functions.html)
- [ ] Functions that have been replaced by a newer version or will lose support in the future have been marked with a warning
- [ ] Function arguments and options are specified and checked using an [`arguments` block](https://www.mathworks.com/help/matlab/ref/arguments.html)
