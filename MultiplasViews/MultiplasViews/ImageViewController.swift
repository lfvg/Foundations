//
//  ImageViewController.swift
//  MultiplasViews
//
//  Created by Luiz Felipe Véras Gonçalves  on 30/04/18.
//  Copyright © 2018 Luiz Felipe Véras Gonçalves . All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    var appleImages:[UIImage] = []
    
    
    //essa funcao inicia o array de imagens
    func animarLogo()->[UIImage]{
        var appleArray:[UIImage] = []
     
        for imageCount in 1..<5{
            let image = UIImage(named: "Apple-\(imageCount)")!
            appleArray.append(image)
        }
        
        return appleArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 8.0
        imageView.animationRepeatCount = 0
        imageView.isUserInteractionEnabled = true
        imageView.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appleImages = animarLogo()
        animate(imageView: myImage, images: appleImages)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
