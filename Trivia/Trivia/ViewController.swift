//
//  ViewController.swift
//  Trivia
//
//  Created by Luiz Felipe Véras Gonçalves  on 4/23/18.
//  Copyright © 2018 Luiz Felipe Véras Gonçalves . All rights reserved.
//

import UIKit
class Pergunta{
    private var pergunta:String
    private var respostaCerta:String
    private var respostas:[String]
    private var valorPerunta:Int
    
    
    init(_ pergunta: String,_ resposta: String,_ perguntas: [String],_ valor:Int){
        self.pergunta = pergunta
        self.respostaCerta = resposta
        self.respostas = perguntas
        self.valorPerunta = valor
    }
    func acertou(resposta: String)->Bool{
        return self.respostaCerta == resposta
    }
    func getPergunta()->String{
        return self.pergunta
    }
    func getValorPergunta()->Int{
        return self.valorPerunta
    }
    func getRespostas()->[String]{
        return self.respostas
    }
}


var arrayPerguntas = [Pergunta("Qual o melhor professor do Foundations", "Kiev", ["Fernando Castor","Cristiano","Kiev"],  Int(arc4random_uniform(11))), Pergunta("Pode levar o Mac pra casa", "Não", ["Sim","Claro","Não"],  Int(arc4random_uniform(11))), Pergunta("Qual a linguagem de programação a gente aprende", "Swift", ["Swift","C#","Java"],  Int(arc4random_uniform(11)))]



class ViewController: UIViewController {
    var scr = 0
    var aux = 0
   
    override func viewDidLoad() {
       
        super.viewDidLoad()
    }
    

}

