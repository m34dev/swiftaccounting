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
//  PCGFRParser.swift
//  SwiftAccounting
//
//  Created by William Mead on 12/04/2026.
//

import Foundation

internal struct PCGFRParser {
    
    // MARK: - DTO types
    
    private struct PCGFile: Decodable {
        let version: Int
        let nested: [NestedAccountDTO]
    }
    
    private struct NestedAccountDTO: Decodable {
        let number: Int
        let label: String
        let system: String
        let accounts: [NestedAccountDTO]
    }
    
    // MARK: - Type methods
    
    internal static func parsePCGFR(_ year: PCGFRYear = .year2026) throws -> [AccountingAccount] {
        let resourceName = "pcg_\(year.rawValue)"
        guard let jsonURL = Bundle.module.url(
            forResource: resourceName,
            withExtension: "json"
        ) else {
            throw PCGFRParserError.fileNotFound
        }
        let data = try Data(contentsOf: jsonURL)
        let pcgFile = try JSONDecoder().decode(PCGFile.self, from: data)
        return pcgFile.nested.map { convert($0) }
    }
    
    private static func convert(_ dto: NestedAccountDTO) -> AccountingAccount {
        let subAccounts = dto.accounts.isEmpty ? nil : dto.accounts.map { convert($0) }
        return AccountingAccount(
            code: dto.number,
            label: dto.label,
            system: dto.system,
            subAccounts: subAccounts
        )
    }
    
}

// MARK: - Errors

internal enum PCGFRParserError: Error {
    case fileNotFound
}

internal enum PCGFRYear: String {
    case year2024 = "2024"
    case year2025 = "2025"
    case year2026 = "2026"
}
