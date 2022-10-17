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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupViews()
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
    }
}
