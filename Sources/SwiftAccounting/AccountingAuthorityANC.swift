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
//  AccountingAuthorityANC.swift
//  SwiftAccounting
//
//  Created by William Mead on 21/04/2026.
//

import Foundation

extension AccountingAuthority {
    
    // MARK: - Methods
    
    public static func getANC() -> AccountingAuthority {
        return  AccountingAuthority(
            id: UUID(),
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
    
}
