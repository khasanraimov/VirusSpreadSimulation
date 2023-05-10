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
    
    var count: Int?

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var simulationView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let count = count {
            addLabels(count: count, container: simulationView)
        }
        
        
        scrollView.contentSize = simulationView.frame.size
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureAction(sender:)))
        scrollView.addGestureRecognizer(pinchGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(sender:)))
        scrollView.addGestureRecognizer(panGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        if let label = sender.view as? UILabel {
            label.backgroundColor = UIColor.white // Удаляем эту строку, если есть в вашем коде
            label.layer.backgroundColor = UIColor.red.cgColor // Перекрашиваем метку в красный цвет
            
        }
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
    
    func addLabels(count: Int, container: UIView) {
        
        var xPosition: CGFloat = 20
        var yPosition: CGFloat = 20
        let labelWidth: CGFloat = 30
        let labelHeight: CGFloat = 30
        
        for i in 1...count {
            let label = UILabel(frame: CGRect(x: xPosition, y: yPosition, width: labelWidth, height: labelHeight))
            label.text = "O"
            label.textAlignment = .center
            label.backgroundColor = .white
            
            // Создаем UITapGestureRecognizer для label
            let tapGestureRecognizer = UITapGestureRecognizer(target: label, action: #selector(labelTapped(_:)))
            label.addGestureRecognizer(tapGestureRecognizer)
            label.isUserInteractionEnabled = true
            label.setNeedsDisplay()
            
            container.addSubview(label)
            
            xPosition += labelWidth + 10 // Расстояние между элементами
            if i % 10 == 0 {
                xPosition = 20
                yPosition += labelHeight + 10
            }
        }
    }

}


