//
//  ContentView.swift
//  corbinDirectory
//
//  Created by Corbin Lazarone on 8/3/24.
//
import SwiftUI

struct ContentView: View {
    @State private var showingImagePicker = false
    @State private var avatarImage: UIImage? = UIImage(named: "avatarPhoto")
    
    var body: some View {
        VStack(spacing: 20) {
            // Avatar
            if let image = avatarImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
                    .shadow(radius: 10)
                    .onTapGesture {
                        self.showingImagePicker = true
                    }
            }
            
            // Text
            Text("User Name")
                .font(.title)
                .fontWeight(.bold)
            
            // Buttons
            CustomButton(title: "Open Instagram", gradient: LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing), borderColor: .white, borderWidth: 2, action: openInstagram)
            CustomButton(title: "Open LinkedIn", color: Color(hex: 0x0A66C2), borderColor: .white, borderWidth: 2, action: openLinkedIn)
            CustomButton(title: "Open Gmail", gradient: LinearGradient(gradient: Gradient(colors: [Color(hex: 0x3e65cf), Color(hex: 0xc71610), Color(hex: 0xf2a60c), Color(hex: 0x3b60c4), Color(hex: 0x08851b)]), startPoint: .leading, endPoint: .trailing), borderColor: .white, borderWidth: 2, action: openGmail)
            CustomButton(title: "Open Outlook", color: .black, borderColor: .white, borderWidth: 2, action: openOutlook)
            CustomButton(title: "Open Twitter", color: .black, borderColor: .white, borderWidth: 2, action: openTwitter)
            CustomButton(title: "Open Snapchat", color: .black, borderColor: .white, borderWidth: 2, action: openSnapchat)
            CustomButton(title: "Open TikTok", color: .black, borderColor: .white, borderWidth: 2, action: openTikTok)
        }
        .padding()
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
