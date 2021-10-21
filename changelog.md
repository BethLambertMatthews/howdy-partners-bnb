## Changelog

## Ticket name: HP-feature_01

### Date - Time: 20/10/2021 - 15:25

Description: Users can now see properties on the homepage

### Added

- index.erb

### Changed

- app.rb
- changelog.md
- lib/model/property.rb
- spec/setup_test_database.rb
- spec/unit/model/property_spec.rb

### Fixed

---
### Date - Time: 20/10/2021 - 11:06

Description: Added 'add property' functionality to create property listing in howdy partners database.

### Added

- property.rb
- add-new-property_spec.rb
- property_spec.rb
- add_new_property.erb
### Changed

- app.rb
### Fixed
- merge conflicts
---

---

## Ticket name: HP-feature_02

### Date - Time: 19/10/2021 - 17:04

Description: A new user can now sign up for an account and be redirected to the homepage.

### Added

- user.rb
- sign_up.erb

### Changed

- app.rb

### Fixed

---

## Ticket name: HP-config_02

### Date - Time: 19/10/2021 - 14:27

Description: Configured PostgreSQL for production and test environments

### Added

- 00_create_howdy_partners_database.sql
- 01_create_property_listings_table.sql
- 02_create_users_table.sql
- database_connection_setup.rb
- setup_test_database.rb
- gitignore

### Changed

- app.rb
- spec_helper

### Fixed

---

## Ticket name: HP-config_01

### Date - Time: 19/10/2021 - 12.01

Description: Set up basic dependencies and file structure for Sinatra

### Added

- Gemfile
- app.rb
- .rspec
- changelog.md

### Changed

### Fixed
