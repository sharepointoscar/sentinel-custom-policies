mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-underscores.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
