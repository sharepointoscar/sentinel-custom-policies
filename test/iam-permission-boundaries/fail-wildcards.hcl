mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-wildcards.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
