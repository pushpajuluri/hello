//
//  CategoriesViewController.swift
//  ProductsOnline
//
//  Created by OMNIWYSE on 6/29/17.
//  Copyright © 2017 myschool. All rights reserved.
//

import UIKit
class CategoriesModel{
    var catName = ""
    var catId = ""
    var caticon = ""
    
   
    
}
class CategoriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

        
    @IBOutlet weak var mytableview: UITableView!
    @IBOutlet weak var bagimg: UIImageView!
    
    var categoriesArray = [CategoriesModel]()
    func getlistofcatName() -> [CategoriesModel]
    {
        
        let selectObj = CategoriesModel()
        selectObj.catName = "accessories"
        categoriesArray.append(selectObj)
        
        let selectObj1 = CategoriesModel()
        selectObj1.catName = "Phones"
        categoriesArray.append(selectObj1)
        
        let selectObj2 = CategoriesModel()
        selectObj2.catName = "clothing1 "
        categoriesArray.append(selectObj2)
        
        let selectObj3 = CategoriesModel()
        selectObj3.catName = "Sports-I"
        categoriesArray.append(selectObj3)
        return [categoriesArray as! CategoriesModel]
    }
   
      override func viewDidLoad() {
   
        getlistofcatName()
        
        self.title = "Categories"
        super.viewDidLoad()
        // inserting the image programatically
        bagimg.image = UIImage(named: "bags")
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cart")
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Customcell
        
        let subObj = self.categoriesArray[indexPath.row]
       
        
        
        cell.myimage.image = CategoriesModel.categoriesArray[indexPath.row]
      
        cell.mylabel.text = names[indexPath.row]
        //increasing of label txt size dynamically
       cell.mylabel.numberOfLines = 0
        cell.mylabel.lineBreakMode = .byWordWrapping
        
        cell.mylabel.frame.size.width = 300
        cell.mylabel.sizeToFit()
        
     return cell
    }
    
}
