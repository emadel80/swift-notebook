import UIKit

/* ===========================================================
 * Author: Victor E. Del Castillo          Date: May 14, 2019
 * Topic:  Classes and Structures        Update: May 14, 2019
 * Source: The Swift Programming Language (Swift 5 beta)
 * =========================================================== */

// Exclusive capabilities of classes:
//
//  - Inheritance
//  - Type casting
//  - Deinitializers
//  - Reference counting

// IMPORTANT: Only use classes if absolutely necessary.
// By default use structures with protocol oriented programming.

// Example of defining a structure:
struct Resolution {                 // Pixel-based display
    var width   = 0
    var height  = 0
}

// Example of defining a class:
class VideoMode: CustomStringConvertible {
    var resolution  = Resolution()
    var interlaced  = false
    var frameRate   = 0.0
    var name: String?
    
    var description: String {
        
        let videoMode = [
            "VideoMode(\(resolution)",
            "interlaced: \(interlaced)",
            "frameRate: \(frameRate)",
            "name: \(name ?? "nil"))"
        ]
        
        return videoMode.joined(separator: ", ")
    }
}

// Full HD video
let hd = Resolution(width: 1920, height: 1080)

// Digital cinema projection
var cinema      = hd
cinema.width    = 2048

//Both HD and Cinema has their own copy (both value types)
print("HD: \(hd)")          // Old HD resolution
print("Cinema: \(cinema)")  // New digital cinema resolution

// 1080i video mode
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name       = "1080i"
tenEighty.frameRate  = 25

print("1080i: \(tenEighty)")

// Both tenEighty and alsoTenEighty refer to the same instance
// They share the same instance
let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30

print(alsoTenEighty)    // frameRate = 30
print(tenEighty)        // frameRate = 30

// Identity check
if alsoTenEighty === tenEighty {
    print("Both refer to the same instance")
}

