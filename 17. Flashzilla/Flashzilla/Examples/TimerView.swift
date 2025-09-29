//
//  TimerView.swift
//  Flashzilla
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var time = "Unknown"
    
    var body: some View {
        Text(time)
            .onReceive(timer) { value in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    time = "\(value)"
                }

                counter += 1
            }
    }
}

#Preview {
    TimerView()
}
