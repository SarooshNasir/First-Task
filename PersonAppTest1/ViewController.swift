//
//  ViewController.swift
//  PersonAppTest1
//
//  Created by IT on 10/16/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,DataPass {
    
    
    @IBOutlet weak var tblview: UITableView!
    var data = [dataPopulation]()
    //var array1=["Daniyal","Sahir","Sohail","Joe","Ahmad","Caesy","Ali","Hello"]
    //var array2=["00093949","00193993","00293939","00393939","0049393","00588383","00838396","00799393"]
    //var arrimg=[ #imageLiteral(resourceName: "c3"),#imageLiteral(resourceName: "c8"), #imageLiteral(resourceName: "c6"), #imageLiteral(resourceName: "c7"),#imageLiteral(resourceName: "c2"),#imageLiteral(resourceName: "c1"),#imageLiteral(resourceName: "c4"),#imageLiteral(resourceName: "c2")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(dataPopulation(name: "Daniyal", phone: "00093949", image: #imageLiteral(resourceName: "c3")))
        data.append(dataPopulation(name: "Sahir", phone: "00193993", image: #imageLiteral(resourceName: "c8")))
        data.append(dataPopulation(name: "Soha", phone: "00293939", image: #imageLiteral(resourceName: "c6")))
        data.append(dataPopulation(name: "Joe", phone: "00393939", image: #imageLiteral(resourceName: "c7")))
        data.append(dataPopulation(name: "Ahmad", phone: "0049393", image: #imageLiteral(resourceName: "c2")))
        data.append(dataPopulation(name: "Caesy", phone: "00588383", image: #imageLiteral(resourceName: "c1")))
        data.append(dataPopulation(name: "Ali", phone: "00838396", image: #imageLiteral(resourceName: "c4")))
        data.append(dataPopulation(name: "Hello", phone: "00799393", image: #imageLiteral(resourceName: "c2")))
        
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let item = data[indexPath.row]
        cell.lbl1.text = item.name
        cell.lbl2.text = item.phone
        cell.img.image = item.image
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detail.strlbl1 = data[indexPath.row].name
        detail.strlbl2 = data[indexPath.row].phone
        detail.strimg = data[indexPath.row].image
        self.navigationController?.pushViewController(detail, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            data.remove(at: indexPath.row)
            tblview.deleteRows(at: [indexPath], with: .left)
        }
       
    }
    
    
    
    
    
    
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        let thirdVC=self.storyboard?.instantiateViewController(identifier: "thirdViewController") as! thirdViewController
        thirdVC.delegate = self
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    func dataPassing(name: String, phone: String , image:UIImage) {
        //tblview.beginUpdates()
       // data.append(dataPopulation(name: name, phone: phone, image: image))
        data.insert(dataPopulation(name: name, phone: phone, image: image), at: 0)
        //print(data)
       
        //tblview.insertRows(at: [IndexPath(row: data.count-1, section: 0)], with: .automatic)
        //tblview.endUpdates()
        //data.append(dataPopulation)
        // array1.append(name)
       // array2.append(phone)
       // arrimg.append(image)
        //print(image)
        DispatchQueue.main.async {
            self.tblview.reloadData()
        }
        
    }
    
}
