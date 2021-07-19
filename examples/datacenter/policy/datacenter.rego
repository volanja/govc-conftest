package main

deny_incorrect_name[msg] {
	# 名前が指定通り(==)ではない(not)ことを拒否(deny)する。=> 指定通りであること。
	not input.Datacenters[0].Name == "ha-datacenter"
	msg := "Datacenter name is ha-datacenter"
}

deny_incorrect_overallstatus[msg] {
	not input.Datacenters[0].OverallStatus == "green"
	msg := "Datacenter OverallStatus should be set green"
}
