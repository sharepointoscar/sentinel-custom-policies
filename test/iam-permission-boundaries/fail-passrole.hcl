mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail-passrole.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
