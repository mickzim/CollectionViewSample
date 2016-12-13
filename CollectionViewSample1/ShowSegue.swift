import UIKit

class ShowCollectionViewStackSegue: UIStoryboardSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        if let identifier = identifier, let dest = destination as? ViewController {
            dest.cellReuseIdentifier = identifier
        }
    }

    override func perform() {
        super.perform()
    }
}
