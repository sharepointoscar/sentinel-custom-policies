mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-no-boundary.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
