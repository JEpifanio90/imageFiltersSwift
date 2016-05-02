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
                let index = y*rgbaImage!.width+x
                var pixel = rgbaImage?.pixels[index]
                let red = 255 - (pixel?.red)!
                let green = 255-(pixel?.green)!
                let blue = 255-(pixel?.blue)!
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
                let index = y*rgbaImage!.width+x
                var pixel = rgbaImage?.pixels[index]
                let red = 0.21 * Double(pixel!.red)
                let green = 0.72 * Double(pixel!.green)
                let blue = 0.07 * Double(pixel!.blue)
                let gray = red+green+blue
                pixel?.red = UInt8(gray)
                pixel?.green = UInt8(gray)
                pixel?.blue = UInt8(gray)
                rgbaImage?.pixels[index] = pixel!
            }
        }

        let grayScaleImage = rgbaImage?.toUIImage()
        print(grayScaleImage)
    }

    func SepiaFilter()
    {
        for y in 0..<rgbaImage!.height
        {
            for x in 0..<rgbaImage!.width
            {
                let index = y*rgbaImage!.width + x
                var pixel = rgbaImage?.pixels[index]
                let red = (.393 * Double(pixel!.red)) + (.769 * Double(pixel?.green)) + (.189 * Double(pixel?.blue))
                let green = (.349 * Double(pixel!.red)) + (.686 * Double(pixel?.green)) + (.168 * Double(pixel?.blue))
                let blue = (.272 * Double(pixel!.red)) + (.534 * Double(pixel?.green)) + (.131 * Double(pixel?.blue))

                pixel?.red = UInt8(red)
                pixel?.green = UInt8(green)
                pixel?.blue = UInt8(blue)

                rgbaImage?.pixels[index] = pixel!
            }
        }

        let sepiaImage = rgbaImage?.toUIImage()
        print(sepiaImage)
    }

    func CustomOverride()
    {
        print("Give me a value for all the red pixels: ")
        let redUserValue = readLine(stripNewline: true)

        print("Give me a value for all the green pixels: ")
        let greenUserValue = readLine(stripNewline: true)   

        print("Give me a value for all the blue pixels: ")
        let blueUserValue = readLine(stripNewline: true)  

        for y in 0..<rgbaImage!.width
        {
            for x in 0..<rgbaImage!.height
            {
                let index = y * rgbaImage!.width + x
                var pixel = rgbaImage?.pixel[index]
                pixel!.red = UInt8(redUservalue)
                pixel!.green = UInt8(greenUserValue)
                pixel!.blue = UInt8(blueUserValue)
                rgbaImage?.pixels[index]=pixel!
            }
        }

        let customImage = rgbaImage.toUIImage()
        print(customImage)
    }

    func ContrastImage()
    {
        for y in 0..<rgbaImage!.width
        {
            for x in 0..<rgbaImage!.height
            {
                let index = y * rgbaImage!.width + x
                var pixel = rgbaImage?.pixels[index]

                let maxValue = max(pixel!.red, pixel!.green, pixel!.blue)
                let minValue = min(pixel!.red, pixel!.green, pixel!.blue)

                let contrast = UInt8((maxValue*((log(maxValue+pixel!.red))/(log(maxValue+maxValue)))))

                pixel!.red = contrast
                pixel!.green = contrast
                pixel!.blue = contrast

                rgbaImage.pixels[index] = pixel
            }
        }

        let contrastImage = rgbaImage!.toUIImage()
        print (contrastImage)
    }

}


ImagesFilter().GrayScaleFilter()
ImagesFilter().NegativeFilter()
ImagesFilter().SepiaFilter()
ImagesFilter().CustomOverride()
ImagesFilter().ContrastImage()