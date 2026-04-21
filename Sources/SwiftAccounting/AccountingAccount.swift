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
//  AccountingAccount.swift
//  SwiftAccounting
//
//  Created by William Mead on 12/04/2026.
//

import Foundation

public final class AccountingAccount: Decodable, AccountingObject {
    
    // MARK: - Properties
    
    public let id: UUID
    public let code: Int
    public let label: String
    public let description: String?
    public let system: String
    public let subAccounts: [AccountingAccount]?
    
    // MARK: - Inits
    
    public init(
        id: UUID = UUID(),
        code: Int,
        label: String,
        description: String? = nil,
        system: String,
        subAccounts: [AccountingAccount]? = nil
    ) {
        self.id = id
        self.code = code
        self.label = label
        self.description = description
        self.system = system
        self.subAccounts = subAccounts
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(code)
        hasher.combine(label)
        if let subAccounts {
            hasher.combine(subAccounts)
        }
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: AccountingAccount, rhs: AccountingAccount) -> Bool {
        lhs.id == rhs.id
        lhs.code = rhs.code
        lhs.label = rhs.label
        lhs.subAccounts == rhs.subAccounts
    }
    
}
