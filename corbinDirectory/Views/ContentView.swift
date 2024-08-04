//
//  ContentView.swift
//  corbinDirectory
//
//  Created by Corbin Lazarone on 8/3/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            CustomButton(title: "Open Instagram", gradient: LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing), action: openInstagram)
            CustomButton(title: "Open LinkedIn", color: Color(hex: 0x0A66C2), action: openLinkedIn)
            CustomButton(title: "Open Gmail", color: .black, action: openGmail)
            CustomButton(title: "Open Outlook", color: .black, action: openOutlook)
            CustomButton(title: "Open Twitter", color: .black,  borderColor: .white, borderWidth: 2, action: openTwitter)
            CustomButton(title: "Open Snapchat", color: .black, action: openSnapchat)
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
}
