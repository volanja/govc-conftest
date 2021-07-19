package main

deny_incorrect_product_name[msg] {
  not input.About.Name == "VMware ESXi"
  msg := "Product name is VMware ESXi"
}
