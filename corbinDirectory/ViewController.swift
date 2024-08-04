//
//  ViewController.swift
//  corbinDirectory
//
//  Created by Corbin Lazarone on 8/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButtons()
    }

    func setupButtons() {
        let buttonTitles = [
            ("Instagram", UIColor.black),
            ("LinkedIn", UIColor.black),
            ("Gmail", UIColor.black),
            ("Outlook", UIColor.black),
            ("Twitter", UIColor.black),
            ("Snapchat", UIColor.black)
        ]
        
        var yPosition: CGFloat = 400
        for (title, color) in buttonTitles {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 50, y: yPosition, width: 300, height: 50)
            button.backgroundColor = color
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            
            yPosition += 60
        }
    }

    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        switch title {
        case "Instagram":
            openInstagram()
        case "LinkedIn":
            openLinkedIn()
        case "Gmail":
            openGmail()
        case "Outlook":
            openOutlook()
        case "Twitter":
            openTwitter()
        case "Snapchat":
            openSnapchat()
        default:
            break
        }
    }

    func openInstagram() {
        if let url = URL(string: "instagram://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    func openLinkedIn() {
        if let url = URL(string: "linkedin://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    func openGmail() {
        if let url = URL(string: "googlegmail://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    func openOutlook() {
        if let url = URL(string: "ms-outlook://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    func openTwitter() {
        if let url = URL(string: "twitter://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    func openSnapchat() {
        if let url = URL(string: "snapchat://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
