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
//  AccountingPlanPCGFR.swift
//  SwiftAccounting
//
//  Created by William Mead on 21/04/2026.
//

import Foundation

extension AccountingPlan {
    
    // MARK: - Methods
    
    public static func getPCGFR2026() throws -> AccountingPlan {

        let accounts = try PCGFRParser.parsePCGFR(.year2026)

        return AccountingPlan(
            code: "PCGFR2026",
            label: "Plan comptable général",
            description: "Règlement ANC 2014-03",
            countryCodeISO: 250,
            languageCodeISO: "fra",
            version: "1er Janvier 2026",
            effectiveYear: 2026,
            authority: AccountingAuthority.getANC(),
            accounts: accounts
        )
    }
    
    public static func getPCGFR2025() throws -> AccountingPlan {

        let accounts = try PCGFRParser.parsePCGFR(.year2025)

        return AccountingPlan(
            code: "PCGFR2025",
            label: "Plan comptable général",
            description: "Règlement ANC 2014-03",
            countryCodeISO: 250,
            languageCodeISO: "fra",
            version: "1er Janvier 2025",
            effectiveYear: 2025,
            authority: AccountingAuthority.getANC(),
            accounts: accounts
        )

    }
    
    public static func getPCGFR2024() throws -> AccountingPlan {

        let accounts = try PCGFRParser.parsePCGFR(.year2024)

        return AccountingPlan(
            code: "PCGFR2024",
            label: "Plan comptable général",
            description: "Règlement ANC 2014-03",
            countryCodeISO: 250,
            languageCodeISO: "fra",
            version: "1er Janvier 2024",
            effectiveYear: 2024,
            authority: AccountingAuthority.getANC(),
            accounts: accounts
        )

    }
    
}
