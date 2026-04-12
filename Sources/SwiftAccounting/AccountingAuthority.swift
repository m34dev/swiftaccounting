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
import CountryKit

public class AccountingAuthority: AccountingObject {
    
    // MARK: - Properties
    
    public let id: UUID = UUID()
    public var name: String
    public var acronym: String?
    public var description: String
    public var websiteURL: String
    public var address: String
    public var zipCode: String
    public var city: String
    public var country: Country
    
    // MARK: - Inits
    
    public init(
        name: String,
        acronym: String? = nil,
        description: String,
        websiteURL: String,
        address: String,
        zipCode: String,
        city: String,
        country: Country
    ) {
        self.name = name
        self.acronym = acronym
        self.description = description
        self.websiteURL = websiteURL
        self.address = address
        self.zipCode = zipCode
        self.city = city
        self.country = country
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
