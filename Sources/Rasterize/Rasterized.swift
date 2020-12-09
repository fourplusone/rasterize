import Cocoa
import SwiftUI


/// A rasterized version of a SwiftUI View
public struct Rasterized<V> where V : View {
    
    /// The view which will be rasterized
    public var view: V
    
    /// The scale factor to be used
    public var scaleFactor : CGFloat
    
    public init(view: V, scaleFactor: CGFloat = 1.0) {
        self.view = view
        self.scaleFactor = scaleFactor
    }
    
    /// Create a bitmap representation of the view
    /// - Returns: The bitmap representation.
    public func bitmapRepresentation() -> NSBitmapImageRep {
        let hostingView = NSHostingView(rootView: view)
        let size = hostingView.intrinsicContentSize
        hostingView.frame = NSRect(origin: .zero, size: size)
        
        let context = CGContext(data: nil,
                                width: Int(size.width * scaleFactor),
                                height: Int(size.height * scaleFactor),
                                bitsPerComponent: 16,
                                bytesPerRow: 0,
                                space: CGColorSpace(name: CGColorSpace.displayP3)!,
                                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        context.scaleBy(x: scaleFactor, y: scaleFactor)
        
        let graphicsContext = NSGraphicsContext(cgContext: context, flipped: false)
        
        hostingView.displayIgnoringOpacity(hostingView.bounds, in: graphicsContext)
        
        return NSBitmapImageRep(cgImage: context.makeImage()!)
    }
}
