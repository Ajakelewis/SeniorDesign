# CIT 481 Senior Design Project AWS Services Documentation

## Setting up a Virtual Private Cloud (VPC)
We can use VPC Subnet Builder:
https://tidalmigrations.com/subnet-builder/

![enter image description here](https://lh3.googleusercontent.com/rwrNs2uaQhOi4di01Sp7oSPzMO6jgVqBg8D-j5vG8StQi-ob2KgYIpRfp9TBhDWpl9bQq8lhISS35I-JekIJWKqP8Kt8R5D_KA9-mQwg0XMDs9ADqlQk9j41XLTCr8w8N_zByr8M)

####3 public subnets in 3 different availability zones (AZ) with at least 1024 available IP addresses per subnet.
![enter image description here](https://lh3.googleusercontent.com/NB-12-uEq3wLIcDJe1C51HYKyxS3I6bsH_79fSaKJC2gR0rfyGLxATumbukMT-XrgymDnTF7CL6t7w9vtVtIhuz9i-ZEL6TFzGR69UFb)
![enter image description here](https://lh3.googleusercontent.com/XmdJqKMZl8uoO2c_1Eg0tX-XJ_2yIHF-yNsfrAYCFlWH_IkHb1xhoAf4IHHXoUBE0sKa8gbnGDzwa9qQoN5OMQa7Pp0pwbMFhmmSoBxp)

#### 3 private subnets in 3 different availability zones (AZ) with at least 4096 available IP addresses per subnet.
![enter image description here](https://lh6.googleusercontent.com/zEEMGoanXuBVHMoJNIgxEs96JlAqy7VTJkHbwZl4-pyrk_e-nc2IElzDCsASmrBZezTowDts39tPmrEtYLhBIX6iTpI1UBERXk55DaKlM_pMoGp2MCYuGlCAK5ViBwqvvysf3wNr)
![enter image description here](https://lh3.googleusercontent.com/nf831NrCI4kHOY6IDguOlle4LzvxctULSg_Su5VZgOr5M3Vf2xHd3kn04BU7pd1Z0W16oy2o4wo011HSSxfFtfguSNPbqfQVWz6TVooKZ--1B1SM5RoD1KaN-h44vpY2StX64yMS)

#### 1 route table for the public subnets
![enter image description here](https://lh3.googleusercontent.com/brpM6sJcqo07xoXTXpr29V7AdJXWgJnu4L3Rc9W7znB1s70QC-qV8oclGSV4d2CaEgonzUxLaCyHqyYYy82RoBRJHKOQ73yR_vCzifYu0bI06IZjbAeqBizakesWwjwYkgGu_j2Q)

#### 1 route table for the private subnets
![enter image description here](https://lh5.googleusercontent.com/zqsWdOcQuHDr1A03mn7Hf1JWj5k7CqNMRYNn23VDiSueAohieIHUVAUmY9fETEiTmVYb6Btmz1fVoBNqRlDznp9VbPY1DezmYuk5izNqSuIgL0c9EK8HUEecUIpGq2cebAye7uYJ)

#### 1 Internet Gateway (IG) attached to the default route of the public subnet routing table
![enter image description here](https://lh4.googleusercontent.com/JjOL2elVKcAu7PLIGIwgk7vSzy_s2vmhIhYxuRp6pIUgIibWXY4qTwyyAi52SrtUCifnKA2lFRNhDMn52qg95F2BEsQhy7Xrin01Im5JUQbERhLev786GW8jupxExyJ9JVUYgAIa)


## Setup up a Web Server on AWS Elastic Compute Cloud (EC2)



## Setting up a Domain with Route53



## Obtaining a TLC Certificate


## How to run the Ansible Playbook
