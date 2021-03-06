## Changelog

---
## Ticket name: HP-general_10

### Date - Time: 22/10/2021 - 12.55

Description: Add styling to Property Listing Details page

### Added

### Changed

- views/listing_details.erb

### Fixed

---
## Ticket name: HP-general_08

### Date - Time: 22/10/2021 - 11:07

Description: Updating CSS on login page to match sign up page

### Added

### Changed

- views/login.erb

### Fixed

---
## Ticket name: HP-general_06

### Date - Time: 21/10/2021 - 17:22

Description: Adding buttons needed for the homepage

### Added
- spec/features/logged_in_user_can_see_log_out_button_spec.rb
- spec/features/user_can_access_buttons_on_homepage_spec.rb

### Changed

- app.rb
- lib/model/user.rb
- spec/unit/model/user_spec.rb
- views/index.erb

### Fixed

---
## Ticket name: HP-bugfix_02

### Date - Time: 21/10/2021 - 14:25

Description: update feature test existing_user_login_spec.rb

### Added

### Changed
- spec/features/existing_user_login_spec.rb
- spec/setup_test_database.rb

### Fixed

---
## Ticket name: HP-feature_07

### Date - Time: 21/10/2021 - 14:20

Description: Added link to signup on login page.

### Added

### Changed
- existing_user_login_spec.rb
- login.erb

---

## Ticket name: HP-feature_03

### Date - Time: 21/10/2021 - 10:25

Description: An existing user can log into their account

### Added
- spec/features/existing_user_login_spec.rb
- views/login.erb

### Changed
- Gemfile
- Gemfile.lock
- app.rb
- lib/model/user.rb
- spec/unit/model/user_spec.rb

---

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

## Ticket name: HP-feature_09

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
