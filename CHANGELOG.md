# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.21.0] - 2023-01-19

### Changed
- Made compatible with Ruby 3.0 by switching to URI.open.

## [0.20.0] - 2016-10-28

### Added

- Added `all_legislatures` to Index class. Returns an array of all the
  Legislatures for all countries.
- Added `latest_term` to Legislature class. This returns an
  Everpolitician::Popolo::LegislativePeriod object with data from the
  latest term. Note that this may involve a **substantial download**
  depending on the legislature.

## [0.19.0] - 2016-10-19

## Unreleased

## [0.18.0] - 2016-08-25

### Changed

- The method to get the URL of the names file is now `Legislature.names_url`, 
   not `Legislature.csv_url`

## [0.17.0] - 2016-08-23

### Changed

- The code now uses the `csv_url` field from the data, so the url
  host has changed from `raw.githubusercontent.com` to `cdn.rawgit.com`.

## [0.16.0] - 2016-08-22

### Added

- Added `csv_url` to Legislature class. Returns full url of `names.csv` file. For example: `https://cdn.jsdelivr.net/gh/everypolitician/everypolitician-data@ba976cf/data/UK/Commons/names.csv`

## [0.15.0] - 2016-08-23

### Fixed

- Calling `start_date` or `end_date` on a Legislature which doesn’t have
  one now returns `nil` rather than raising an Exception.


## [0.14.0] - 2016-08-22

### Added

- A Legislature now has `[]` defined, for symmetry with Country and 
  LegislativePeriod

## [0.13.0] - 2016-08-18

### Added

- There is now an `Everypolitician::Index` class which can be instantiated with
  a url pointing to a `countries.json` file. This replaces the need to globally
  set a url via `Everypolitician.countries_json=`.
  - You can access a country via the `Everypolitician::Index#country` method, which takes a (case-insensitive) slug for the country.
  - You can get a list of all countries via the `Everypolitician::Index#countries` method.

## [0.12.0] - 2016-08-16

### Changed

- Trying to find a non-existent country or legislature now returns `nil` rather
  than raising an exception.

## [0.11.0] - 2016-08-07

### Added

- Searches by slug for a Country or a Legislature are now case insensitive

## [0.10.0] - 2016-08-04

### Changed

- The code now uses the `popolo_url` field from the data, so the url
  host has changed from `raw.githubusercontent.com` to `cdn.rawgit.com`.

## [0.9.0] - 2016-07-28

### Added

- The`Legislature#lastmod` attribute now returns a Time object instead of just
a string with the time in seconds.

## [0.8.0] - 2016-07-26

### Added

- There is now a `Legislature#statement_count` method for returning the
  statement count of a legislature, which corresponds to the `statement_count`
  field in the legislatures of a country coming from the data in `countries_json`.

## [0.7.0] - 2016-06-21

### Added

- There is now a `Legislature.directory` method for returning the
  directory path under `data` where the raw data on everypolician data
  can be found

## [0.6.1] - 2016-05-23

## Fixed

- `start_date` and `end_date` for a legislative period now work correctly for a partial date, e.g. `2010`.

## [0.6.0] - 2016-01-29

### Added

- There is now a `LegislativePeriod` class to represent each legislative period in a legislature. This has a `#csv` method to return a parsed version of the legislative periods CSV.
- You can now call `Legislature#country` to get the country for a legislature. Similarly you can call `LegislativePeriod#country` or `LegislativePeriod#legislature` to get the related objects.

## [0.5.0] - 2016-01-27

### Added

- `Everypolitician.countries` method for returning an array of all countries.
- Find countries and legislatures by arbitrary attributes, e.g. `Everypolitician.country(code: 'AU')`

### Changed

- We no longer use ruby metaprogramming to define the methods on `Country` and `Legislature`, they are now explicitly defined as properties and methods.
- `Legislature#popolo_url` now uses the `Legislature#sha` method rather than `master` in the raw url.
- `countries.json` is only loaded once, when it’s first accessed. If you want to force a refetch then you can call `Everypolitician.countries = nil`.

## [0.4.0] - 2016-01-26

### Changed

- `Everypolitician::Legislature#popolo` now returns an instance of `Everypolitician::Popolo::JSON` from [everypolitician-popolo](https://github.com/everypolitician/everypolitician-popolo) instead of a string representing the path.

### Added

- `Everypolitician::Legislature#popolo_url` now returns a GitHub raw url to the popolo for the legislature.

## [0.3.0] - 2015-12-22

### Added

- You can now use `EveryPolitician` as the constant name as well as `Everypolitician`
- You can change the `countries.json` the library uses via `Everypolitician.countries_json=`

## [0.2.0] - 2015-12-22

### Changed

- `countries.json` is now represented by a separate class allowing users to access the raw underlying data.

## 0.1.0 - 2015-12-22

- Initial release

[0.2.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.1.0...v0.2.0
[0.3.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.2.0...v0.3.0
[0.4.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.3.0...v0.4.0
[0.5.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.4.0...v0.5.0
[0.6.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.5.0...v0.6.0
[0.6.1]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.6.0...v0.6.1
[0.7.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.6.1...v0.7.0
[0.8.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.7.0...v0.8.0
[0.9.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.8.0...v0.9.0
[0.10.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.9.0...v0.10.0
[0.11.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.10.0...v0.11.0
[0.12.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.11.0...v0.12.0
[0.13.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.12.0...v0.13.0
[0.14.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.13.0...v0.14.0
[0.15.0]: https://github.com/everypolitician/everypolitician-ruby/compare/v0.14.0...v0.15.0
[0.16.0]: https://https://github.com/everypolitician/everypolitician-ruby/compare/v0.15.0...v0.16.0
[0.17.0]: https://https://github.com/everypolitician/everypolitician-ruby/compare/v0.16.0...v0.17.0
[0.18.0]: https://https://github.com/everypolitician/everypolitician-ruby/compare/v0.17.0...v0.18.0
[0.19.0]: https://https://github.com/everypolitician/everypolitician-ruby/compare/v0.18.0...v0.19.0
[0.20.0]: https://https://github.com/everypolitician/everypolitician-ruby/compare/v0.19.0...v0.20.0
