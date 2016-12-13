import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var cellReuseIdentifier = "StackViewCell"
    
    lazy var modelList: [Model] = {
        ModelGenerator().modelList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: view.frame.width - 20, height: 100)
            flowLayout.minimumLineSpacing = 10
        }
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }

    @IBAction func buttonTouched(_ sender: Any) {
        if let cell = collectionView.visibleCells.first, let ip = collectionView.indexPath(for: cell) {
            var adModel = Model()
            adModel.isAd = true
            self.modelList.insert(adModel, at: ip.row + 1)
            self.collectionView.insertItems(at: [IndexPath(row: ip.row + 1, section: ip.section)])
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = modelList[indexPath.row]
        let reuseIdentifier = model.isAd ? "AdvertisementCell" : cellReuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        if let cell = cell as? StackCVCell {
            cell.model = model
        }
        else if let cell = cell as? ConstraintCVCell {
            cell.model = model
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewFlowLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
    }
}


class MyCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}



