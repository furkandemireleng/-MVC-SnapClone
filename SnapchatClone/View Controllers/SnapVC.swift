//
//  SnapVC.swift
//  SnapchatClone
//
//  Created by MacxbookPro on 18.03.2020.
//  Copyright © 2020 MacxbookPro. All rights reserved.
//

import UIKit
import ImageSlideshow

class SnapVC: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var selectedSnap :Snap?
    
    var inputArray = [KingfisherSource]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let snap = selectedSnap {
            timeLabel.text = "Time Left : \(snap.timeDifference)"
            for imageUrl in snap.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
            let imageSliderShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.5, height: self.view.frame.height * 0.5))
            imageSliderShow.backgroundColor = UIColor.white
            
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.black
            pageIndicator.pageIndicatorTintColor = UIColor.lightGray
            imageSliderShow.pageIndicator = pageIndicator
            
            imageSliderShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSliderShow.setImageInputs(inputArray)
            self.view.addSubview(imageSliderShow)
            self.view.bringSubviewToFront(timeLabel)
        }
    }
    


}
