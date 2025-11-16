# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive test suite for all policies
- GitHub Actions CI/CD workflow for automated testing
- Repository configuration files (.gitignore, .editorconfig, CODEOWNERS)
- CONTRIBUTING.md guide for contributors


## [1.0.0] - 2024-11-15

### Added
- Initial release of Sentinel custom policies for AWS Landing Zone with HCP Validated Pattern
- Mandatory tagging policy enforcing Environment, Owner, and CostCenter tags
- Naming conventions policy for standardized resource naming
- IAM permission boundaries policy for security enforcement
- Support for tiered enforcement levels via git branches (main, soft-mandatory, advisory)
- README with comprehensive usage instructions
- Integration with HCP Terraform via VCS

### Security
- IAM permission boundary requirements for all roles
- Wildcard permission detection and blocking
- PassRole condition enforcement

### Documentation
- Complete policy documentation in README.md
- Examples for each enforcement level
- Branch setup instructions
- Local testing guide

## Release Notes

### v1.0.0 - Initial Release

This is the first production release of the custom Sentinel policies for AWS Landing Zones with HCP deployments based on the HashiCorp Validated Pattern.

**Key Features:**
- Three comprehensive policies covering tagging, naming, and IAM security
- Flexible enforcement via branch-based configuration
- Production-ready for HCP Terraform integration

**Tested With:**
- Sentinel CLI v0.25.0
- Terraform v1.5+
- HCP Terraform

---

[Unreleased]: https://github.com/sharepointoscar/sentinel-custom-policies/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/sharepointoscar/sentinel-custom-policies/releases/tag/v1.0.0
