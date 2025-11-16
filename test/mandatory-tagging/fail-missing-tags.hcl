mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-missing-tags.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
