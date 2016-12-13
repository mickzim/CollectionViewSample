import Foundation

struct Model {
    var image: String?
    var title: String?
    var price: String?
    var details: String?
    var sellerName: String?
    var sellerAddress: String?
    var sellerCountry: String?
    var logo: String?
    var isAd = false
}

class ModelBuilder {
    var model = Model()
    func image(_ image: String?) -> ModelBuilder {
        model.image = image
        return self
    }
    func title(_ title: String?) -> ModelBuilder {
        model.title = title
        return self
    }
    func price(_ price: String?) -> ModelBuilder {
        model.price = price
        return self
    }
    func details(_ details: String?) -> ModelBuilder {
        model.details = details
        return self
    }
    func sellerName(_ sellerName: String?) -> ModelBuilder {
        model.sellerName = sellerName
        return self
    }
    func sellerAddress(_ sellerAddress: String?) -> ModelBuilder {
        model.sellerAddress = sellerAddress
        return self
    }
    func sellerCountry(_ sellerCountry: String?) -> ModelBuilder {
        model.sellerCountry = sellerCountry
        return self
    }
    func logo(_ logo: String?) -> ModelBuilder {
        model.logo = logo
        return self
    }
}

class ModelGenerator {
    
    var modelList: [Model] {
        var a: [Model] = []
        for _ in 0...200 {
            a.append(model)
        }
        return a
    }
    
    var imgNr: UInt32? {
        let n = arc4random_uniform(11)
        if n >= 10 {
            return nil
        }
        return n
    }
    
    var image: String? {
        if let imgNr = imgNr {
            return "img\(imgNr)"
        }
        return nil
    }
    
    var logo: String? {
        if let imgNr = imgNr {
            return "logo\(imgNr)"
        }
        return nil
    }
    
    var model: Model {
        return ModelBuilder()
            .image(image)
            .logo(logo)
            .title(randomSentenceWithLength(5..<20))
            .price(randomNumberWithLength(0..<6))
            .details(randomSentenceWithLength(0..<100))
            .sellerName(randomStringWithLength(5..<25))
            .sellerAddress(randomStringWithLength(0..<50))
            .sellerCountry(randomStringWithLength(0..<50))
            .model
    }
    
    func randomNumberWithLength(_ r: Range<UInt>) -> String? {
        return "0123456789".randomStringWithLength(r)
    }
    
    func randomStringWithLength(_ r: Range<UInt>) -> String? {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ".randomStringWithLength(r)
    }
    
    func randomSentenceWithLength(_ r: Range<UInt>) -> String? {
        let rand = max(arc4random_uniform(UInt32(r.upperBound / 5)), 2)
        var str = ""
        for _ in 1...rand {
            if let s = randomStringWithLength(2..<8) {
                str = str + " " + s
            }
        }
        return str == "" ? nil : str
    }
    
}

extension String {
    func randomStringWithLength(_ r: Range<UInt>) -> String?  {
        
        var str: String = ""
        
        let mi = UInt(arc4random_uniform(UInt32(r.upperBound-r.lowerBound)))+r.lowerBound
        
        for _ in r.lowerBound..<mi {
            let length = UInt32 (characters.count)
            let rand = arc4random_uniform(length)
            str = str + self[Int(rand)]
        }
        
        return str == "" ? nil : str
    }
    
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: r.lowerBound)
        let end = characters.index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
    
}
