//
//  ViewController.swift
//  HomeWork10
//
//  Created by Руслан Хомяков on 26.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var outerCircle: CircleView = {
        let view = CircleView(withRadius: 100)
        view.backgroundColor = .cyan
        return view
    }()
    
    
    lazy var innerCircle: CircleView = {
        let view = CircleView(withDiametr: 100)
        view.backgroundColor = .black
        return view
    }()
    
    lazy var responder: UIButton = {
        let view = UIButton(type: .system)
        view.addTarget(self, action: #selector(hitAction), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(outerCircle)
        view.addSubview(responder)
        view.addSubview(innerCircle)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        outerCircle.center = view.center
        innerCircle.center = view.center
        responder.center = innerCircle.center
        responder.frame = innerCircle.frame
    }
    
    @objc func hitAction() {print("hitAction")}
}

