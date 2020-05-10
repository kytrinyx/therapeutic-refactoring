# Therapeutic Refactoring

Code samples for the talk [Therapeutic Refactoring](http://confreaks.com/videos/1071-cascadiaruby2012-therapeutic-refactoring "Watch on Confreaks").

The slides are [on slideshare](http://www.slideshare.net/kytrinyx/therapeutic-refactoring)

## XYZ Service

This is the main example in the talk.

Each step in the process of first adding characterization tests
and then refactoring has been committed separately.

### Background

The method is a crufty and confusing thing that lives in a very large kitchen-sink type module.

The method has had a ton of churn, but at the time of the refactoring it had been stable for quite a while.

I chose the _Replace Method with Method Object_ refactoring as a way out that would ensure that any changes I made would be completely isolated, and would not pollute the rest of the code.

A method object is typically a good solution if you have a big calculation with a bunch of little temporary variables and you don't want to pass those temporary variables around. Here we only have a `target`. In other words: Sledge hammer.

One could argue that the method belongs in the actual `Target` class, not some kitchen sink module, but that isn't really ideal either. This logic is **only** used in an ancillary process that is called from a command-line script, so the core application really doesn't need to know about it.

In a different experiment refactoring the same method I used `delegate` from the Ruby STDLIB to create a class called `XYZTarget` that inherits from `SimpleDelegator` and takes a `Target`. In some ways I like that better. It still keeps the logic out of the main application, and it also provides a place that can attract related behavior.

One thing that I didn't mention in the talk, but which might be worth noting, is that when I finished this refactoring I immediately followed up with a second tiny refactoring to remove the method in `XYZService` that simply delegated. I just instantiate the method object directly where it is used, and change the tests to do the same. That gets rid of some of the extraneous indirection that the refactoring introduces.

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
* parentheses around an arithmetic expression where precedence is perfectly clear

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

