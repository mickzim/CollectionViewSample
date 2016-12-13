import UIKit

class AdvertisementCell: UICollectionViewCell {
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        let attr = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
        
        attr.frame.size.height = 300
        
        return attr
    }

}
