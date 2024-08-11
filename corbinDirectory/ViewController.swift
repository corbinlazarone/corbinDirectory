//
//  ViewController.swift
//  corbinDirectory
//
//  Created by Corbin Lazarone on 8/3/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let avatarImageView = UIImageView()
    let editIconView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupAvatarAndText()
        setupButtons()
    }

    func setupAvatarAndText() {
        // Avatar
        avatarImageView.frame = CGRect(x: (view.frame.width - 100) / 2, y: 100, width: 100, height: 100)
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        avatarImageView.isUserInteractionEnabled = true
        view.addSubview(avatarImageView)
        
        // Load saved avatar
        if let savedImage = loadAvatarImage() {
            avatarImageView.image = savedImage
        } else {
            avatarImageView.image = UIImage(named: "avatarPhoto")
        }
        
        // Edit Icon
        let editIcon = UIImage(systemName: "pencil.circle.fill")
        editIconView.image = editIcon
        editIconView.tintColor = .white
        editIconView.frame = CGRect(x: avatarImageView.frame.maxX - 30, y: avatarImageView.frame.maxY - 30, width: 30, height: 30)
        view.addSubview(editIconView)

        // Tap Gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editAvatar))
        avatarImageView.addGestureRecognizer(tapGesture)

        // Text
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 230, width: view.frame.width, height: 30))
        nameLabel.text = greetingBasedOnTime()
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
    }

    @objc func editAvatar() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }

    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            avatarImageView.image = editedImage
            saveAvatarImage(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            avatarImageView.image = originalImage
            saveAvatarImage(image: originalImage)
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    // Save avatar image to UserDefaults
    func saveAvatarImage(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(data, forKey: "avatarImage")
        }
    }

    // Load avatar image from UserDefaults
    func loadAvatarImage() -> UIImage? {
        if let data = UserDefaults.standard.data(forKey: "avatarImage") {
            return UIImage(data: data)
        }
        return nil
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
        if let url = URL(string: "instagram://app") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://instagram.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }

    func openLinkedIn() {
        if let url = URL(string: "linkedin://app") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://linkedin.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }

    func openGmail() {
        if let url = URL(string: "googlegmail://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://mail.google.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }

    func openOutlook() {
        if let url = URL(string: "ms-outlook://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://outlook.live.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }

    func openTwitter() {
        if let url = URL(string: "twitter://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://twitter.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }

    func openSnapchat() {
        if let url = URL(string: "snapchat://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://snapchat.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }

    func openTikTok() {
        if let url = URL(string: "tiktok://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if let webURL = URL(string: "https://tiktok.com") {
                    UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
                }
            }
        }
    }
}
