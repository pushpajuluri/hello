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
    // var images = [UIImage(named: "accessories"),UIImage(named: "Phones"),UIImage(named: "clothing1"),UIImage(named: "Sports-I")]
}
class CategoriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

        
    @IBOutlet weak var mytableview: UITableView!
    @IBOutlet weak var bagimg: UIImageView!
    
       var categoriesArray = [CategoriesModel]()
       var imagesArray = [CategoriesModel]()
    func getlistofcatName() -> [CategoriesModel]
    {
        
        let selectObj = CategoriesModel()
        selectObj.catName = "Accessories"
        categoriesArray.append(selectObj)
        
        let selectObj1 = CategoriesModel()
        selectObj1.catName = "Electronics"
        categoriesArray.append(selectObj1)
        
        let selectObj2 = CategoriesModel()
        selectObj2.catName = "Fashion "
        categoriesArray.append(selectObj2)
        
        let selectObj3 = CategoriesModel()
        selectObj3.catName = "Sports & Fittness"
        categoriesArray.append(selectObj3)
        return  categoriesArray
    }
    
    func getlistofcaticon() -> [CategoriesModel]
    {
        
        let selectObj = CategoriesModel()
        selectObj.caticon = UIImage(named: "accessories")
        imagesArray.append(selectObj)
        
        let selectObj1 = CategoriesModel()
        selectObj1.caticon = UIImage(named: "Phones")
        imagesArray.append(selectObj1)
        
        let selectObj2 = CategoriesModel()
        selectObj2.caticon = UIImage(named: "clothing1")
        imagesArray.append(selectObj2)
        
        let selectObj3 = CategoriesModel()
        selectObj3.caticon = UIImage(named: "Sports-I")
        imagesArray.append(selectObj3)
        return  imagesArray
    }
   
      override func viewDidLoad() {
   
        getlistofcatName()
        getlistofcaticon()
        self.title = "Categories"
        super.viewDidLoad()
        // inserting the image programatically
        bagimg.image = UIImage(named: "bags")
        //let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        //backgroundImage.image = UIImage(named: "cart")
       // self.view.insertSubview(backgroundImage, at: 0)
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
        let subobj1 = self.imagesArray[indexPath.row]
       
        
        
        cell.mylabel.text = subObj.catName
        cell.myimage.image = subobj1.caticon
        //increasing of label txt size dynamically
       cell.mylabel.numberOfLines = 0
        cell.mylabel.lineBreakMode = .byWordWrapping
        
        cell.mylabel.frame.size.width = 300
        cell.mylabel.sizeToFit()
        
     return cell
    }
    
}
