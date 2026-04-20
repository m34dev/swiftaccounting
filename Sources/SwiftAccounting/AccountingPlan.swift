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
    
    public let id: UUID = UUID()
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

extension AccountingPlan {
    
    public static func getPCGFR2026(includeClass8: Bool = true) throws -> AccountingPlan {
        var accounts = try PCGFRParser.parsePCGFR2026()
        
        if includeClass8 && !accounts.contains(where: { $0.code == 8 }) {
            let class8Accounts = getClass8Accounts()
            accounts.append(class8Accounts)
        }
        
        return AccountingPlan(
            code: "PCGFR2026",
            label: "Plan comptable général",
            description: "Règlement ANC 2014-03",
            countryCodeISO: 250,
            languageCodeISO: "fra",
            version: "1er Janvier 2026",
            effectiveYear: 2026,
            authority: .anc,
            accounts: accounts
        )
    }
    
    /// Returns the Class 8 accounts (Comptes spéciaux) for PCGFR 2026
    private static func getClass8Accounts() -> AccountingAccount {
        return AccountingAccount(
            code: 8,
            label: "Comptes spéciaux",
            description: nil,
            system: "minimal",
            subAccounts: [
                AccountingAccount(
                    code: 80,
                    label: "Engagements",
                    system: "minimal",
                    subAccounts: [
                        AccountingAccount(
                            code: 801,
                            label: "Engagements donnés par l'entité",
                            system: "facultatif",
                            subAccounts: [
                                AccountingAccount(
                                    code: 8011,
                                    label: "Avals, cautions, garanties",
                                    system: "facultatif",
                                    subAccounts: nil
                                ),
                                AccountingAccount(
                                    code: 8014,
                                    label: "Effets circulant sous l’endos de l’entité",
                                    system: "facultatif",
                                    subAccounts: nil
                                ),
                                AccountingAccount(
                                    code: 8016,
                                    label: "Redevances crédit-bail restant à courir",
                                    system: "facultatif",
                                    subAccounts: [
                                        AccountingAccount(
                                            code: 80161,
                                            label: "Crédit-bail mobilier",
                                            system: "facultatif",
                                            subAccounts: nil
                                        ),
                                        AccountingAccount(
                                            code: 80165,
                                            label: "Crédit-bail immobilier",
                                            system: "facultatif",
                                            subAccounts: nil
                                        )
                                    ]
                                ),
                                AccountingAccount(
                                    code: 8018,
                                    label: "Autres engagements donnés",
                                    system: "facultatif",
                                    subAccounts: nil
                                )
                            ]
                        ),
                        AccountingAccount(
                            code: 802,
                            label: "Engagements reçus par l'entité",
                            system: "facultatif",
                            subAccounts: [
                                AccountingAccount(
                                    code: 8021,
                                    label: "Avals, cautions, garanties",
                                    system: "facultatif",
                                    subAccounts: nil
                                ),
                                AccountingAccount(
                                    code: 8024,
                                    label: "Créances escomptées non échues",
                                    system: "facultatif",
                                    subAccounts: nil
                                ),
                                AccountingAccount(
                                    code: 8026,
                                    label: "Engagements reçus pour utilisation en crédit-bail",
                                    system: "facultatif",
                                    subAccounts: [
                                        AccountingAccount(
                                            code: 80261,
                                            label: "Crédit-bail mobilier",
                                            system: "facultatif",
                                            subAccounts: nil
                                        ),
                                        AccountingAccount(
                                            code: 80265,
                                            label: "Crédit-bail immobilier",
                                            system: "facultatif",
                                            subAccounts: nil
                                        )
                                    ]
                                ),
                                AccountingAccount(
                                    code: 8028,
                                    label: "Autres engagements reçus",
                                    system: "facultatif",
                                    subAccounts: nil
                                )
                            ]
                        ),
                        AccountingAccount(
                            code: 809,
                            label: "Contrepartie des engagements",
                            system: "facultatif",
                            subAccounts: [
                                AccountingAccount(
                                    code: 8091,
                                    label: "Contrepartie 801",
                                    system: "facultatif",
                                    subAccounts: nil
                                ),
                                AccountingAccount(
                                    code: 8092,
                                    label: "Contrepartie 802",
                                    system: "facultatif",
                                    subAccounts: nil
                                )
                            ]
                        )
                    ]
                ),
                AccountingAccount(
                    code: 88,
                    label: "Résultat en instance d'affectation",
                    system: "minimal",
                    subAccounts: nil
                ),
                AccountingAccount(
                    code: 89,
                    label: "Bilan",
                    system: "minimal",
                    subAccounts: [
                        AccountingAccount(
                            code: 890,
                            label: "Bilan d'ouverture",
                            system: "minimal",
                            subAccounts: nil
                        ),
                        AccountingAccount(
                            code: 891,
                            label: "Bilan de clôture",
                            system: "minimal",
                            subAccounts: nil
                        )
                    ]
                )
            ]
        )
    }
    
}
