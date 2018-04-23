//
//  ViewController.swift
//  testeui
//
//  Created by Luiz Felipe Véras Gonçalves  on 4/23/18.
//  Copyright © 2018 Luiz Felipe Véras Gonçalves . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var control = true
    
    @IBOutlet weak var meuLabel: UILabel!
    @IBOutlet weak var meuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var button: UIButton!
    @IBAction func onClickButton(_ sender: Any) {
        if control{
            meuLabel.text = "Eu falei pra não clicar porra!!!"
            button.setTitle("Desculpa", for: .normal)
        }
        else{
            meuLabel.text = ""
            button.setTitle("Não Clique aqui", for: .normal)
            
        }
        control = !control
    }
    
}

