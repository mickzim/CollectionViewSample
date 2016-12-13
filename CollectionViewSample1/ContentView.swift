import UIKit

class ContentView: UIView {
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var title: UILabel!
    @IBOutlet var price: UILabel!
    
    @IBOutlet var details: UILabel!
    
    @IBOutlet var sellerName: UILabel!
    @IBOutlet var sellerAddress: UILabel!
    @IBOutlet var sellerCountry: UILabel!
    @IBOutlet var logo: UIImageView!
    
    var model: Model? {
        didSet {
            let prefWidth = self.frame.size.width - 20 - 100
            
            title.preferredMaxLayoutWidth = prefWidth
            price.preferredMaxLayoutWidth = prefWidth
            details.preferredMaxLayoutWidth = prefWidth
            
            sellerName.preferredMaxLayoutWidth = prefWidth - 60
            sellerAddress.preferredMaxLayoutWidth = prefWidth - 60
            sellerCountry.preferredMaxLayoutWidth = prefWidth - 60
            
            image.image = UIImage(imageName: model?.image)
            logo.image = UIImage(imageName: model?.logo)
            title.text = model?.title
            price.text = model?.price
            details.text = model?.details
            sellerName.text = model?.sellerName
            sellerAddress.text = model?.sellerAddress
            sellerCountry.text = model?.sellerCountry
        }
    }
    
    func prepareForReuse() {
        image.image = nil
        logo.image = nil
        title.text = nil
        price.text = nil
        details.text = nil
        sellerName.text = nil
        sellerAddress.text = nil
        sellerCountry.text = nil
    }
    

}
