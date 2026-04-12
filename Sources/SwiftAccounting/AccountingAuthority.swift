// Copyright 2026 M34D - William Mead
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  AccountingAuthority.swift
//  SwiftAccounting
//
//  Created by William Mead on 12/04/2026.
//

import Foundation

public final class AccountingAuthority: AccountingObject {
    
    // MARK: - Properties
    
    public let id: UUID = UUID()
    public let name: String
    public let acronym: String?
    public let description: String?
    public let websiteURL: String
    public let address: String
    public let zipCode: String
    public let city: String
    public let countryCodeISO: Int?
    
    // MARK: - Inits
    
    public init(
        name: String,
        acronym: String? = nil,
        description: String? = nil,
        websiteURL: String,
        address: String,
        zipCode: String,
        city: String,
        countryCodeISO: Int? = nil
    ) {
        self.name = name
        self.acronym = acronym
        self.description = description
        self.websiteURL = websiteURL
        self.address = address
        self.zipCode = zipCode
        self.city = city
        self.countryCodeISO = countryCodeISO
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: AccountingAuthority, rhs: AccountingAuthority) -> Bool {
        lhs.id == rhs.id
    }
    
}

extension AccountingAuthority {
    
    public static let anc = AccountingAuthority(
        name: "Autorité des normes comptables",
        acronym: "ANC",
        description: nil,
        websiteURL: "https://www.anc.gouv.fr",
        address: "5 place des Vins de France",
        zipCode: "75012",
        city: "Paris",
        countryCodeISO: 250
    )
}
