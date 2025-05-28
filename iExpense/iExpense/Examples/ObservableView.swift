//
//  ObservableView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//

import SwiftUI

import Observation //can expand the @Obervable marco to see it is actually doing
import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ObservableView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

#Preview {
    ObservableView()
}
