//
//  CellStackView.swift
//  CollectionViewSample1
//
//  Created by Zimmermann, Michael on 23.11.16.
//  Copyright © 2016 mobile.de. All rights reserved.
//

import UIKit

class CellStackView: UIView {
    var contentView: ContentStackView!
    
    var model: Model? {
        didSet {
            contentView.model = model
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews(viewName: "ContentStackView")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews(viewName: "ContentStackView")
    }

    func initializeSubviews(viewName: String) {
        if let views = Bundle.main.loadNibNamed(viewName, owner: self, options: nil), views.count > 0, let view = views[0] as? UIView {
            self.contentView = view as! ContentStackView
            self.addSubview(view)
            view.frame = self.bounds
        }
    }
    
    func prepareForReuse() {
        contentView.prepareForReuse()
    }

    
}
