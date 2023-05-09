//
//  SimulationViewController.swift
//  Virus Spread Simulator
//
//  Created by mac on 09.05.2023.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit


class Person {
    var infected: Bool = false
}

class SimulationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var simulationView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = simulationView.frame.size
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureAction(sender:)))
        scrollView.addGestureRecognizer(pinchGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(sender:)))
        scrollView.addGestureRecognizer(panGesture)
        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func pinchGestureAction(sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
            scrollView.contentSize.height = scrollView.contentSize.height * sender.scale
            scrollView.contentSize.width = scrollView.contentSize.width * sender.scale
        }
    }
    @objc func panGestureAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: scrollView)
        scrollView.contentOffset.x -= translation.x
        scrollView.contentOffset.y -= translation.y
        sender.setTranslation(CGPoint.zero, in: scrollView)
    }
}
