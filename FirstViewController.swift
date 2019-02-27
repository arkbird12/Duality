//
//  FirstViewController.swift
//  Duality
//
//  Created by rishi on 12/3/18.
//  Copyright © 2018 Rishi Thakkar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var topView: UIButton!
    @IBOutlet weak var bottomView: UIButton!
   
    public var topTime = 0.0 // time for top timer in seconds
    public var bottomTime = 0.0 // time for bottom timer in seconds
    public var timer = Timer() // timer class object
    public var isTopActive =  false // boolean to check if top timer is paused/active
    public var isBottomActive = false // boolean to check if bottom timer is paused/active
    
    /* isTopActive and isBottomActive are both set to false if both are paused */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        bottomView.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        topView.setTitle(String(topTime), for: .normal)
        bottomView.setTitle(String(bottomTime), for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /* if parameter = true topTime is incremented forward by 1 second, if param = false bottom incremented by 1 second */
    public func increment(decider : Bool) {
        // NOTE: this function is very "hacky" in future timer class could just be called when timers need to be incremented
        decider == true ? (topTime += 1) : (bottomTime += 1)
    }
    
    /* method for running timer */
    public func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: FirstViewController.updateTimer() , userInfo: <#T##Any?#>, repeats: 1)
    }
    
    /* should be called every 24 hours or at user set time */
    public func resetTimers() {
        topTime = 0
        bottomTime = 0
    }
    
    public func updateTimer() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func touchTop(_ sender: UIButton) {
        isBottomActive = false
        isTopActive = true
        
        
        //bottomView.setTitle("t->b", for: .normal)
    }

    @IBAction func touchBottom(_ sender: UIButton) {
        //topView.setTitle("b->t", for: .normal)
    }
    
    
    func updateViewfromModel() {
        
    }
    

}

