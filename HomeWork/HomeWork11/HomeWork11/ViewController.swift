//
//  ViewController.swift
//  HomeWork11
//
//  Created by Руслан Хомяков on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(share(sender:)))
        view.backgroundColor = .red
    }
    
    @objc func share(sender:UIView){
        
        let itemsToShare = ["Just some text to share"]
        let activityController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: [CustomActivity()])
        
        activityController.excludedActivityTypes = [
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.saveToCameraRoll
            ]
        
        present(activityController, animated: true, completion: nil)
    }


}

