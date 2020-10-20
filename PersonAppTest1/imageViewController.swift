//
//  imageViewController.swift
//  PersonAppTest1
//
//  Created by IT on 10/16/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet var iimg: UIImageView!
    @IBOutlet var ilbl: UILabel!
    var mainimg:UIImage!
    var mainlbl:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        iimg.image=mainimg
        ilbl.text=mainlbl
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
