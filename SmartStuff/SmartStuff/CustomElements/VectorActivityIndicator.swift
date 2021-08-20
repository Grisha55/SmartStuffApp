//
//  VectorActivityIndicator.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 19.08.2021.
//

import UIKit

class VectorActivityIndicator: UIView {
    
    private let activityIndication = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func startAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { (completed) in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(rotationAngle: 0)
            } completion: { (completed) in
                self.startAnimation()
            }
        }
    }
    
    private func configureActivityIndicator() {
        self.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        activityIndication.path = circularPath.cgPath
        activityIndication.fillColor = UIColor.white.cgColor
        activityIndication.strokeColor = UIColor.black.cgColor
        activityIndication.lineWidth = 3
        activityIndication.strokeEnd = 0.5
        activityIndication.lineCap = .round
        
        self.layer.addSublayer(activityIndication)
    }
    
}
