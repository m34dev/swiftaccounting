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
//  AccountingPlan.swift
//  SwiftAccounting
//
//  Created by William Mead on 12/04/2026.
//

import Foundation

public final class AccountingPlan: AccountingObject {
    
    // MARK: - Properties
    
    public let id: UUID
    public let code: String
    public let label: String
    public let description: String
    public let countryCodeISO: Int?
    public let languageCodeISO: String
    public let version: String
    public let effectiveYear: Int
    public let authority: AccountingAuthority
    public let accounts: [AccountingAccount]
    
    // MARK: - Inits
    
    public init(
        id: UUID = UUID(),
        code: String,
        label: String,
        description: String,
        countryCodeISO: Int? = nil,
        languageCodeISO: String,
        version: String,
        effectiveYear: Int,
        authority: AccountingAuthority,
        accounts: [AccountingAccount]
    ) {
        self.id = id
        self.code = code
        self.label = label
        self.description = description
        self.countryCodeISO = countryCodeISO
        self.languageCodeISO = languageCodeISO
        self.version = version
        self.effectiveYear = effectiveYear
        self.authority = authority
        self.accounts = accounts
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: AccountingPlan, rhs: AccountingPlan) -> Bool {
        lhs.id == rhs.id
    }
    
}
