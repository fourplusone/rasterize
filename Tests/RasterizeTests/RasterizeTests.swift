import XCTest
import SwiftUI
@testable import Rasterize

let testColor = NSColor(displayP3Red: 0.2, green: 0.4, blue: 0.4, alpha: 1.0)

struct TestView : View {
    var body: some View {
        Rectangle()
            .background(Color(testColor))
            .frame(width: 100, height: 100)
    }
}

final class RasterizeTests: XCTestCase {
    func simpleTest() {
        let representation = Rasterized(view: TestView()).bitmapRepresentation()
        XCTAssertTrue(testColor.isEqual(representation.colorAt(x: 10, y: 10)))
        XCTAssertTrue(NSSize(width: 100, height: 100).equalTo(representation.size))
    }

    static var allTests = [
        ("simpleTest", simpleTest),
    ]
}
