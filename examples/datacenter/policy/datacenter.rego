package main

deny[msg] {
  # 名前が指定通りではないことを拒否する。=> 指定通りであること。
  not input.Datacenters[0].Name == "ha-datacenter"
  msg := "Datacenter name is ha-datacenter"
}

deny[msg] {
  # 名前が指定通りではないことを拒否する。=> 指定通りであること。
  not input.Datacenters[0].Name == "ha-datacenter1"
  msg := "Datacenter name is ha-datacenter1"
}

deny[msg] {
  not input.Datacenters[0].OverallStatus == "green"
  msg := "Datacenter OverallStatus should be set green"
}
