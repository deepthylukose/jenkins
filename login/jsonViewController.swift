//
//  jsonViewController.swift
//  login
//
//  Created by simplogics on 22/02/19.
//  Copyright © 2019 simplogics. All rights reserved.
//

import UIKit
import SDWebImage






class jsonViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var m_lblnews: UILabel!
    
    @IBOutlet weak var m_tblnews: UITableView!
    

   
    
   var m_mutarrNews      : NSMutableArray                  = NSMutableArray()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        m_tblnews.delegate = self
        m_tblnews.dataSource = self
        
        let nib = UINib.init(nibName: "jsonTableViewCell", bundle: nil)
        self.m_tblnews.register(nib, forCellReuseIdentifier: "jsonTableViewCell")
        jsonParsing()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return self.m_mutarrNews.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let cell = self.m_tblnews.dequeueReusableCell(withIdentifier: "jsonTableViewCell", for: indexPath) as! jsonTableViewCell
        
        let m_dictNews: NSMutableDictionary = m_mutarrNews[indexPath.row] as! NSMutableDictionary
        
        cell.m_lblnews.text = m_dictNews.object(forKey: "news") as? String
        

        let strImageUrl : String = m_dictNews.object(forKey: "imageUrl") as! String
        let url = URL(string:strImageUrl )
        cell.m_imgnews.sd_setShowActivityIndicatorView(true)
        cell.m_imgnews.sd_setImage(with: url)
        
//        let url = URL(string: strImageUrl)
//        let data = try? Data(contentsOf: url!)
//        cell.m_imgnews.image = UIImage(data: data!)
        
        
        
       
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let newsobj = self.storyboard?.instantiateViewController(withIdentifier: "NewsCellViewController") as! NewsCellViewController
        newsobj.arr = m_mutarrNews
        newsobj.indexPathForCell = indexPath
        
        self.navigationController?.pushViewController(newsobj, animated: true)
        
        //let m_dictDetails: NSMutableDictionary = m_mutarrNews[indexPath.row] as! NSMutableDictionary
        //newsobj.m_dict = m_dictDetails
        // newsobj.m_strnews = m_dictDetails.object(forKey: "news") as! String
        //newsobj.m_strimage = m_dictDetails.object(forKey: "imageUrl") as! String
    }
    
    func jsonParsing()
    {
    
        
        if let path = Bundle.main.path(forResource: "text", ofType: "json")
        {
            do
            {
                if let jsonData : NSData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
                {
                    let  jsonDictionary: NSDictionary  =  try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        m_mutarrNews                      = jsonDictionary.object(forKey: "Dataitems") as! NSMutableArray
                    
                }
            }
            catch  let error as NSError
            {
                print("Error: \(error)")
            }
        }
       
    }
    
    
    @IBAction func m_btnLogout(_ sender: Any)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



    


