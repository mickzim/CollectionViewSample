import UIKit

class StackCVCell: UICollectionViewCell {

    @IBOutlet var cellContentView: CellStackView!
    var model: Model? {
        didSet {
            cellContentView.model = model
        }
    }
    
    override func prepareForReuse() {
        cellContentView.prepareForReuse()
    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        let attr = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
        
        let desiredHeight: CGFloat = contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        attr.frame.size.height = desiredHeight
        
        return attr
    }

}


class StackTVCell: UITableViewCell {
    @IBOutlet var cellContentView: CellStackView!
    var model: Model? {
        didSet {
            cellContentView.model = model
        }
    }

    override func prepareForReuse() {
        cellContentView.prepareForReuse()
    }
    

}
