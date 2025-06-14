//
//  AuthenticationView.swift
//  BucketList
//
//  Created by William Boles on 12/06/2025.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                if success {
                    print("Succeeded")
                    isUnlocked = true
                } else {
                    print("Failed")
                    isUnlocked = false
                }
            }
        } else {
            print("Unable to use biometrics")
            isUnlocked = false
        }
    }
}

#Preview {
    AuthenticationView()
}
