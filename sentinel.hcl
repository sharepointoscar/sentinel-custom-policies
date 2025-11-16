# Sentinel Policy Set Configuration
# Defines enforcement levels for different policy sets
# Reference: https://developer.hashicorp.com/sentinel/docs/configuration

# Policy for mandatory resource tagging
policy "mandatory_tagging" {
  source = "./mandatory_tagging.sentinel"

  # Enforcement levels by policy set:
  # - custom-platform-core: hard-mandatory (production platform infrastructure)
  # - custom-network-security: hard-mandatory (critical network infrastructure)
  # - custom-workload-dev: advisory (development - warnings only)
  # - custom-workload-test: soft-mandatory (test - can override with approval)
  # - custom-workload-prod: hard-mandatory (production - strict enforcement)

  enforcement_level = "hard-mandatory"
}

# Policy for resource naming conventions
policy "naming_conventions" {
  source = "./naming_conventions.sentinel"
  enforcement_level = "soft-mandatory"
}

# Policy for IAM permission boundaries
policy "iam_permission_boundaries" {
  source = "./iam_permission_boundaries.sentinel"
  enforcement_level = "hard-mandatory"
}
