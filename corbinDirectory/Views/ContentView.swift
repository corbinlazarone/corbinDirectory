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
            CustomButton(title: "Open Instagram", color: .black, action: openInstagram)
            CustomButton(title: "Open LinkedIn", color: .black, action: openLinkedIn)
            CustomButton(title: "Open Gmail", color: .black, action: openGmail)
            CustomButton(title: "Open Outlook", color: .black, action: openOutlook)
            CustomButton(title: "Open Twitter", color: .black, action: openTwitter)
            CustomButton(title: "Open Snapchat", color: .black, action: openSnapchat)
        }
        .padding()
    }

    func openInstagram() {
        if let url = URL(string: "instagram://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("can not open url")
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
