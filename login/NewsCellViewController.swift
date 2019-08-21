//
//  NewsCellViewController.swift
//  login
//
//  Created by simplogics on 25/02/19.
//  Copyright © 2019 simplogics. All rights reserved.
//

import UIKit
import SDWebImage




class NewsCellViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    
    
    
    
    @IBOutlet weak var m_Collection: UICollectionView!
    

        var m_dict : NSMutableDictionary = NSMutableDictionary()
        var arr : NSMutableArray = NSMutableArray()
        var indexPathForCell: IndexPath = IndexPath()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        m_Collection.delegate = self
        m_Collection.dataSource = self
        
        self.m_Collection.register(UINib(nibName: "NewsCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
    }
    
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.m_Collection.scrollToItem(at: indexPathForCell, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
         
        let m_dictDetails: NSMutableDictionary = arr[indexPath.row] as! NSMutableDictionary
        let cell = self.m_Collection.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath as IndexPath) as! NewsCellCollectionViewCell
        cell.m_Newsreport.text = m_dictDetails.object(forKey: "news") as? String
        
        let strImageUrl : String = m_dictDetails.object(forKey: "imageUrl") as! String
        let url = URL(string: strImageUrl)
        cell.m_Newsimage.sd_setShowActivityIndicatorView(true)
        cell.m_Newsimage.sd_setImage(with: url)
        
       
        return cell
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let cellHeight       =       UIScreen.main.bounds.height - 60
        return CGSize(width: UIScreen.main.bounds.width , height: cellHeight)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func m_btnback(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func m_btnout(_ sender: Any)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func m_btnNext(_ sender: Any)
    {

        let cellSize = view.frame.size

        //get current content Offset of the Collection view
        let contentOffset = m_Collection.contentOffset;

        //scroll to next cell
        self.m_Collection.scrollRectToVisible(CGRect(x:contentOffset.x + cellSize.width,y: contentOffset.y,width: cellSize.width,height: cellSize.height), animated: true);
        

    }
    
    
    @IBAction func m_btnPrevious(_ sender: Any)
    {
        
        let cellSize = view.frame.size
        let contentOffset = m_Collection.contentOffset;
        self.m_Collection.scrollRectToVisible(CGRect(x:contentOffset.x - cellSize.width,y: contentOffset.y,width: cellSize.width,height:cellSize.height), animated: true);
        
//        let visibleItems: NSArray = self.m_Collection.indexPathsForVisibleItems as NSArray
//        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
//        let nextItem: IndexPath = IndexPath(item: currentItem.row - 1, section: 0)
//
//        self.m_Collection.scrollToItem(at: nextItem, at: .right, animated: true)
        
       
     
        
    }
    
    
    
}
