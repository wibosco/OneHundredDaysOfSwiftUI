//
//  SPMView.swift
//  HotProspects
//
//  Created by William Boles on 08/07/2025.
//

import SwiftUI
import SamplePackage

struct SPMView: View {
    let possibleNumbers = 1...60
    
    var results: String  {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    SPMView()
}
