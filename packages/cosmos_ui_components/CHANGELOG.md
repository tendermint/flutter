## Breaking changes after 2.0.3

### The following classes & properties have been refactored (`OldClassName` -> `NewClassName`)

#### UI components

* `CosmosWalletListItem` -> `CosmosAccountListItem`
* `CosmosWalletsListView` -> `CosmosAccountsListView`

#### UI related models

* `AccountInfo` -> `AccountInfo`

#### Files moved

* `AccountInfo` class was previously located inside `cosmos_accounts_list_view.dart` which itself is renamed
  from `cosmos_accounts_list_view.dart`
* Now `AccountInfo` class is located under `models` folder in a separate file named `account_info.dart`

## 2.0.3 - 2021-01-27

### Fixed

* Paste button not enabling the continue button on asset transfer page
* Fees token denom is always AKT
* Ruby setup for deployment scripts in Github Actions

## 2.0.2 - 2022-01-25

### Added

* Security screen to enable app lock and biometrics

### Fixed

* Bug fixes and minor improvements

## [2.0.1](https://github.com/tendermint/flutter/compare/v2.0.0...v2.0.1) - 2021-12-17

### Fixed

* Library references in Ignite template

## 2.0.0 - 2021-12-17

### Changed

* Major design revamp for Ignite template

## 1.0.2 - 2021-09-20

### Fixed

* Fix go proxy cache

## 1.0.1 - 2021-08-21

### Added

* Support for dark theme

### Changed

* Minimum Android SDK version to 18

### Fixed

* Minor bug fixes

## 1.0.0 - 2021-08-17

* Initial version of Ignite template

## 0.1.0 - 2021-08-03

* Export ignite template as a Go module
* TODO: Add more from the first release