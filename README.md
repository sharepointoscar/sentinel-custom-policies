# Custom Sentinel Policies for AWS Landing Zone

This repository contains custom Sentinel policies for enforcing AWS Landing Zone best practices according to the [HashiCorp Validated Pattern](https://developer.hashicorp.com/validated-patterns/terraform/build-aws-lz-with-terraform).

## Policies Included

### 1. Mandatory Tagging (`mandatory-tagging.sentinel`)
Enforces required tags on all AWS resources:
- **Environment**: dev, test, prod, shared, security, network
- **Owner**: Email address of resource owner
- **CostCenter**: Department or cost center code

### 2. Naming Conventions (`naming-conventions.sentinel`)
Ensures standardized resource naming:
- Pattern: `{environment}-{resource-type}-{purpose}-{region}`
- Example: `prod-vpc-main-us-east-1`
- Prevents use of underscores and spaces

### 3. IAM Permission Boundaries (`iam-permission-boundaries.sentinel`)
Prevents overly permissive IAM configurations:
- Requires permission boundaries on all IAM roles
- Blocks wildcard (*) permissions on all resources
- Enforces conditions on `iam:PassRole`

## Enforcement Levels by Branch

This repository uses branches to support tiered enforcement:

- **main** branch → `hard-mandatory` enforcement (platform core, network, production workloads)
- **soft-mandatory** branch → `soft-mandatory` enforcement (test workloads)
- **advisory** branch → `advisory` enforcement (development workloads)

## Usage with HCP Terraform

These policies are referenced in the `sentinel-policies.tf` file via VCS integration:

```hcl
module "custom_platform_core_policies" {
  source = "../../modules/tfe-policy-set"

  policy_set_name     = "custom-platform-core"
  vcs_repo_identifier = "sharepointoscar/sentinel-custom-policies"
  vcs_branch          = "main"  # hard-mandatory enforcement
  ...
}
```

## Testing Policies

Use the Sentinel CLI to test policies locally:

```bash
sentinel test
```

Generate mock tfplan data:
```bash
terraform plan -out=tfplan.binary
terraform show -json tfplan.binary > mock-tfplan-v2.sentinel
```

## Branch Setup Instructions

### 1. Main Branch (Hard-Mandatory)
This branch is already set up with `hard-mandatory` enforcement in `sentinel.hcl`.

### 2. Create Soft-Mandatory Branch
```bash
git checkout -b soft-mandatory
```

Edit `sentinel.hcl` and change enforcement levels:
```hcl
policy "mandatory-tagging" {
  source = "./mandatory-tagging.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "naming-conventions" {
  source = "./naming-conventions.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "iam-permission-boundaries" {
  source = "./iam-permission-boundaries.sentinel"
  enforcement_level = "soft-mandatory"
}
```

Commit and push:
```bash
git commit -am "Configure soft-mandatory enforcement for test workloads"
git push origin soft-mandatory
```

### 3. Create Advisory Branch
```bash
git checkout -b advisory
```

Edit `sentinel.hcl` and change enforcement levels:
```hcl
policy "mandatory-tagging" {
  source = "./mandatory-tagging.sentinel"
  enforcement_level = "advisory"
}

policy "naming-conventions" {
  source = "./naming-conventions.sentinel"
  enforcement_level = "advisory"
}

policy "iam-permission-boundaries" {
  source = "./iam-permission-boundaries.sentinel"
  enforcement_level = "advisory"
}
```

Commit and push:
```bash
git commit -am "Configure advisory enforcement for dev workloads"
git push origin advisory
```

## References

- [HashiCorp Validated Pattern: AWS Landing Zone](https://developer.hashicorp.com/validated-patterns/terraform/build-aws-lz-with-terraform)
- [Sentinel Documentation](https://developer.hashicorp.com/sentinel)
- [Terraform Sentinel Integration](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/sentinel)

## Policy Customization

Feel free to customize these policies based on your organization's requirements:

1. **Tagging**: Add or modify required tags in `mandatory-tagging.sentinel`
2. **Naming**: Adjust naming patterns in `naming-conventions.sentinel`
3. **IAM**: Customize permission boundary requirements in `iam-permission-boundaries.sentinel`

## Support

For questions or issues with these policies, please open an issue in this repository.
