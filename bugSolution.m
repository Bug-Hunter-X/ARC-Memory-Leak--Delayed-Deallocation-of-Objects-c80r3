To fix the potential memory leak, you need to ensure that all strong references to `myObject` are released when it is no longer needed.  One approach is using `weak` properties in cases where you do not need to retain the object for its lifetime:

```objectivec
@property (weak, nonatomic) MyObject *myObject; // Now, setting to nil doesn't maintain a strong reference

- (void)someMethod {
    MyObject *myObject = [[MyObject alloc] init]; // Local strong reference
    // ... some code that uses myObject ...
    myObject = nil; // Removes the local strong reference, allowing deallocation
}
```
Another approach would be to remove any other unintended strong references which may be holding the object in memory.  Properly managing object lifecycles and understanding the implications of strong and weak references is key to preventing these types of memory leaks in Objective-C.