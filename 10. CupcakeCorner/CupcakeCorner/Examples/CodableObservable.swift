//
//  CodableObservable.swift
//  CupcakeCorner
//
//  Created by William Boles on 06/06/2025.
//

import SwiftUI

@Observable
class UserWithCustomKeys: Codable {
    enum CodingKeys: String, CodingKey {
        //needed to avoid to ensure that the encoded version of this type doesn't
        //include the changes that are added as an Observable type
        case _name = "name"
    }
    
    var name = "Taylor"
}

@Observable
class UserWithoutCustomKeys: Codable {
    var name = "Taylor"
}


struct CodableObservable: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let dataWithoutCustomKeys = try! JSONEncoder().encode(UserWithoutCustomKeys())
        let strWithoutCustomKeys = String(decoding: dataWithoutCustomKeys, as: UTF8.self)
        
        print(strWithoutCustomKeys)
        
        let dataWithCustomKeys = try! JSONEncoder().encode(UserWithCustomKeys())
        let strWithCustomKeys = String(decoding: dataWithCustomKeys, as: UTF8.self)
        
        print(strWithCustomKeys)
    }
}

#Preview {
    CodableObservable()
}
