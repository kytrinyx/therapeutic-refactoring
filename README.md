# Therapeutic Refactoring

Code samples for the talk [Therapeutic Refactoring](http://confreaks.com/videos/1071-cascadiaruby2012-therapeutic-refactoring "Watch on Confreaks").

## XYZ Service

This is the main example in the talk.

Each step in the process of first adding characterization tests
and then refactoring has been committed separately.

### Add Characterization Tests

Basic assumption: The code works. Whatever it is doing now is the correct behavior.

Inputs and outputs are unknown. Lean on the tests by using a stub for the inputs, and
some arbitrary expectation in the assertion.

* Failing tests tell you which inputs are missing. Add these to the stub.
* When all the inputs are in place, the assertion will fail, telling you what the output should look like.
* Go through the code and inspect the details. Choose better inputs to exercise the code.
* Call each branch of every conditional from a test.

### Perform Refactoring

This uses the prescription *Replace Method with Method Object* from Martin
Fowler's book _Refactoring_.

* Create a class
* Add an initializer that takes the same arguments as the method
* Create an attribute on the class for each of the arguments
* Copy/paste the method in, and change the method signature to not take any arguments
* Replace the body of the old method with a call to the new one
* Extract each chunk of code that can be identified as being a sub-step, naming these appropriately
* Identify and delete codejunk (see below)
* Play the game of *Five Differences*. Sometimes this doesn't show you anything useful,
  but occasionally it gives you a new perspective and some new ideas.

Remember to run the tests at every step.

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

### Trailing Whitespace

Ugly and messy. Editors can (and should) be configured to show you this.

### Commented Out Code

Don't let rotting decay ruin your perfectly good codebase.

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

### Evaluate a boolean so you can set a boolean so you can check the boolean

Just return the boolean you started out with.

### Unnecessary Hard Work

Don't do work that the computer is (or should be) doing for you.

e.g.

* stringifying strings
* calling `to_s` inside a string interpolation
* calling mapping over an array with `to_s`, only to call `join` on it
* calculating where to truncate a string using match-if brackets
* doing a case insensitive regex, and then downcasing afterwards

### Duplicated Tests

By this I mean tests that test the same thing in many ways, instead of
designing a better test.

