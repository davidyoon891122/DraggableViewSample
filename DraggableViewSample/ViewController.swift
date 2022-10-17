//
//  ViewController.swift
//  DraggableViewSample
//
//  Created by iMac on 2022/10/17.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var openViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.setTitleColor(.label.withAlphaComponent(0.3), for: .highlighted)
        
        button.addTarget(self, action: #selector(didTapOpenViewButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        FilterPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

private extension ViewController {
    func setupViews() {
        [
            openViewButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        openViewButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    @objc
    func didTapOpenViewButton() {
        let filterVC = FilterViewController()
        filterVC.modalPresentationStyle = .custom
        filterVC.transitioningDelegate = self
        self.present(filterVC, animated: true, completion: nil)
    }
}

