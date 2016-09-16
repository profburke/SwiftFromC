
### SwiftFromC

This project demonstrates creating a dynamic library (.so on Linux,
.dylib on macOS) in Swift that can be used by a C program.




#### Instructions

To run the demo, cd into the project's top directory and type

    make


### Notes

The only tricky part in calling Swift from C is the name mangling. Swift, similarly to C++,
will mangle symbol names horribly during the compilation process. For example, `retieveAnInt`
becomes `__TF10swiftfromc13retrieveAnIntFT_Si`. 

You can figure out what the mangled names are (e.g. run `nm` on the dynamic library) and then reference the mangled
names in your C code. Or, preferably, you can tell the compiler not to mangle the names
by using `@_silgen_name`. See the code for usage details.

As far as I've been able to determine, there is no way to automatically generate the header file needed to delcare the Swift functions for your C code. Although creating the header by hand is easily enough done, if you have any thoughts on how to create it automatically, please don't hesitate to contact me, or generate a pull request.

**2016-09-16**: There's an issue compiling the C application on Linux with the Swift 3 GM. Libdispatch is needed via the `import Foundation` but the linker can't find it. 

A workaround is to add `-L /home/ubuntu/.swiftenv/versions/3.0-GM-CANDIDATE/usr/lib/swift/linux -ldispatch` to the end of the *main* recipe in `csrc/Makefile`. Adjust the path as necessary for your environment.

At the moment, I'm not sure if this is a bug or just that I'm bending the tools out of shape.