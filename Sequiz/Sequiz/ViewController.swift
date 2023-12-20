//
//  ViewController.swift
//  Sequiz
//
//  Created by Bianca Maciel Matos on 20/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .accent
                self.view = view
    }

}

