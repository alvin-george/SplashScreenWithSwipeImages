//
//  SecondViewController.swift
//  SplashScreenWithSwipeImages
//
//  Created by apple on 30/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate,SlideButtonDelegate {
    
    var swipeImageArray:[String] = []
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var splashImageView: UIImageView!
    
    @IBOutlet weak var sliderButton: MMSlidingButton!
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sliderButton.delegate = self
        addSwipeImages()
        customizeSliderButton()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.sliderButton.delegate = self
        addSwipeImages()
        splashImageView.image =  UIImage(named: swipeImageArray[0])
        pageController.numberOfPages =  swipeImageArray.count
        
        customizeSliderButton()
        
    }
    func customizeSliderButton()
    {
        //sliderButton.buttonText = "SKIP"
       // sliderButton.buttonUnlockedText = ""

       
        
    }
    func buttonStatus(_ status: String, sender: MMSlidingButton) {
        
    }
    
    func addSwipeImages(){
        swipeImageArray = ["first_image","second_image","third_image","fourth_image","fifth_image"]
        
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
        pageController.currentPage += 1
        
        UIView.transition(with: splashImageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.splashImageView.image = UIImage(named: self.swipeImageArray[self.pageController.currentPage])
            
        }, completion: nil)
        
    }
    @IBAction func swipeToRight(_ sender: Any) {
        
        print("swipeRight")
        pageController.currentPage -= 1
        
        UIView.transition(with: splashImageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.splashImageView.image = UIImage(named: self.swipeImageArray[self.pageController.currentPage])
            
            
        }, completion: nil)
        
        
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
