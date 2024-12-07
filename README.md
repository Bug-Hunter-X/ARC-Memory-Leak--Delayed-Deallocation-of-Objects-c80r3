# Objective-C ARC Memory Leak: Delayed Deallocation

This repository demonstrates a subtle memory leak in Objective-C when using Automatic Reference Counting (ARC).  Setting a strong property to `nil` doesn't always lead to immediate deallocation if other strong references exist.

The `bug.m` file contains the problematic code. The `bugSolution.m` file provides a solution to this issue.

**Understanding the Problem:**
ARC manages memory automatically, but it's crucial to understand that setting a strong property to `nil` only removes *that particular* strong reference.  If other parts of your code still hold strong references to the object, it won't be deallocated until all references are gone.

**Solution:**
The solution involves careful management of object lifecycles, ensuring that all strong references are released when no longer needed. This might involve using `weak` properties, explicitly calling `release` in specific scenarios (though generally discouraged with ARC), or refactoring code to avoid unnecessary strong references.