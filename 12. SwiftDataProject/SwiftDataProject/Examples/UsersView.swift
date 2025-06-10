//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by William Boles on 10/06/2025.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    
    init(minimumJoinDate: Date,
         sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
}

#Preview {
    UsersView(minimumJoinDate: Date(), sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
