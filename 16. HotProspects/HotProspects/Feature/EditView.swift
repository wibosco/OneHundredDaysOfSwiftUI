//
//  EditView.swift
//  HotProspects
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Environment(\.modelContext) private var modelContext
    @State var prospect: Prospect
    
    var body: some View {
        Form {
            Section("Name") {
                TextField(prospect.name, text: $prospect.name)
            }
            
            Section("Email Address") {
                TextField(prospect.emailAddress, text: $prospect.emailAddress)
            }
            
            Section {
                Toggle("Contacted", isOn: $prospect.isContacted)
            }
        }
        .navigationTitle("Edit")
        .onChange(of: prospect.name) {
            try? modelContext.save()
        }
        .onChange(of: prospect.emailAddress) {
            try? modelContext.save()
        }
        .onChange(of: prospect.isContacted) {
            try? modelContext.save()
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Prospect.self,
                                           configurations: config)
        let example = Prospect(name: "Tommy Hooper", emailAddress: "tommy.hooper@testing.com", isContacted: true)
        
        return EditView(prospect: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
