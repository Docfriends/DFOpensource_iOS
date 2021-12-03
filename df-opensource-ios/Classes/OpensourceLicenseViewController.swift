//
// OpensourceLicenseViewController
//

import UIKit
import SafariServices

open class OpensourceLicenseViewController: UIViewController {
    private(set) public var opensources = [Opensource]()
    
    public let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    public init(plistPath: String?) {
        super.init(nibName: nil, bundle: nil)
        
        guard let plistPath = plistPath,
            let array = NSArray(contentsOfFile: plistPath) else { return }
        
        // 오픈소스 데이터 추출
        let opensources = array.compactMap { element -> Opensource? in
            let value = element as? [String: String]
            return Opensource(name: value?["name"], license: value?["license"], urlPath: value?["urlPath"])
        }
        
        self.opensources = opensources
    }
    
    public init(opensources: [Opensource]) {
        super.init(nibName: nil, bundle: nil)
        
        self.opensources = opensources
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        let leadingConstraint = NSLayoutConstraint(item: self.view ?? UIView(), attribute: .leading, relatedBy: .equal, toItem: self.tableView, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self.view ?? UIView(), attribute: .trailing, relatedBy: .equal, toItem: self.tableView, attribute: .trailing, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self.view ?? UIView(), attribute: .top, relatedBy: .equal, toItem: self.tableView, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self.view ?? UIView(), attribute: .bottom, relatedBy: .equal, toItem: self.tableView, attribute: .bottom, multiplier: 1, constant: 0)
        self.view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    open func tableViewCell(_ cell: UITableViewCell) {
        
    }

    open func showDetailViewController(_ opensource: Opensource) {
        let viewController = OpensourceLicenseDetailViewController(opensource)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: UITableViewDelegate
extension OpensourceLicenseViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let opensource = self.opensources[indexPath.row]
        if let urlPath = opensource.urlPath, urlPath != "", let url = URL(string: urlPath) {
            if #available(iOS 9.0, *) {
                let viewController = SFSafariViewController(url: url)
                self.present(viewController, animated: true, completion: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            self.showDetailViewController(opensource)
        }
    }
}

// MARK: UITableViewDataSource
extension OpensourceLicenseViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.opensources.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = self.opensources[indexPath.row]
        // > 들어가있는 모양
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = item.name
        self.tableViewCell(cell)
        return cell
    }
}




