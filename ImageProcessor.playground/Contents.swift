//: Playground - noun: a place where people can play

import UIKit
import Darwin

let image = UIImage(named: "sample")!

// Process the image!

var rgbaImage = RGBAImage(image: image)!

class ImagesFilter
{
    
    func NegativeFilter()
    {
        for y in 0..<rgbaImage.height
        {
            for x in 0..<rgbaImage.width
            {
                let index = y*rgbaImage.width+x
                var pixel = rgbaImage.pixels[index]
                let red = 255 - (pixel.red)
                let green = 255-(pixel.green)
                let blue = 255-(pixel.blue)
                pixel.red = UInt8(red)
                pixel.green = UInt8(green)
                pixel.blue = UInt8(blue)
                rgbaImage.pixels[index] = pixel
            }
        }
        
        let negativeImage = rgbaImage.toUIImage()
        print(negativeImage)
    }
    
    func GrayScaleFilter()
    {
        for y in 0..<rgbaImage.height
        {
            for x in 0..<rgbaImage.width
            {
                let index = y*rgbaImage.width+x
                var pixel = rgbaImage.pixels[index]
                let red = 0.21 * Double(pixel.red)
                let green = 0.72 * Double(pixel.green)
                let blue = 0.07 * Double(pixel.blue)
                let gray = red+green+blue
                pixel.red = UInt8(gray)
                pixel.green = UInt8(gray)
                pixel.blue = UInt8(gray)
                rgbaImage.pixels[index] = pixel
            }
        }
        
        let grayScaleImage = rgbaImage.toUIImage()
        print(grayScaleImage)
    }
    
    func crazyFilter(redInput: UInt, greenInput: UInt, blueInput: UInt)
    {
        for y in 0..<rgbaImage.height
        {
            for x in 0..<rgbaImage.width
            {
                let index = y*rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                let red = redInput
                let green = greenInput
                let blue = blueInput
                pixel.red = UInt8(red)
                pixel.green = UInt8(green)
                pixel.blue = UInt8(blue)
                
                rgbaImage.pixels[index] = pixel
            }
        }
        
        let sepiaImage = rgbaImage.toUIImage()
        print(sepiaImage)
    }
    
    func redOverload()
    {
        
        for y in 0..<rgbaImage.width
        {
            for x in 0..<rgbaImage.height
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                pixel.red = UInt8(255)
                rgbaImage.pixels[index]=pixel
            }
        }
        
        let redOverchargeImage = rgbaImage.toUIImage()
        print(redOverchargeImage)
    }
    func redOverload(redValue:UInt)
    {
        
        for y in 0..<rgbaImage.width
        {
            for x in 0..<rgbaImage.height
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                pixel.red = UInt8(redValue)
                rgbaImage.pixels[index]=pixel
            }
        }
        
        let redOverchargeImage = rgbaImage.toUIImage()
        print(redOverchargeImage)
    }
    
    func blueOverload()
    {
        
        for y in 0..<rgbaImage.width
        {
            for x in 0..<rgbaImage.height
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                pixel.blue = UInt8(255)
                rgbaImage.pixels[index]=pixel
            }
        }
        
        let blueOverchargeImage = rgbaImage.toUIImage()
        print(blueOverchargeImage)
    }
    
    func blueOverload(blueValue:UInt)
    {
        
        for y in 0..<rgbaImage.width
        {
            for x in 0..<rgbaImage.height
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                pixel.blue = UInt8(blueValue)
                rgbaImage.pixels[index]=pixel
            }
        }
        
        let blueOverchargeImage = rgbaImage.toUIImage()
        print(blueOverchargeImage)
    }
    
    func greenOverload()
    {
        
        for y in 0..<rgbaImage.width
        {
            for x in 0..<rgbaImage.height
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                pixel.green = UInt8(255)
                rgbaImage.pixels[index]=pixel
            }
        }
        
        let greenOverChargeImage = rgbaImage.toUIImage()
        print(greenOverChargeImage)
    }
    
    func greenOverload(greenValue: UInt)
    {
        
        for y in 0..<rgbaImage.width
        {
            for x in 0..<rgbaImage.height
            {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                pixel.green = UInt8(greenValue)
                rgbaImage.pixels[index]=pixel
            }
        }
        
        let greenOverChargeImage = rgbaImage.toUIImage()
        print(greenOverChargeImage)
    }
}


var filterName = "grayScale"

switch filterName
{
    case "grayScale":
        ImagesFilter().GrayScaleFilter()
    case "negativeFilter":
        ImagesFilter().NegativeFilter()
    case "redOverload":
        ImagesFilter().redOverload()
    case "redParamOverload":
        ImagesFilter().redOverload(64)
    case "greenOverload":
        ImagesFilter().greenOverload()
    case "greenParamOverload":
        ImagesFilter().greenOverload(183)
    case "blueOverload":
        ImagesFilter().blueOverload()
    case "blueParamOverload":
        ImagesFilter().blueOverload(124)
    case "crazyFilter":
        ImagesFilter().crazyFilter(102, greenInput: 242, blueInput: 134)
    
    default:
        ImagesFilter().GrayScaleFilter()
}

