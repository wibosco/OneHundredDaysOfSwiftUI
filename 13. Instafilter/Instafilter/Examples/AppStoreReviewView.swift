//
//  AppStoreReviewView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import StoreKit
import SwiftUI

struct AppStoreReviewView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    AppStoreReviewView()
}
