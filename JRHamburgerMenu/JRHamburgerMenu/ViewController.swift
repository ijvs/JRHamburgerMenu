//
//  ViewController.swift
//  JRHamburgerMenu
//
//  Created by Israel Velazquez on 7/23/18.
//  Copyright © 2018 Israel Jonathan Velazquez Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presentationManager: JRBurgerPresentationManager!
    var secondViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {
            return
        }
        secondViewController = vc
        presentationManager = JRBurgerPresentationManager(sourceViewController: self, presentingController: vc)
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        presentMenu()
    }
    
    func presentMenu() {
        guard let secondViewController = secondViewController else {
            return
        }
        self.present(secondViewController, animated: true)
    }
}
