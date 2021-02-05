//
//  ViewController.swift
//  VKapp
//
//  Created by MacBook on 25.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var Scroll: UIScrollView!
    
    var devActiv: Bool = false
    var deviceTyp: String = "iPhone"
    
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var log: UITextField!
    @IBOutlet weak var invalidUser: UILabel!
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            devActiv = true
            if deviceTyp == "iPhone" {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 350), animated: true)
            }
            if deviceTyp == "iPad" {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
        } else {
            devActiv = false
            
        }
        print (devActiv, deviceTyp)
    }
    
    @IBAction func button(_ sender: Any) {
        let storyoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyoard.instantiateViewController(identifier: "lowerBar")
        
        if pass.text == "123" && log.text == "123"{
            self.present(vc, animated: true, completion: nil)
            print("Вы вошли")
        } else {
            invalidUser.text = "Неверный логин или пароль"
        }
    }
    		
    @IBAction func login(_ sender: Any) {
        if deviceTyp == "iPhone" {
            if devActiv == true {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 430), animated: true)
            } else {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 300), animated: true)
            }
        }
        if deviceTyp == "iPad" {
            if devActiv == true {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 330), animated: true)
            } else {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
        }
    }
    
    @IBAction func password(_ sender: Any) {
        if deviceTyp == "iPhone" {
            if devActiv == true {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 430), animated: true)
            } else {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 300), animated: true)
            }
        }
        if deviceTyp == "iPad" {
            if devActiv == true {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 330), animated: true)
            } else {
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
        }
    }

    @IBAction func tap(_ sender: Any) {
        if deviceTyp == "iPad" {
            if devActiv == false {
                log.resignFirstResponder()
                pass.resignFirstResponder()
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
            if devActiv == true {
                log.resignFirstResponder()
                pass.resignFirstResponder()
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
            
        }
        if deviceTyp == "iPhone"{
            if devActiv == false {
                log.resignFirstResponder()
                pass.resignFirstResponder()
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
            if devActiv == true {
                log.resignFirstResponder()
                pass.resignFirstResponder()
                self.Scroll.setContentOffset(CGPoint(x: 0, y: 350), animated: true)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceType()
        // Do any additional setup after loading the view.
        
    }
}

extension ViewController {
    func deviceType() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            deviceTyp = "iPad"
        } else {
            deviceTyp = "iPhone"
        }
    }
}

