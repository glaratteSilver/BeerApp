//
//  Beer.swift
//  BeerApp
//
//  Created by Jorge Pérez Ramos on 27/12/20.
//

import Foundation
import UIKit

let pathToUnknownImage  = Bundle.main.url(forResource: "magier", withExtension: "png")!//Magier place holder jorge?¿
let unknownImage = UIImage(contentsOfFile: pathToUnknownImage.path)


public class Beer : NSObject, NSCodingn, NSSecureCoding{
    
    public static var supportsSecureCoding: Bool = true
    
    var nameBeer : String
    var typeBeer : String
    var producerBeer : String
    var nationalityBeer : String
    var capBeer : String
    var expDateBeer : String
    var rateBeer : String
    var IDBeer : String
    var IBUBeer : String
    var volBeer : String
    var pictureBeer : UIImage? = nil
    
    override public init() {
        self.nameBeer = "Unkonwn"
        self.typeBeer = "Unkonwn"
        self.producerBeer = "Unkonwn"
        self.nationalityBeer = "Unkonwn"
        self.capBeer = "Unkonwn"
        self.expDateBeer = "Unkonwn"
        self.rateBeer = "Unkonwn"
        self.IDBeer = "Unkonwn"
        self.IBUBeer = "Unkonwn"
        self.volBeer = "Unkonwn"
        self.pictureBeer = unknownImage
    }
    
    init(nameBeer : String,
         typeBeer : String,
         producerBeer : String,
         nationalityBeer : String,
         capBeer : String,
         expDateBeer : String,
         rateBeer : String,
         IDBeer : String,
         IBUBeer : String,
         volBeer : String,
         pictureBeer : UIImage? ) {
        self.nameBeer = nameBeer
        self.typeBeer = typeBeer
        self.producerBeer = producerBeer
        self.nationalityBeer = nationalityBeer
        self.capBeer = capBeer
        self.expDateBeer = expDateBeer
        self.rateBeer = rateBeer
        self.IDBeer = IDBeer
        self.IBUBeer = IBUBeer
        self.volBeer = volBeer
        self.pictureBeer = pictureBeer
    }
    
    init?(_ record: String, _ del: String) {
        let tokens = record.components(separatedBy: del)
        
        guard
            tokens.count == 10, //¿?
            let tempBeerName = tokens.first,
            !tempBeerName.isEmpty
        else {return nil}
        
        let tempTypeBeer = tokens[1]
        guard !tempTypeBeer.isEmpty else {
            return nil
        }
        
        let tempProducerBeer = tokens[2]
        guard !tempProducerBeer.isEmpty else {
            return nil
        }
        
        let tempNationalityBeer = tokens[3]
        guard !tempNationalityBeer.isEmpty else {
            return nil
        }
        
        let tempCapBeer = tokens[4]
        guard !tempCapBeer.isEmpty else {
            return nil
        }
        
        let tempExpDateBeer = tokens[5]
        guard !tempExpDateBeer.isEmpty else {
            return nil
        }
        
        let tempRateBeer = tokens[6]
        guard !tempRateBeer.isEmpty else {
            return nil
        }
        
        let tempIdBeer = tokens[7]
        guard !tempIdBeer.isEmpty else {
            return nil
        }
        
        let tempIbuBeer = tokens[8]
        guard !tempIbuBeer.isEmpty else {
            return nil
        }
        
        let tempVolBeer = tokens[9]
        guard !tempVolBeer.isEmpty else {
            return nil
        }
        
        let tempPicture = tokens[10]
        guard
            !tempPicture.isEmpty,
            let bits = splitIntoNameAndExtension(total: tempPicture),//maxus
            bits.count == 2,//¿?
            let pathPicture = Bundle.main.url(forResource: bits[0], withExtension: bits[1],subdirectory: "beerApp-photos"),//subdirectorychange
            FileManager.default.fileExists(atPath: pathPicture.path),
            let tempPictureImage = UIImage(contentsOfFile: pathPicture.path)
        else {return nil}
        
        self.nameBeer = tempBeerName
        self.typeBeer = tempTypeBeer
        self.producerBeer = tempProducerBeer
        self.nationalityBeer = tempNationalityBeer
        self.capBeer = tempCapBeer
        self.expDateBeer = tempExpDateBeer
        self.rateBeer = tempRateBeer
        self.IDBeer = tempIdBeer
        self.IBUBeer = tempIbuBeer
        self.volBeer = tempVolBeer
        self.pictureBeer = tempPictureImage
        
    }
    
    
    
    
    
    
    
    
    public func encode(with coder: NSCoder) {
        coder.encode(nameBeer, forKey: "BeerName")
        coder.encode(typeBeer, forKey: "typeBeer")
        coder.encode(producerBeer, forKey: "producerBeer")
        coder.encode(nationalityBeer, forKey: "nationalityBeer")
        coder.encode(capBeer, forKey: "capBeer")
        coder.encode(expDateBeer, forKey: "expDateBeer")
        coder.encode(rateBeer, forKey: "rateBeer")
        coder.encode(IDBeer, forKey: "IDBeer")
        coder.encode(IBUBeer, forKey: "IBUBeer")
        coder.encode(volBeer, forKey: "volBeer")
        coder.encode(pictureBeer, forKey: "pictureBeer")
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        
        self.nameBeer = aDecoder.decodeObject(forKey: "BeerName") as! String
        self.typeBeer =  aDecoder.decodeObject(forKey: "typeBeer") as! String
        self.producerBeer = aDecoder.decodeObject(forKey: "producerBeer") as! String
        self.nationalityBeer = aDecoder.decodeObject(forKey: "nationalityBeer") as! String
        self.capBeer = aDecoder.decodeObject(forKey: "capBeer") as! String
        self.expDateBeer = aDecoder.decodeObject(forKey: "expDateBeer") as! String
        self.rateBeer = aDecoder.decodeObject(forKey: "rateBeer") as! String
        self.IDBeer = aDecoder.decodeObject(forKey: "IDBeer") as! String
        self.IBUBeer = aDecoder.decodeObject(forKey: "IBUBeer") as! String
        self.volBeer = aDecoder.decodeObject(forKey: "volBeer") as! String
        self.pictureBeer = aDecoder.decodeObject(forKey: "pictureBeer") as! UIImage?
        
    }
    
    
   
    /*
     public override var descrition: String{}
     
     */
    
    
    
    
}//End Beer Class

