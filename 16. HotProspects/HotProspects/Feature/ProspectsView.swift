//
//  ProspectsView.swift
//  HotProspects
//
//  Created by William Boles on 08/07/2025.
//

import SwiftUI
import SwiftData
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contact people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = (filter == .contacted)
            
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspects) { prospect in
                NavigationLink {
                    EditView(prospect: prospect)
                } label: {
                    VStack(alignment: .leading) {
                        if filter == .none {
                            Image(systemName: prospect.isContacted ? "star.fill" : "star")
                        }
                        
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundStyle(.secondary)
                    }
                    .swipeActions {
                        // the first button gets the full swipe action
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(prospect)
                            try? modelContext.save()
                        }
                        
                        if prospect.isContacted {
                            Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                                prospect.isContacted.toggle()
                            }
                            .tint(.blue)
                        } else {
                            Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                                prospect.isContacted.toggle()
                            }
                            .tint(.green)
                                
                            Button("Remind Me", systemImage: "bell") {
                                addNotification(for: prospect)
                            }
                            .tint(.orange)
                        }
                    }
                    .tag(prospect)
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                if selectedProspects.isEmpty == false {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete Selected", action: delete)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                let uuid = UUID().uuidString
                
                CodeScannerView(codeTypes: [.qr],
                                simulatedData: "\(uuid)\n\(uuid)@example.com",
                                completion: handleScan)
            }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)
            
            modelContext.insert(person)
            try? modelContext.save()
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
            try? modelContext.save()
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9 // will be triggered at 9am
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
