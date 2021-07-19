package main

test_correct_datacenter_name {
	# msg sets the same value in the .rego file.
	# msg は .regoファイルと同じ値を設定する。
	msg := "Datacenter name is ha-datacenter"
	not deny_incorrect_name[msg] with input as {"Datacenters": [{"OverallStatus": "green", "Name": "ha-datacenter"}]}
}

test_incorrect_datacenter_name {
	msg := "Datacenter name is ha-datacenter"
	deny_incorrect_name[msg] with input as {"Datacenters": [{"OverallStatus": "green", "Name": "incorrect datacenter"}]}
}

test_datacenter_name_is_not_set {
	msg := "Datacenter name is ha-datacenter"
	deny_incorrect_name[msg] with input as {"Datacenters": [{"OverallStatus": "green"}]}
}

test_overallstatus_is_green {
	msg := "Datacenter OverallStatus should be set green"
	not deny_incorrect_overallstatus[msg] with input as {"Datacenters": [{"OverallStatus": "green", "Name": "ha-datacenter"}]}
}

test_overallstatus_is_not_green {
	msg := "Datacenter OverallStatus should be set green"
	deny_incorrect_overallstatus[msg] with input as {"Datacenters": [{"OverallStatus": "red", "Name": "ha-datacenter"}]}
}

test_overallstatus_is_not_set {
	msg := "Datacenter OverallStatus should be set green"
	deny_incorrect_overallstatus[msg] with input as {"Datacenters": [{"Name": "ha-datacenter"}]}
}
