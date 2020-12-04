//
//  SecondViewController.swift
//  TestTransitions
//
//  Created by Alexey Baryshnikov on 29.11.2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    var customColor = UIColor.systemPink
    var customTransitionDelegate = CustomPushAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.backgroundColor = customColor
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelButtonPressed(_ sender: Any) {
//        let name = Notification.Name(rawValue: colorNotificationKey)
//        NotificationCenter.default.post(name: name, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
