# Rasterize

![Swift](https://github.com/fourplusone/rasterize/workflows/Swift/badge.svg)

Create rasterized versions of SwiftUI views

## Example

```swift
import SwiftUI
import Rasterize

struct ContentView: View {
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom)

    var body: some View {
        ZStack {
            Rectangle()
                .fill(gradient)
                .cornerRadius(10)

            Text("10")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .rotationEffect(Angle(degrees: -30))
        }
        .frame(width: 100, height: 100)
    }
}

try Rasterized(view: ContentView())
    .bitmapRepresentation().representation(using: .png,
    properties: [:])?
.write(to: URL(fileURLWithPath: "/tmp/demo.png"))
```

## Usage 

This package is available via SwiftPM
```swift
dependencies: [
    .package(url: "https://github.com/fourplusone/rasterize.git", from: "0.1.0")
]
```

## License

This project is licensed under the MIT License. 
