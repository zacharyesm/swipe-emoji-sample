//
//  ImageCard.swift
//  CardSlider
//
//  Created by Saoud Rizwan on 2/27/17.
//  Copyright © 2017 Saoud Rizwan. All rights reserved.
//

import UIKit

class ImageCard: CardView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        
        // image
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(red: 67/255, green: 79/255, blue: 182/255, alpha: 1.0)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        
        imageView.frame = CGRect(x: 12, y: 12, width: self.frame.width - 24, height: self.frame.height - 24)
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
