//
//  CircleView.swift
//  HomeWork10
//
//  Created by Руслан Хомяков on 26.05.2021.
//

import Foundation
import UIKit

class CircleView : UIView {
    
    convenience init(withRadius radius: CGFloat) {
        let diametr = radius * 2
        self.init(frame: CGRect(x: 0, y: 0, width: diametr, height: diametr))
        layer.cornerRadius = radius
    }
    
    convenience init(withDiametr diametr: CGFloat) {
        self.init(frame: CGRect(x: 0, y: 0, width: diametr, height: diametr))
        layer.cornerRadius = diametr/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        let result = view === self ? nil : view
        return result
    }
    
}
