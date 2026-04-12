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
import CountryKit

public class AccountingPlan: AccountingObject {
    
    // MARK: - Properties
    
    public let id: UUID = UUID()
    public var label: String
    public var description: String
    public var country: Country
    public var language: Locale.Language
    public var version: String
    public var publishDate: Date
    public var effectiveYear: Int
    public var authority: AccountingAuthority
    public var rootClasses: [AccountingAccount]?
    
    // MARK: - Inits
    
    public init(
        label: String,
        description: String,
        country: Country,
        language: Locale.Language,
        version: String,
        publishDate: Date,
        effectiveYear: Int,
        authority: AccountingAuthority,
        rootClasses: [AccountingAccount]? = nil
    ) {
        self.label = label
        self.description = description
        self.country = country
        self.language = language
        self.version = version
        self.publishDate = publishDate
        self.effectiveYear = effectiveYear
        self.authority = authority
        self.rootClasses = rootClasses
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
