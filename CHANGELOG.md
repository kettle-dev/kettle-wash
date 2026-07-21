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

## [0.1.1] - 2026-07-21

- TAG: [v0.1.1][0.1.1t]
- COVERAGE: 100.00% -- 63/63 lines in 2 files
- BRANCH COVERAGE: 86.36% -- 19/22 branches in 2 files
- 20.00% documented

### Changed

- kettle-jem-template-20260720-001 - Generated READMEs can now render
  template-managed corporate sponsor logos from project or family config.
- kettle-jem-template-20260720-002 - Generated development Gemfiles now use the
  released `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260720-003 - Generated StructuredMerge Git diff driver
  config now uses the installed `smorg-rb` Ruby driver name.
- kettle-jem-template-20260720-004 - Generated multi-engine workflow files now
  omit JRuby and TruffleRuby jobs when project config declares MRI-only engines.
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

- kettle-jem-template-20260716-001 - Shim gemspec manifests now include
  `LICENSE.md` instead of nonexistent `LICENSE.txt`.
- kettle-jem-template-20260716-002 - Generated gemspec manifests now ship fewer
  repository-only files by default to reduce downstream distro packaging churn.

### Fixed

- Corrected OpenCollective funding metadata to use the `kettle-dev` collective.
- Updated generated project metadata links to use the migrated `kettle-dev`
  GitHub organization.

- Package configured license files in gem release file lists.

[Unreleased]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/kettle-dev/kettle-wash/compare/v0.1.0...v0.1.1
[0.1.1t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.1
[0.1.0]: https://github.com/kettle-dev/kettle-wash/compare/9819b1c14789cdd16131ddf8f131a436f702fd4e...v0.1.0
[0.1.0t]: https://github.com/kettle-dev/kettle-wash/releases/tag/v0.1.0
