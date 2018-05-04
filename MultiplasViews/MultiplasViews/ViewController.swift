//
//  ViewController.swift
//  MultiplasViews
//
//  Created by Luiz Felipe Véras Gonçalves  on 27/04/18.
//  Copyright © 2018 Luiz Felipe Véras Gonçalves . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var meuTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meuTexto.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //esse daqui tem que linkar as storyboards arrastando da caixa em cima e dar um id para o segway(conexao)
    @IBAction func transicaoManual(_ sender: Any) {
        self.performSegue(withIdentifier: "meusegway", sender: self)
    }
    //isso faz parte da funcao de cima e pode ser usado para fazer um condicinal na hora de iniciar a procima atividade ou nao
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if self.meuTexto.text == ""{
            return false
        }
        else{
            return true
        }
    }
    
    //esse aqui tem que dar um id para o view controller no storyboard
    @IBAction func exibeManualmente(_ sender: Any) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "SegundoVC")
        self.present(vc!, animated: false, completion: nil)
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
}

