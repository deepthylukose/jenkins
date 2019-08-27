//
//  ViewController.swift
//  login
//
//  Created by simplogics on 22/02/19.
//  Copyright © 2019 simplogics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var m_txtusername: UITextField!
    
    
    @IBOutlet weak var m_txtpassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        self.m_txtusername.text = ""
        self.m_txtpassword.text = ""
    }
    
    
    
    @IBAction func m_btnlogin(_ sender: Any) {
        
     if   self.m_txtusername.text == "Vicky" && self.m_txtpassword.text == "Power123"
        
     {
        print("welcome")
          print("welcome")
          print("welcome")
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "jsonViewController") as! jsonViewController
        self.navigationController?.pushViewController(obj, animated: true)
        }
     else if self.m_txtusername.text == "Vicky" && self.m_txtpassword.text != "Power123"
     {
        let alert = UIAlertController(title: "Alert", message: "Incorrect Password.Login Failed", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        }
     else if self.m_txtusername.text != "Vicky" && self.m_txtpassword.text == "Power123"
     {
        let alert = UIAlertController(title: "Alert", message: "Incorrect Username.Try again", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        }
     else
        
     {
         print("incorrect")
        let alert = UIAlertController(title: "Alert", message: "Incorrect Uername and  Password.Try again", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        }
        
        
        
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

