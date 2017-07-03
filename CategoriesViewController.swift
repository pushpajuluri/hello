//
//  CategoriesViewController.swift
//  ProductsOnline
//
//  Created by OMNIWYSE on 6/29/17.
//  Copyright © 2017 myschool. All rights reserved.
//
///////for creation of models/////////////
import UIKit
class CategoriesModel{
    var catName = ""
    var catId = ""
    var caticon:UIImage?
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
    plist()
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
        
        let  obj = self.categoriesArray[indexPath.row]
        let obj1 = self.imagesArray[indexPath.row]
       
        
        
        cell.mylabel.text = obj.catName
        cell.myimage.image = obj1.caticon
    //increasing of label txt size dynamically
        cell.mylabel.numberOfLines = 0
        cell.mylabel.lineBreakMode = .byWordWrapping
        cell.mylabel.frame.size.width = 300
        cell.mylabel.sizeToFit()
    // Next button
      //cell.nxtbtn.tag = imagesArray[indexPath.row]
        //cell.nxtbtn.addTarget(self, action: , for: <#T##UIControlEvents#>)
        
       // cell.nxtbtn.addTarget(self, action: #selector(CategoriesViewController.nxtbtntapped), for: .touchUpInside)
     return cell
    }
    public func nxtbtntapped (){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productslistViewController = storyboard.instantiateViewController(withIdentifier: "ProductsListViewController") as! ProductsListViewController
        self.navigationController?.pushViewController(productslistViewController, animated: true)
    
    
    }
   func plist(){
    
    let fileManager = FileManager.default
        let docpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let pathStr = docpath!+"/pushpa.plist"
    if(fileManager.fileExists(atPath: pathStr)){
        print(pathStr)
        var catarray = NSArray(contentsOfFile: pathStr) as? NSMutableArray
        catarray = NSMutableArray()
        
        let catdict = NSMutableDictionary()
        catdict.setObject(categoriesArray, forKey: "categoriesArray" as NSCopying)
        catarray?.add(catdict)
        let plistxml = FileManager.default.contents(atPath: "pushpa.plist")
        print (plistxml)
        let fileStatus = catarray?.write(to: URL(fileURLWithPath:pathStr), atomically: true)
        print("File status is \(fileStatus)")
        print(catdict)
        
    }
    
    }
    //let k = plist(named: "puhpa.plist")?.array
    
}
