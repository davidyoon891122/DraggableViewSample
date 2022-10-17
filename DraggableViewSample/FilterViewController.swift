//
//  FilterViewController.swift
//  DraggableViewSample
//
//  Created by iMac on 2022/10/17.
//

import Foundation
import UIKit
import SnapKit

final class FilterViewController: UIViewController {
    private lazy var topView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var topDarkLine: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 3.0
        return view
    }()
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
}

private extension FilterViewController {
    func setupViews() {
        view.addSubview(topView)
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(50.0)
        }
        
        topView.addSubview(topDarkLine)
        
        topDarkLine.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22.0)
            $0.height.equalTo(6.0)
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.centerX.equalToSuperview()
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        topView.addGestureRecognizer(panGesture)
    }
    
    @objc
    func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        guard translation.y >= 0 else { return }
        
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}
