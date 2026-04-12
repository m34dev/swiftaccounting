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

public class AccountingAccount: AccountingObject {
    
    // MARK: - Properties
    
    public let id: UUID = UUID()
    public var code: String
    public var label: String
    public var description: String?
    public var parentAccount: AccountingAccount?
    public var subAccounts: [AccountingAccount]?
    
    // MARK: - Inits
    
    public init(
        code: String,
        label: String,
        description: String? = nil,
        parentAccount: AccountingAccount? = nil,
        subAccounts: [AccountingAccount]? = nil
    ) {
        self.code = code
        self.label = label
        self.description = description
        self.parentAccount = parentAccount
        self.subAccounts = subAccounts
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: AccountingAccount, rhs: AccountingAccount) -> Bool {
        lhs.id == rhs.id
    }
    
}
