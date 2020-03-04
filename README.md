# MisoViewOptional

## SwiftUI package to allow for conditional compilation of modifiers

This is the simplest Swift package ever. It's mostly a design pattern to allow for an optional modifier that returns an AnyView.

### Why?

When you compile something conditionally, sometimes, a modifier is not available in a platform. For example, macOS doesn't support `navigationBarItems`, and you cannot simply do

```
VStack {
   Spacer()
}
#if !os(macOS)
.navigationBarItems(...)
#endif
```

Also, the usual pattern of setting someting to nil doesn't actually work.

There are also some other uses, especially when some modifiers don't support a `nil` default. You can `if` its usage completely away through the `.optional` modifier.

### Why AnyView?

Not only is this not hurting the performance, but also, due to Swift's lack of preprocessor, the `#if` is actually defined as a command. And because the `#else` is undefined, the system cannot determine what should be the return type. There might be a better design pattern, and please don't hesitate to provide a better implementation.

## Usage

```
import MisoViewOptional

VStack {
    Spacer()
}
.frame(width: 123, height: 456)
.optional() { content in
    #if os(macOS)
    return AnyView(content)
    #else
    return AnyView(content.navigationBarTitle("MyTitle")
                          .navigationBarItems(trailing: doneButton))
    #endif
}
```

## Colophon

[The official address for this package][0]

[The git / package url][1]

This package is created and maintained by [Misoservices Inc.][2] and is [licensed under the BSL-1.0: Boost Software License - Version 1.0][3].


[0]: https://github.com/Misoservices/MisoViewOptional
[1]: https://github.com/Misoservices/MisoViewOptional.git
[2]: https://misoservices.com
[3]: https://choosealicense.com/licenses/bsl-1.0/
