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
    
//    let tapSyncMethod = "handleSyncTap:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let syncTapButton = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapButton.delegate = self

        let syncTapView = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapView.delegate = self
        
        syncContainer.addGestureRecognizer(syncTapView)
        syncButton.addGestureRecognizer(syncTapButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func startSpinning() {
        syncImage.image = UIImage(named:"sync-spinning")
        syncImage.startRotating()
    }
    
    func stopSpinning() {
        syncImage.stopRotating()
        syncImage.image = UIImage(named:"sync-not-spinning")
    }
    
    @objc func handleSyncTap(sender: UITapGestureRecognizer? = nil) {
        startSpinning()

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.stopSpinning()
        }
        
    }

}

