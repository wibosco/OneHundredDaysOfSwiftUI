//
//  EnumView.swift
//  BucketList
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

enum LoadingState: CaseIterable {
    case loading, success, failed
}

struct EnumView: View {
    @State private var loadingState = LoadingState.loading
    
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
        }
        .onReceive(timer) { _ in
            loadingState = LoadingState.allCases.randomElement()!
        }
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading... 🥱")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success! 😁")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed! 😭")
    }
}

#Preview {
    EnumView()
}
