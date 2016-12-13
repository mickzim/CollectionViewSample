import Foundation
import UIKit


extension UIImage {
    convenience init?(imageName: String?) {
        guard let imageName = imageName else {
            return nil
        }
        self.init(named: imageName)
    }
}