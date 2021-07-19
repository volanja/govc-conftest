package main

test_correct_product_name {
  msg := "Product name is VMware ESXi"
  not deny_incorrect_product_name[msg] with input as {"About": { "Name": "VMware ESXi", "Build": "14320388"}}
}

test_incorrect_product_name {
  msg := "Product name is VMware ESXi"
  deny_incorrect_product_name[msg] with input as {"About": { "Name": "VMware ESX", "Build": "14320388"}}
}

test_product_name_is_not_set {
  msg := "Product name is VMware ESXi"
  deny_incorrect_product_name[msg] with input as {"About": { "Build": "14320388"}}
}
