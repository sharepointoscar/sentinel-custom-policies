mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-invalid-env.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
