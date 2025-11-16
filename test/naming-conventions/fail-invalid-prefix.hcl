mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-invalid-prefix.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
