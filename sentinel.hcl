# Sentinel Policy Set Configuration
# Defines enforcement levels for different policy sets
# Reference: https://developer.hashicorp.com/sentinel/docs/configuration

# Policy for mandatory resource tagging
policy "mandatory-tagging" {
  source = "./mandatory-tagging.sentinel"

  # Enforcement levels by policy set:
  # - custom-platform-core: hard-mandatory (production platform infrastructure)
  # - custom-network-security: hard-mandatory (critical network infrastructure)
  # - custom-workload-dev: advisory (development - warnings only)
  # - custom-workload-test: soft-mandatory (test - can override with approval)
  # - custom-workload-prod: hard-mandatory (production - strict enforcement)

  enforcement_level = "soft-mandatory"
}

# Policy for resource naming conventions
policy "naming-conventions" {
  source = "./naming-conventions.sentinel"
  enforcement_level = "soft-mandatory"
}

# Policy for IAM permission boundaries
policy "iam-permission-boundaries" {
  source = "./iam-permission-boundaries.sentinel"
  enforcement_level = "soft-mandatory"
}
