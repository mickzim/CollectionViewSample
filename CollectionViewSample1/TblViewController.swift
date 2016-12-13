import UIKit

class TblViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var cellReuseIdentifier = "StackViewCell"
    
    lazy var modelList: [Model] = {
        ModelGenerator().modelList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    @IBAction func touched(_ sender: Any) {
        if let cell = tableView.visibleCells.first, let ip = tableView.indexPath(for: cell) {
            var adModel = Model()
            adModel.isAd = true
            self.modelList.insert(adModel, at: ip.row + 1)
            self.tableView.insertRows(at: [IndexPath(row: ip.row + 1, section: ip.section)], with: UITableViewRowAnimation.automatic)
        }
    }
    
}

extension TblViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelList[indexPath.row]
        let reuseIdentifier = model.isAd ? "AdvertisementCell" : cellReuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let cell = cell as? StackTVCell {
            cell.model = model
        }
        else if let cell = cell as? ConstraintTVCell {
            cell.model = model
        }
        return cell
    }
}

extension TblViewController: UITableViewDelegate {
    
}
