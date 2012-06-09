# Therapeutic Refactoring

Code samples for the talk Therapeutic Refactoring.

## XYZ Service

This is the main example in the talk.

Each step in the process of first adding characterization tests
and then refactoring has been committed separately.

## Codejunk

A loan word from the field of information design, inspired by Edward Tufte's
term _chartjunk_.

With thanks to Carl Manaster, who first introduced me to the idea.

### Lousy Comments

* comments that state the obvious
* comments that echo the implementation
* comments that are wrong
* comments that are imprecise
* comments that are misspelled

### Explicit Return

Mostly explicit returns are worthless.

Obviously, there are exceptions, such as with guard clauses.

### Trailing Whitespace

Ugly and messy. Editors can (and should) be configured to show you this.

### Commented Out Code

Don't let the rotting decay ruin your perfectly good codebase.

### Unnecessary Parentheses

Parentheses are great for clarifying precedence, and occasionally you do need them.
What you don't need are

* empty parentheses in a method definition
* empty parentheses for a method call without arguments
* parentheses around a single method call
* parentheses around an arithmetic expression where precedency is perfectly clear

### Explicit Default Parameters

There's no need to pass in arguments to a method when these are exactly
the same as the defaults.

### Unnecessary Dependencies

Requiring libraries that aren't used add an overhead, especially in your tests.
Also, they add noise and potential confusion to the codebase.

### Unnecessary String Interpolation

A string is a string is a string.

### Unnecessary Hard Work

Don't do work that the computer is (or should be) doing for you.

e.g.

* calling `to_s` inside a string interpolation
* calling mapping over an array with `to_s`, only to call `join` on it
* calculating where to truncate a string using match-if brackets
* doing a case insensitive regex, and then downcasing afterwards

### Duplicated Tests

With this I mean tests that test the same thing in many ways, instead of
designing a better test.

