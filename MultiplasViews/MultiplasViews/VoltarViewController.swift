//
//  VoltarViewController.swift
//  MultiplasViews
//
//  Created by Luiz Felipe Véras Gonçalves  on 27/04/18.
//  Copyright © 2018 Luiz Felipe Véras Gonçalves . All rights reserved.
//

import UIKit

class VoltarViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Voltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
