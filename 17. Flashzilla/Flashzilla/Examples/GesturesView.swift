//
//  GesturesView.swift
//  Flashzilla
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI

struct GesturesView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Double Tap")
                .onTapGesture(count: 2) {
                    print("Double tapped!")
                }
            
            Text("Long Press")
                .onLongPressGesture {
                    print("Long pressed!")
                }
            
            Text("Long Press Min Duration")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Long pressed for at least 2 seconds!")
                }
            
            Text("Long Press with Changed")
                .onLongPressGesture {
                    print("Long pressed!")
                } onPressingChanged: { inProgress in
                    print("In progress: \(inProgress)!")
                }
            
            VStack {
                Text("Tap inside a VStack calling child")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            .onTapGesture {
                // shouldn't be printed as child gesture should be called instead
                print("VStack tapped")
            }
            
            VStack {
                Text("Tap inside a VStack calling parent")
                    .onTapGesture {
                        // shouldn't be printed as parent gesture is higer priority
                        print("Text tapped")
                    }
            }
            .highPriorityGesture(
                TapGesture()
                    .onEnded {
                        print("VStack tapped")
                    }
            )
            
            VStack {
                Text("Tap should call both child and parent")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            .simultaneousGesture(
                TapGesture()
                    .onEnded {
                        print("VStack tapped")
                    }
            )
        }
    }
}

#Preview {
    GesturesView()
}
