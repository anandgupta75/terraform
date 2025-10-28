#normal output etc
#output "publci_ip4"{
 # value=aws_instance.example.public_ip

#}

#output for count etc
#output "aws_instance"{

   # value=aws_instance.example[*].public_ip
#}

#output for for_each count etc
output "public_ip" {
 value=[

    for i in aws_instance.example: i.public_ip
 ]

}