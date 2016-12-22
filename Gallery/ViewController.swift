//
//  ViewController.swift
//  Gallery
//
//  Created by Кайра Сраилов on 22.12.16.
//  Copyright © 2016 voody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bg: UIImageView!

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    var cnt = 1

    @IBAction func left(_ sender: Any) {
        
        if (cnt == 1){
            cnt = 5
        }else{
            cnt = cnt - 1
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            
            self.bg.alpha = 0.0

        }, completion: { finished in
          self.bg.image = UIImage(named: String(self.cnt) + "." + "jpg")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
                 self.bg.alpha = 1.0
            }, completion: nil)

        })
        
        
    }
    
    @IBAction func right(_ sender: Any) {
        if (cnt == 5){
            cnt = 1
        }else{
            cnt = cnt + 1
        }
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            
            self.bg.alpha = 0.0
            
        }, completion: { finished in
            self.bg.image = UIImage(named: String(self.cnt) + "." + "jpg")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
                self.bg.alpha = 1.0
            }, completion: nil)
            
        })

       
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blur.isHidden = true
        
        
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGestureRight))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGestureLeft(gesture:)))
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeLeft)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func respondToSwipeGestureLeft(gesture: UIGestureRecognizer) {
        
        if (cnt == 1){
            cnt = 5
        }else{
            cnt = cnt - 1
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            
            self.bg.alpha = 0.0
            
        }, completion: { finished in
            self.bg.image = UIImage(named: String(self.cnt) + "." + "jpg")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
                self.bg.alpha = 1.0
            }, completion: nil)
            
        })
        

    }
    
    
     func respondToSwipeGestureRight(gesture: UIGestureRecognizer) {
        if (cnt == 5){
            cnt = 1
        }else{
            cnt = cnt + 1
        }
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            
            self.bg.alpha = 0.0
            
        }, completion: { finished in
            self.bg.image = UIImage(named: String(self.cnt) + "." + "jpg")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
                self.bg.alpha = 1.0
            }, completion: nil)
            
        })

    }

    
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn == true){
            blur.isHidden = false
        }else{
             blur.isHidden = true
        }
    }

    
    @IBAction func slider(_ sender: UISlider) {
        blur.alpha = CGFloat(Double(sender.value))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

