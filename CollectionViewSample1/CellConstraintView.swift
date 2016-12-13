//
//  CellConstraintView.swift
//  CollectionViewSample1
//
//  Created by Zimmermann, Michael on 23.11.16.
//  Copyright © 2016 mobile.de. All rights reserved.
//

import UIKit


class CellConstraintView: UIView {
    var contentView: ContentConstraintView!
    
    var model: Model? {
        didSet {
            contentView.model = model
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews(viewName: "ContentConstraintView")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews(viewName: "ContentConstraintView")
    }
    
    func initializeSubviews(viewName: String) {
        if let views = Bundle.main.loadNibNamed(viewName, owner: self, options: nil), views.count > 0, let view = views[0] as? UIView {
            self.contentView = view as! ContentConstraintView
            self.addSubview(view)
            view.frame = self.bounds
        }
    }
    
    
    func prepareForReuse() {
        contentView.prepareForReuse()
    }

    
}
