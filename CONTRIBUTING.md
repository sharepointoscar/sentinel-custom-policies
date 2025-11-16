# Contributing to Sentinel Custom Policies

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Adding New Policies](#adding-new-policies)

## Code of Conduct

This project follows a professional code of conduct. Please be respectful and constructive in all interactions.

## Getting Started

### Prerequisites

1. **Install Sentinel CLI**
   ```bash
   # macOS
   brew install sentinel

   # Or download from HashiCorp
   wget https://releases.hashicorp.com/sentinel/0.25.0/sentinel_0.25.0_linux_amd64.zip
   unzip sentinel_0.25.0_linux_amd64.zip
   sudo mv sentinel /usr/local/bin/
   ```

2. **Clone the repository**
   ```bash
   git clone https://github.com/sharepointoscar/sentinel-custom-policies.git
   cd sentinel-custom-policies
   ```

3. **Verify setup**
   ```bash
   sentinel version
   sentinel test
   ```

## Development Workflow

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Edit existing policies or create new ones
   - Follow the coding standards below
   - Add or update tests

3. **Test your changes**
   ```bash
   sentinel test
   sentinel fmt -check .
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add description of your changes"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

## Testing

### Running Tests

All policies must have comprehensive test coverage:

```bash
# Run all tests
sentinel test

# Run tests for a specific policy
sentinel test -run mandatory-tagging

# Verbose output
sentinel test -verbose
```

### Writing Tests

Each policy should have at least:
- 1 passing test case
- 2+ failing test cases covering different failure scenarios

Test structure:
```
test/
└── your-policy/
    ├── pass.hcl                    # Test that should pass
    ├── fail-scenario1.hcl          # Test that should fail
    ├── fail-scenario2.hcl          # Another failure scenario
    ├── mock-tfplan-v2-pass.sentinel
    ├── mock-tfplan-v2-fail-scenario1.sentinel
    └── mock-tfplan-v2-fail-scenario2.sentinel
```

### Creating Mock Data

Mock Terraform plan data should follow tfplan/v2 format:

```hcl
resource_changes = {
  "resource_type.resource_name": {
    "address": "resource_type.resource_name",
    "mode": "managed",
    "type": "resource_type",
    "name": "resource_name",
    "provider_name": "registry.terraform.io/hashicorp/aws",
    "change": {
      "actions": ["create"],
      "before": null,
      "after": {
        # Resource attributes
      },
      "after_unknown": {},
    },
  },
}

output_changes = {}
```

## Pull Request Process

1. **Ensure all tests pass**
   - All `sentinel test` cases must pass
   - CI/CD pipeline must succeed

2. **Update documentation**
   - Update README.md if adding new policies
   - Update CHANGELOG.md following [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format
   - Add inline comments for complex logic

3. **Follow commit message conventions**
   - Use conventional commits format:
     - `feat:` for new features
     - `fix:` for bug fixes
     - `docs:` for documentation changes
     - `test:` for test additions/changes
     - `refactor:` for code refactoring

4. **Request review**
   - Assign reviewers listed in CODEOWNERS
   - Address all review comments

5. **Squash commits** (if requested)
   - Keep git history clean and meaningful

## Coding Standards

### Policy File Structure

```sentinel
# Policy Title and Description
# Brief explanation of what the policy enforces
# Reference links if applicable

##### Imports #####
import "tfplan/v2" as tfplan
import "strings"

##### Functions #####

# Function to get resources
get_resources = func() {
  # Implementation
}

# Function to validate resources
validate_resource = func(resource) {
  # Implementation
}

##### Main Logic #####

# Get and validate resources
resources = get_resources()
validated = true

for resources as resource {
  if not validate_resource(resource) {
    validated = false
  }
}

##### Rules #####

# Main rule
main = rule {
  validated
}
```

### Best Practices

1. **Clear variable names**
   - Use descriptive names: `taggable_resources` not `tr`
   - Follow snake_case convention

2. **Helpful print statements**
   - Print clear error messages showing:
     - Resource address
     - What failed
     - Expected vs. actual values

3. **Comment your code**
   - Explain complex logic
   - Document why certain checks exist
   - Reference security standards or compliance requirements

4. **Format your code**
   ```bash
   sentinel fmt .
   ```

5. **Keep functions focused**
   - Each function should do one thing well
   - Extract complex logic into helper functions

## Adding New Policies

1. **Create the policy file**
   ```bash
   touch your-new-policy.sentinel
   ```

2. **Update sentinel.hcl**
   ```hcl
   policy "your_new_policy" {
     source = "./your-new-policy.sentinel"
     enforcement_level = "soft-mandatory"
   }
   ```

3. **Create test structure**
   ```bash
   mkdir -p test/your-new-policy
   ```

4. **Add test cases**
   - Create mock data files
   - Create test configuration files
   - Ensure comprehensive coverage

5. **Update documentation**
   - Add policy description to README.md
   - Document required configurations
   - Provide examples

6. **Run tests**
   ```bash
   sentinel test
   ```

## Questions or Issues?

- Open an issue for bugs or feature requests
- Start a discussion for questions or ideas
- Contact maintainers listed in CODEOWNERS

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (MPL 2.0).
