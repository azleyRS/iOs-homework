//
//  CustomActivity.swift
//  HomeWork11
//
//  Created by Руслан Хомяков on 10.07.2021.
//

import UIKit

class CustomActivity: UIActivity {
    
    override var activityType: UIActivity.ActivityType? {
        guard let bundleId = Bundle.main.bundleIdentifier else {return nil}
        return UIActivity.ActivityType(rawValue: bundleId + "\(self.classForCoder)")
    }
    
    override var activityTitle: String? {
        return "Custom Activity title"
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "heart")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }

    override func perform() {
        print("custom activity perform was called")
        UIApplication.shared.open(URL(string: "https://www.google.com")!)
        activityDidFinish(true)
    }
}
