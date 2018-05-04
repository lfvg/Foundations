//
//  TerceiraViewController.swift
//  MultiplasViews
//
//  Created by Luiz Felipe Véras Gonçalves  on 27/04/18.
//  Copyright © 2018 Luiz Felipe Véras Gonçalves . All rights reserved.
//

import UIKit
//tem que importar isso pra modificar o piker
class TerceiraViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource {
   
    @IBOutlet weak var picker: UIPickerView!
    var dados:[String] = ["Recife", "Maceió", "Aracajú", "João Pessoa", "Natal", "Salvador"]

    @IBOutlet weak var lb: UILabel!
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    //Essa parte é do picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dados.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dados[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        label.text = dados[row]
        if row%2 == 0{
            label.backgroundColor = UIColor.darkGray
            label.textColor = UIColor.white
            //Nao funciona: UITextAlignmentCenter e NSTextAlignmentCenter
            label.textAlignment = .center
            
        }

        else{
            label.backgroundColor = UIColor.gray
            label.textColor = UIColor.black
            label.textAlignment = .center

        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lb.text = dados[row]
    }

    //essa parte é de table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaPadrao")
        cell?.textLabel?.text = dados[indexPath.row]
        return cell!
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        lb.text = dados[0]
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
