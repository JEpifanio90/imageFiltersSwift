//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!

var rgbaImage = RGBAImage(image: image!)


for y in 0..<rgbaImage!.height
{
    for x in 0..<rgbaImage!.width
    {
        var index = y*rgbaImage!.width+x
        var pixel = rgbaImage?.pixels[index]
        var red = 255 - (pixel?.red)!
        var green = 255-(pixel?.green)!
        var blue = 255-(pixel?.blue)!
        pixel?.red = UInt8(red)
        pixel?.green = UInt8(green)
        pixel?.blue = UInt8(blue)
        rgbaImage?.pixels[index] = pixel!
    }
}

let grayScale = rgbaImage?.toUIImage()

print(grayScale)