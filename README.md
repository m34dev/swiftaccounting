# Swift Accounting

A Swift package for managing accounting plans and standards across Apple platforms. SwiftAccounting provides a type-safe, modern Swift implementation of accounting structures with built-in support for various national accounting standards.

## Features

- 📊 **Accounting Plans**: Structured representation of chart of accounts with hierarchical support
- 🏛️ **Accounting Authorities**: Model regulatory bodies and accounting standards organizations
- 💼 **Accounting Accounts**: Detailed account information with codes, labels, and sub-accounts
- 🇫🇷 **French PCGFR 2026**: Built-in support for Plan Comptable Général 2026
- 🌍 **Multi-platform**: Supports iOS 18+, macOS 15+, visionOS 2+, watchOS 11+, and tvOS 18+
- ⚡️ **Swift 6**: Built with modern Swift concurrency and sendable types
- 🔒 **Type-safe**: Protocol-oriented design with strong typing

## Requirements

- Swift 6.1+
- iOS 18.0+ / macOS 15.0+ / visionOS 2.0+ / watchOS 11.0+ / tvOS 18.0+

## Installation

### Swift Package Manager

Add SwiftAccounting to your project through Xcode:

1. File → Add Package Dependencies
2. Enter the package repository URL
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/m34dev/SwiftAccounting.git", from: "1.0.0")
]
```

Then add it to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["SwiftAccounting"]
)
```

## Usage

### Working with Accounting Plans

```swift
import SwiftAccounting

// Load the French accounting plan (PCGFR 2026)
let accountingPlan = try AccountingPlan.getPCGFR2026()

print(accountingPlan.label) // "Plan comptable général"
print(accountingPlan.effectiveYear) // 2026
print(accountingPlan.version) // "1er Janvier 2026"
```

### Working with Accounting Authorities

```swift
import SwiftAccounting

// Access the French accounting authority (ANC)
let anc = AccountingAuthority.anc

print(anc.name) // "Autorité des normes comptables"
print(anc.acronym) // "ANC"
print(anc.websiteURL) // "https://www.anc.gouv.fr"
```

### Working with Accounts

```swift
import SwiftAccounting

let accountingPlan = try AccountingPlan.getPCGFR2026()

// Access accounts from the plan
for account in accountingPlan.accounts {
    print("\(account.code): \(account.label)")
    
    // Handle sub-accounts if they exist
    if let subAccounts = account.subAccounts {
        for subAccount in subAccounts {
            print("  \(subAccount.code): \(subAccount.label)")
        }
    }
}
```

## Core Types

### AccountingObject Protocol

All accounting entities conform to `AccountingObject`, which provides:
- `Identifiable` conformance with UUID-based IDs
- `Hashable` and `Equatable` conformance
- `Sendable` support for Swift concurrency

### AccountingAuthority

Represents regulatory bodies and accounting standards organizations. Includes properties for:
- Name and acronym
- Description
- Website URL
- Physical address
- Country code (ISO)

### AccountingPlan

Represents a complete chart of accounts. Includes:
- Label and description
- Country and language codes
- Version and effective year
- Associated authority
- Collection of accounts

### AccountingAccount

Represents individual accounts in the chart. Includes:
- Account code
- Label and description
- System designation
- Optional hierarchical sub-accounts

## Included Standards

### French PCGFR 2026

SwiftAccounting includes the French *Plan Comptable Général* (General Accounting Plan) for 2026, as defined by the Autorité des normes comptables (ANC) under Règlement ANC 2014-03.

```swift
let pcgfr2026 = try AccountingPlan.getPCGFR2026()
```

## Acknowledgments

### French Accounting Plan Data

The French accounting plan (PCGFR) data used in this package is sourced from the [PCG project](https://github.com/arrhes/PCG) by arrhes, which provides a comprehensive JSON representation of the Plan Comptable Général. We are grateful for this well-structured resource that enables accurate accounting plan integration.

## Contributing

Contributions are welcome! This project is maintained by [M34D](https://m34d.com). Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on reporting bugs, suggesting features, submitting changes, and adding new accounting plans.

## Versioning

This project uses [Semantic Versioning](https://semver.org) with the following scheme: MAJOR.MINOR.PATCH

## License

Swift Accounting is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.
