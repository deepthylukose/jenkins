//
//  NewsDetailViewController.swift
//  login
//
//  Created by simplogics on 22/02/19.
//  Copyright © 2019 simplogics. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var m_imgNews: UIImageView!
    
    @IBOutlet weak var m_lblNews: UILabel!
    
    
    var m_strnews = " "
    var m_strimage = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.m_lblNews.text = m_strnews
        
        
        let url = URL(string: m_strimage)
        let data = try? Data(contentsOf: url!) 
        self.m_imgNews.image = UIImage(data: data!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func m_btnBack(_ sender: Any)
    {
//       let backobj = self.storyboard?.instantiateViewController(withIdentifier: "jsonViewController") as! jsonViewController
//        self.navigationController?.pushViewController(backobj, animated: true)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func m_btnLogout(_ sender: Any) {
        
       
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    
}
