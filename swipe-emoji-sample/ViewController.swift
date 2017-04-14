//
//  ViewController.swift
//  swipe-emoji-sample
//
//  Created by Zack Esm on 3/29/17.
//  Copyright © 2017 Zack Esm. All rights reserved.
//

import UIKit
import ImagePicker

class ViewController: CardSliderViewController {
    
    let imagePicker = ImagePickerController()
    
    let startButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Start", for: .normal)
        b.layer.backgroundColor = UIColor.green.cgColor
        b.layer.cornerRadius = 5
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure Image Picker
        var configuration = Configuration()
        configuration.recordLocation = false
        
        imagePicker.configuration = configuration
        imagePicker.delegate = self
        
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        layoutButton()
        self.view.addSubview(emojiOptionsOverlay)
    }
    
    func start() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func layoutButton() {
        let margins = view.layoutMarginsGuide
        
        view.addSubview(startButton)
        startButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
            let card = ImageCard(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 60, height: self.view.frame.height * 0.6),image: image)
            cards.append(card)
        }
        startButton.isHidden = true
        layoutCards()
        dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        print("cancelButtonDidPress Called.")
    }
}
