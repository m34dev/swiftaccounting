# Contributing to Swift Accounting

Thank you for your interest in contributing to Swift Accounting! This document provides guidelines to help you get started.

## Reporting Bugs

If you find a bug, please [open an issue](https://github.com/m34dev/swiftaccounting/issues/new) and include:

- A clear description of the problem
- Steps to reproduce the issue
- Expected vs. actual behavior
- The Swift and Xcode versions you are using

## Suggesting Features

For feature requests (e.g. support for a new accounting plan), please open an issue first to discuss the idea before submitting code.

## Submitting Changes

1. Fork the repository
2. Create a branch from `main` (e.g. `feature/add-accounting-plan` or `fix/accounting-account`)
3. Make your changes
4. Ensure the project builds and any tests pass
5. Submit a merge request against `main`

## Code Style

This project uses [SwiftLint](https://github.com/realm/SwiftLint) to enforce code style.

General guidelines:

- Use **4-space indentation**
- Follow Swift naming conventions: `PascalCase` for types, `camelCase` for properties and methods
- Add doc comments for public API

## Adding a New Accounting Plan

When adding support for a new accounting plan (e.g., US GAAP, UK GAAP, etc.), follow these steps:

1. **Create the data file**: Add a JSON file under `Sources/SwiftAccounting/[COUNTRY]/[YEAR]/` containing the accounting plan data
   - Example: `Sources/SwiftAccounting/PCGFR/2026/pcg_2026.json`
   
2. **Register the resource**: Add the data file to the package resources in `Package.swift`:
   ```swift
   .target(
       name: "SwiftAccounting",
       resources: [
           .process("PCGFR/2026/pcg_2026.json"),
           .process("YourCountry/Year/your_plan.json"),
       ]
   )
   ```

3. **Create a parser**: Implement a parser class following the pattern of `PCGFRParser`:
   - Create a static method to parse your JSON file
   - Return an array of `AccountingAccount` objects
   - Handle hierarchical sub-accounts if applicable

4. **Add an AccountingAuthority extension**: If the plan has a governing authority, add it as a static property:
   ```swift
   extension AccountingAuthority {
       public static let yourAuthority = AccountingAuthority(
           name: "Authority Name",
           acronym: "ACRONYM",
           description: "Description",
           websiteURL: "https://example.com",
           address: "Address",
           zipCode: "12345",
           city: "City",
           countryCodeISO: 123
       )
   }
   ```

5. **Add an AccountingPlan extension**: Create a convenience method to load your plan:
   ```swift
   extension AccountingPlan {
       public static func getYourPlan() throws -> AccountingPlan {
           let accounts = try YourParser.parseYourPlan()
           return AccountingPlan(
               label: "Plan Name",
               description: "Description",
               countryCodeISO: 123,
               languageCodeISO: "eng",
               version: "1.0",
               effectiveYear: 2026,
               authority: .yourAuthority,
               accounts: accounts
           )
       }
   }
   ```

6. **Update documentation**: Add the new accounting plan to the "Included Standards" section in `README.md`

7. **Add tests**: Create tests to verify the plan loads correctly and contains expected accounts

## Scope

This package is a **data model layer only**. Contributions should focus on:

- New or updated accounting plans
- Bug fixes in accounting plans, accounts or authorities
- Documentation improvements

Networking, authentication, and API client logic are out of scope for this package.

## License

By contributing, you agree that your contributions will be licensed under the [Apache License 2.0](LICENSE).
