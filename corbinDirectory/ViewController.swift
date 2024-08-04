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
           view.backgroundColor = .black
           setupAvatarAndText()
           setupButtons()
       }
    
    func setupAvatarAndText() {
           // Avatar
           let avatarImageView = UIImageView(image: UIImage(named: "avatarPhoto"))
           avatarImageView.frame = CGRect(x: (view.frame.width - 100) / 2, y: 100, width: 100, height: 100)
           avatarImageView.layer.cornerRadius = 50
           avatarImageView.clipsToBounds = true
           view.addSubview(avatarImageView)
           
           // Text
           let nameLabel = UILabel(frame: CGRect(x: 0, y: 230, width: view.frame.width, height: 30))
           nameLabel.text = greetingBasedOnTime()
           nameLabel.textAlignment = .center
           nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
           nameLabel.textColor = .white
           view.addSubview(nameLabel)
       }

    func setupButtons() {
        let buttonTitles: [(String, Any)] = [
            ("Instagram", UIColor.clear),
            ("LinkedIn", 0x0A66C2),
            ("Gmail", UIColor.clear),
            ("Outlook", UIColor.clear),
            ("X", UIColor.black),
            ("Snapchat", 0xFFFC00),
            ("TikTok", UIColor.black)
        ]
        
        var yPosition: CGFloat = 300
        for (title, color) in buttonTitles {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 50, y: yPosition, width: 300, height: 50)
            if title == "Instagram" {
                applyInstagramGradientToButton(button)
            } else if title == "Gmail" {
                applyGmailGradientToButton(button)
            } else if title == "Outlook" {
                applyOutlookGradientToButton(button)
            } else if title == "TikTok" {
                applyTikTokGradient(button)
            }
            else if let hexColor = color as? Int {
                button.backgroundColor = UIColor(hex: hexColor)
            } else if let uiColor = color as? UIColor {
                button.backgroundColor = uiColor
            }
            if title == "Snapchat" {
                button.setTitleColor(.black, for: .normal)
            } else {
                button.setTitleColor(.white, for: .normal)
            }
            if title == "X" {
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.white.cgColor
            }
            button.setTitle(title, for: .normal)
            button.layer.cornerRadius = 8
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            
            yPosition += 60
        }
    }
    
    func greetingBasedOnTime() -> String {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        switch currentHour {
        case 0...11:
            return "Good morning"
        case 12...19:
            return "Good afternoon"
        default:
            return "Good night"
        }
    }
    
    func applyInstagramGradientToButton(_ button: UIButton) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = button.bounds
        gradientLayer.cornerRadius = 8
        button.layer.insertSublayer(gradientLayer, at: 0)
        
        button.layer.masksToBounds = true
        gradientLayer.frame = button.bounds
    }
    
    func applyGmailGradientToButton(_ button: UIButton) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [
               UIColor(hex: 0x3e65cf).cgColor,
               UIColor(hex: 0xc71610).cgColor,
               UIColor(hex: 0xf2a60c).cgColor,
               UIColor(hex: 0x3b60c4).cgColor,
               UIColor(hex: 0x08851b).cgColor
           ]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0)
           gradientLayer.endPoint = CGPoint(x: 1, y: 1)
           gradientLayer.frame = button.bounds
           gradientLayer.cornerRadius = 8
           button.layer.insertSublayer(gradientLayer, at: 0)
           
           button.layer.masksToBounds = true
           gradientLayer.frame = button.bounds
       }
    
    func applyOutlookGradientToButton(_ button: UIButton) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [
               UIColor(hex: 0x54daff).cgColor,
               UIColor(hex: 0x249ee4).cgColor,
               UIColor(hex: 0x0078d4).cgColor,
               UIColor(hex: 0x034fa0).cgColor,
               UIColor(hex: 0x0f3464).cgColor
           ]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0)
           gradientLayer.endPoint = CGPoint(x: 1, y: 1)
           gradientLayer.frame = button.bounds
           gradientLayer.cornerRadius = 8
           button.layer.insertSublayer(gradientLayer, at: 0)
           
           button.layer.masksToBounds = true
           gradientLayer.frame = button.bounds
       }
    
    func applyTikTokGradient(_ button: UIButton) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [
               UIColor(hex: 0x000000).cgColor,
               UIColor(hex: 0x00f2ea).cgColor,
               UIColor(hex: 0xff0050).cgColor,
           ]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0)
           gradientLayer.endPoint = CGPoint(x: 1, y: 1)
           gradientLayer.frame = button.bounds
           gradientLayer.cornerRadius = 8
           button.layer.insertSublayer(gradientLayer, at: 0)
           
           button.layer.masksToBounds = true
           gradientLayer.frame = button.bounds
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
        case "X":
            openTwitter()
        case "Snapchat":
            openSnapchat()
        case "TikTok":
            openTikTok()
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
    
    func openTikTok() {
        if let url = URL(string: "musically://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
