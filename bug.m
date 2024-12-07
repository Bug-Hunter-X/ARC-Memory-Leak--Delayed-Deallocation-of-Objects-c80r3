In Objective-C, a common yet subtle error arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider the following scenario:

```objectivec
@property (strong, nonatomic) MyObject *myObject;

- (void)someMethod {
    self.myObject = [[MyObject alloc] init];
    // ... some code ...
    self.myObject = nil; // This might not release the object immediately!
}
```

While setting `myObject` to `nil` appears to release the object, it only relinquishes the strong reference held by the property.  If another object retains `myObject` (e.g., through a delegate or other reference), it won't be deallocated until *all* strong references are removed. This can lead to memory leaks if not carefully managed.