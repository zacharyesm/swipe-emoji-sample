//
//  ViewController.swift
//  swipe-emoji-sample
//
//  Created by Zack Esm on 3/29/17.
//  Copyright © 2017 Zack Esm. All rights reserved.
//

import UIKit
import ImagePicker

class ViewController: UIViewController {
    
    let imagePicker = ImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
        //Configure Image Picker
        var configuration = Configuration()
        configuration.recordLocation = false
        
        imagePicker.configuration = configuration
        imagePicker.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        present(imagePicker, animated: true, completion: nil)
    }

}

extension ViewController: ImagePickerDelegate {
    public var imageAssets: [UIImage] {
        return AssetManager.resolveAssets(imagePicker.stack.assets)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("wrapperDidPress Called.")
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("doneButtonDidPress Called.")
        let images = imageAssets
        for image in images {
            print(image)
        }
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        print("cancelButtonDidPress Called.")
    }
}
