//
//  ValidatingAndDisablingFormsView.swift
//  CupcakeCorner
//
//  Created by William Boles on 06/06/2025.
//

import SwiftUI

struct ValidatingAndDisablingFormsView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.isEmpty || email.isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidatingAndDisablingFormsView()
}
