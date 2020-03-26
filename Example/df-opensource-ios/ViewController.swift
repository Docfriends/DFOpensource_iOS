//
//  ViewController.swift
//  df-opensource-ios
//
//  Created by pikachu987 on 01/21/2019.
//  Copyright (c) 2019 pikachu987. All rights reserved.
//

import UIKit
import df_opensource_ios

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let opensourceButton = UIButton(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 150))
        opensourceButton.setTitle("오픈소스", for: .normal)
        opensourceButton.setTitleColor(.black, for: .normal)
        opensourceButton.addTarget(self, action: #selector(self.opensourceTap(_:)), for: .touchUpInside)
        self.view.addSubview(opensourceButton)
        
        let opensource2Button = UIButton(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 150))
        opensource2Button.setTitle("오픈소스2", for: .normal)
        opensource2Button.setTitleColor(.black, for: .normal)
        opensource2Button.addTarget(self, action: #selector(self.opensource2Tap(_:)), for: .touchUpInside)
        self.view.addSubview(opensource2Button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func opensourceTap(_ sender: UIButton) {
        let viewController = OpensourceLicenseViewController(plistPath: Bundle.main.path(forResource: "OpensourceLicense", ofType: "plist"))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func opensource2Tap(_ sender: UIButton) {
        guard let plistPath = Bundle.main.path(forResource: "OpensourceLicense", ofType: "plist"),
            let array = NSArray(contentsOfFile: plistPath) else { return }
        
        let opensources = array.compactMap { element -> Opensource? in
            let value = element as? [String: String]
            return Opensource(name: value?["name"], license: value?["license"], urlPath: value?["urlPath"])
        }
        
        let viewController = OpensourceLicenseViewController(opensources: opensources)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}

extension OpensourceLicenseViewController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "오픈소스"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(self.backAction(_:)))
    }

    @objc private func backAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

    public func opensourceLicesneLoad() {
        print(self.tableView)
        print("....")
    }
}

extension OpensourceLicenseDetailViewController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationItem.title = self.opensource.name ?? ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(self.backAction(_:)))
    }

    @objc private func backAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
