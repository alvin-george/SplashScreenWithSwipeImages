//
//  ViewController.swift
//  SplashScreenWithSwipeImages
//
//  Created by apple on 21/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    
    var swipeImageArray:[String] = []

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var splashImageView: UIImageView!
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwipeImages()
        setButtonTitle()
        swipeRight.delegate =  self
        swipeLeft.delegate =  self
        
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        addSwipeImages()
        setButtonTitle()
        
       splashImageView.image =  UIImage(named: swipeImageArray[0])
        
        pageController.numberOfPages =  swipeImageArray.count
       
    
    }
    
    func addSwipeImages(){
        swipeImageArray = ["first_image","second_image","third_image","fourth_image","fifth_image"]
        
 

    }
    func setButtonTitle()
    {
        if (self.pageController.currentPage == (self.swipeImageArray.count - 1))
        {
            self.skipButton.titleLabel?.text = "MOVE TO LOGIN PAGE"
        }
        else{
            self.skipButton.titleLabel?.text = "SKIP NOW"
        }
        
        self.view.reloadInputViews()


    }
    // here are those protocol methods with Swift syntax
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    
    @IBAction func swipeToLeft(_ sender: Any) {
        print("swipeLeft")
        setButtonTitle()
        pageController.currentPage += 1
        
        UIView.transition(with: splashImageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.splashImageView.image = UIImage(named: self.swipeImageArray[self.pageController.currentPage])
            
        }, completion: nil)
        
    }
    @IBAction func swipeToRight(_ sender: Any) {
        
        print("swipeRight")
        setButtonTitle()
        pageController.currentPage -= 1
        
        UIView.transition(with: splashImageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.splashImageView.image = UIImage(named: self.swipeImageArray[self.pageController.currentPage])
            
                        
        }, completion: nil)
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

