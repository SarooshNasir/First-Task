//
//  thirdViewController.swift
//  PersonAppTest1
//
//  Created by IT on 10/19/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit
protocol DataPass {
    func dataPassing(name:String , phone:String , image:UIImage)
}

class thirdViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet var txtname: UITextField!
    @IBOutlet var txtphone: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    
    var delegate:DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSaveClick(_ sender: UIButton) {
        delegate.dataPassing(name: txtname.text!, phone: txtphone.text! , image: imageView.image! )
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        let imagecontroller=UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = .photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
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
