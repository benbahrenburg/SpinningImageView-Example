//
//  ViewController.swift
//  SpinningImageView-Example
//
//  Created by Ben Bahrenburg on 7/19/15.
//  Copyright © 2015 Bencoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var syncButton: UIButton!
    @IBOutlet weak var syncImage: UIImageView!
    @IBOutlet weak var syncContainer: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let syncTapButton = UITapGestureRecognizer(target: self, action: Selector("handleSyncTap:"))
        syncTapButton.delegate = self

        let syncTapView = UITapGestureRecognizer(target: self, action: Selector("handleSyncTap:"))
        syncTapView.delegate = self
        
        syncContainer.addGestureRecognizer(syncTapView)
        syncButton.addGestureRecognizer(syncTapButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func startSpinning() {
        syncImage.image = UIImage(named:"sync-spinning")
        syncImage.startRotating()
    }
    
    func stopSpinning() {
        syncImage.stopRotating()
        syncImage.image = UIImage(named:"sync-not-spinning")
    }
    
    func handleSyncTap(sender: UITapGestureRecognizer? = nil) {
        startSpinning()

        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.stopSpinning()
        })
    }

}

