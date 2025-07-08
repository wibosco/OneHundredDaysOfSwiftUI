//
//  MainView.swift
//  AccessibilitySandbox
//
//  Created by William Boles on 18/06/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CupcakeCornerView()
                .tabItem {
                    Label("CupcakeCorner", systemImage: "birthday.cake")
                }
            
            WordScrambleView()
                .tabItem {
                    Label("Scramble", systemImage: "character.book.closed")
                }
            
            GuessTheFlagView()
                .tabItem {
                    Label("GuessTheFlag", systemImage: "flag.filled.and.flag.crossed")
                }
            
            VoiceInputView()
                .tabItem {
                    Label("Voice input", systemImage: "hifispeaker.and.homepod.fill")
                }
            
            ValueOfControlsView()
                .tabItem {
                    Label("Controls", systemImage: "faxmachine")
                }
            
            GroupingView()
                .tabItem {
                    Label("Grouping", systemImage: "rectangle.3.group.bubble.left")
                }
            
            LabelsView()
                .tabItem {
                    Label("Labels", systemImage: "speaker.wave.2.bubble.left")
                }
        }
    }
}

#Preview {
    MainView()
}
