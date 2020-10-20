//
//  secondViewController.swift
//  PersonAppTest1
//
//  Created by IT on 10/16/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class secondViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet var collectionview: UICollectionView!
    
    var arrimg = [ #imageLiteral(resourceName: "c7"), #imageLiteral(resourceName: "c1"),#imageLiteral(resourceName: "c2"),#imageLiteral(resourceName: "c4"),#imageLiteral(resourceName: "c1"),#imageLiteral(resourceName: "c2"),#imageLiteral(resourceName: "c5"),#imageLiteral(resourceName: "c1")]
    var arrlbl = ["Daniyal","Sahir","Sohail","Joe","Ahmad","Caesy","Ali","Hello"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrlbl.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell
        cell.img.image = arrimg[indexPath.row]
        cell.lbl.text = arrlbl[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imagedetail:imageViewController = self.storyboard?.instantiateViewController(identifier: "imageViewController") as! imageViewController
        imagedetail.mainlbl = arrlbl[indexPath.row]
        imagedetail.mainimg = arrimg[indexPath.row]
        self.navigationController?.pushViewController(imagedetail, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
