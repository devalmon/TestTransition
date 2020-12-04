//
//  ViewController.swift
//  TestTransitions
//
//  Created by Alexey Baryshnikov on 29.11.2020.
//

import UIKit

let colorNotificationKey = "co.onemandev.customColor"

class ViewController: UIViewController {
    let color = Notification.Name(rawValue: colorNotificationKey)
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        createObserver()
    }

    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateColor(notification:)), name: color, object: nil)
    }
    
    @objc
    func updateColor(notification: Notification) {
        self.view.backgroundColor = UIColor.systemPink
    }

    
    private func setup() {
        view.backgroundColor = UIColor.systemTeal
        button.setTitle("Press", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 12
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func buttonPressed() {
        guard let svc = storyboard?.instantiateViewController(identifier: "svc") as? SecondViewController else { return }
        svc.transitioningDelegate = self
        svc.modalPresentationStyle = .fullScreen
        present(svc, animated: true, completion: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPushAnimation()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CutomPopAnimation()
    }
}
