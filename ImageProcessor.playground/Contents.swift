//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!

var rgbaImage = RGBAImage(image: image!)

class ImagesFilter
{

    func NegativeFilter()
    {
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

        let negativeImage = rgbaImage?.toUIImage()
        print(negativeImage)
    }

    func GrayScaleFilter()
    {
         for y in 0..<rgbaImage!.height
        {
            for x in 0..<rgbaImage!.width
            {
                var index = y*rgbaImage!.width+x
                var pixel = rgbaImage?.pixels[index]
                var gray = int(0.21 * (pixel?.red)! + 0.72 * (pixel?.green)! + 0.07 * (pixel?.blue)!)
                pixel?.red = UInt8(gray)
                pixel?.green = UInt8(gray)
                pixel?.blue = UInt8(gray)
                rgbaImage?.pixels[index] = pixel!
            }
        }

        let grayScaleImage = rgbaImage?.toUIImage()
        print(grayScaleImage)
    }


    func ContrastFilter()
    {
    }
}