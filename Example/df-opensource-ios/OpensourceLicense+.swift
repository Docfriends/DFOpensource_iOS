//import UIKit
//
//extension OpensourceLicenseViewController {
//    open override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        self.navigationItem(
//            titleView: UILabel(text: "OPENSOURCE_LICENSE".localized),
//            left: UIBarButtonItem(image: "icBack", target: self, action: #selector(self.backAction(_:)))
//        )
//    }
//
//    @objc private func backAction(_ sender: UIBarButtonItem) {
//        self.navigationController?.popViewController(animated: true)
//    }
//}
//
//extension OpensourceLicenseDetailViewController {
//    open override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        self.navigationItem(
//            titleView: UILabel(text: self.opensource.name ?? ""),
//            left: UIBarButtonItem(image: "icBack", target: self, action: #selector(self.backAction(_:)))
//        )
//    }
//
//    @objc private func backAction(_ sender: UIBarButtonItem) {
//        self.navigationController?.popViewController(animated: true)
//    }
//}
