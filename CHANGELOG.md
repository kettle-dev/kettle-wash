# Changelog

[![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][📗keep-changelog],
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html),
and [yes][📌major-versions-not-sacred], platform and engine support are part of the [public API][📌semver-breaking].
Please file a bug if you notice a violation of semantic versioning.

[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [0.1.5] - 2026-08-03

- TAG: [v0.1.5][0.1.5t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 33.33% documented

### Fixed

- kettle-jem-template-20260802-001 - Devcontainer JSON files now merge as JSONC,
  preserving comments and trailing commas during template updates.

## [0.1.4] - 2026-08-01

- TAG: [v0.1.4][0.1.4t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 33.33% documented

### Changed

- kettle-jem-template-20260801-001 - Generated README gem dashboard links now
  use ClickGems instead of BestGems.

### Fixed

- kettle-jem-template-20260801-002 - Generated RSpec helpers now normalize
  managed configuration block bindings structurally, preventing mixed block
  parameter names from producing invalid configuration after a merge.
- kettle-jem-template-20260801-003 - Generated project metadata and
  documentation now normalize configured underscore hostnames to valid
  hyphenated hostnames.
- kettle-jem-template-20260801-004 - Generated organization README logos now
  use GitHub's stable organization avatar endpoint instead of assuming a
  matching Galtzo-hosted asset exists.

## [0.1.3] - 2026-07-31

- TAG: [v0.1.3][0.1.3t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 33.33% documented

### Added

### Fixed

- kettle-jem-template-20260728-004 - Generated dep-heads workflows now use the
  setup-ruby Bundler install path for direct appraisal Gemfiles, avoiding rv
  lockfile parser failures on Git and path dependencies.
- kettle-jem-template-20260728-005 - VersionGem bootstrap now creates the
  missing canonical version spec when a project only has shim namespace version
  specs.
- kettle-jem-template-20260730-001 - Gemspec package file enumeration now runs
  relative to the gemspec directory, so release package contents stay correct
  even when the gemspec is loaded from another working directory.

## [0.1.2] - 2026-07-28

- TAG: [v0.1.2][0.1.2t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 33.33% documented

### Added

- kettle-jem-template-20260726-001 - Projects now include YARD lint
  configuration and documentation dependencies so documentation issues fail
  before generated docs are refreshed.

- kettle-jem-template-20260727-001 - Spec harness documentation now lists the
  RSpec helpers provided by `kettle-test`.

### Changed

- kettle-jem-template-20260725-001 - Release pull request branches beginning
  with `feature/release` now run JRuby and TruffleRuby workflows.
- kettle-jem-template-20260725-002 - Version specs now use `anonymous_loader` to
  cover `version.rb` without redefining constants, or are removed when version
  specs are not managed for the project.

- kettle-jem-template-20260728-001 - Generated Ruby workflows now use clearer
  setup-ruby-flash planning and can prepare appraisal-only jobs without
  installing the main Gemfile bundle.

### Fixed

- kettle-jem-template-20260726-002 - Generated version files now document their
  version namespace and constants, reducing warning-only YARD lint output.

- kettle-jem-template-20260726-003 - Coverage upload steps now treat Coveralls,
  QLTY, and Codecov as optional, so provider outages do not fail CI when local
  coverage thresholds still pass.
- kettle-jem-template-20260728-002 - Generated RuboCop configs now ignore the
  same `gemfiles/vendor/bundle` tree as `.gitignore`, so vendored dependency
  installs are not reported as project lint debt.
- kettle-jem-template-20260728-003 - Generated dep-heads workflows now run
  TruffleRuby jobs with current RubyGems and Bundler, avoiding setup failures
  before the test suite starts.

## [0.1.1] - 2026-07-21

- TAG: [v0.1.1][0.1.1t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 20.00% documented

### Changed

- kettle-jem-template-20260720-002 - Generated development Gemfiles now use the
  released `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260720-003 - Generated StructuredMerge Git diff driver
  config now uses the installed `smorg-rb` Ruby driver name.
- kettle-jem-template-20260720-005 - Generated README Support & Community rows
  now include a RubyForum help badge.

## [0.1.0] - 2026-07-19

- TAG: [v0.1.0][0.1.0t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 20.00% documented
- Initial release

### Added

- Added support for JRuby 10.1 and TruffleRuby 34.0.
- Added public constant deletion and reset helpers for test and reload workflows.
- Added `Kettle::Wash::Change`, an include-based helper for modules that need
  `delete_const` and `reset_const` singleton methods.
- Added `Kettle::Wash.install` and `Kettle::Wash.validate!` for gems that
  declare washable constant contracts without loading `kettle-wash` at runtime.

### Changed

- Documented the primary coverage use case for reloading constants whose values
  are conditionally derived from `ENV`.
- Added RSpec usage documentation with a link to the `kettle-soup-cover`
  constant reset specs.
- Updated the RSpec usage example to use `rspec-stubbed_env` instead of
  mutating the real process environment.

- Retemplated project metadata and CI/development automation with `kettle-jem` v7.0.0.

- kettle-jem-template-20260716-002 - Generated gemspec manifests now ship fewer
  repository-only files by default to reduce downstream distro packaging churn.

### Fixed

- Corrected OpenCollective funding metadata to use the `kettle-dev` collective.
- Updated generated project metadata links to use the migrated `kettle-dev`
  GitHub organization.

- Package configured license files in gem release file lists.

[Unreleased]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.5...HEAD
[0.1.5]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.4...v0.1.5
[0.1.5t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.5
[0.1.4]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.3...v0.1.4
[0.1.4t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.4
[0.1.3]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.2...v0.1.3
[0.1.3t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.3
[0.1.2]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.1...v0.1.2
[0.1.2t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.2
[0.1.1]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.0...v0.1.1
[0.1.1t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.1
[0.1.0]: https://github.com/kettle-dev/kettle-wash/compare/9819b1c14789cdd16131ddf8f131a436f702fd4e...v0.1.0
[0.1.0t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.0
