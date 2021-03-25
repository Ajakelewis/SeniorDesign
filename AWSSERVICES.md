# CIT 481 Senior Design Project AWS Services Documentation

## Setting up a Virtual Private Cloud (VPC)
### Step 1. In order to plan out the VPC before creating it, we recommend using the VPC Subnet Builder from Tidal Migrations:
https://tidalmigrations.com/subnet-builder/

![enter image description here](https://lh3.googleusercontent.com/rwrNs2uaQhOi4di01Sp7oSPzMO6jgVqBg8D-j5vG8StQi-ob2KgYIpRfp9TBhDWpl9bQq8lhISS35I-JekIJWKqP8Kt8R5D_KA9-mQwg0XMDs9ADqlQk9j41XLTCr8w8N_zByr8M)


### Step 2. Create 3 public subnets in 3 different availability zones (AZ) with at least 1024 available IP addresses per subnet.
![enter image description here](https://lh5.googleusercontent.com/9h0IQJ9LKukLxzanOO7s9ofHaKs16sEqR1X_LutbNZ7g2W-wnN7NDWy0l_rwh9veL-3oJHhzOj5oFgWCdMSakfoAn7q2rY69_Ya2Gyozou9xY7B1occ6bRZO7lBv3MjrrUCdXxbM)

![enter image description here](https://lh3.googleusercontent.com/NB-12-uEq3wLIcDJe1C51HYKyxS3I6bsH_79fSaKJC2gR0rfyGLxATumbukMT-XrgymDnTF7CL6t7w9vtVtIhuz9i-ZEL6TFzGR69UFb)

![enter image description here](https://lh3.googleusercontent.com/XmdJqKMZl8uoO2c_1Eg0tX-XJ_2yIHF-yNsfrAYCFlWH_IkHb1xhoAf4IHHXoUBE0sKa8gbnGDzwa9qQoN5OMQa7Pp0pwbMFhmmSoBxp)


### Step 3. Create 3 private subnets in 3 different availability zones (AZ) with at least 4096 available IP addresses per subnet.
![enter image description here](https://lh6.googleusercontent.com/zEEMGoanXuBVHMoJNIgxEs96JlAqy7VTJkHbwZl4-pyrk_e-nc2IElzDCsASmrBZezTowDts39tPmrEtYLhBIX6iTpI1UBERXk55DaKlM_pMoGp2MCYuGlCAK5ViBwqvvysf3wNr)

![enter image description here](https://lh3.googleusercontent.com/nf831NrCI4kHOY6IDguOlle4LzvxctULSg_Su5VZgOr5M3Vf2xHd3kn04BU7pd1Z0W16oy2o4wo011HSSxfFtfguSNPbqfQVWz6TVooKZ--1B1SM5RoD1KaN-h44vpY2StX64yMS)


### Step 4. Create 2 route tables (one for each group of subnets).
![enter image description here](https://lh4.googleusercontent.com/tePKO0jMu2LgpsJj5vV2oMGaXrpKqV2eHAbNz8rrEi9mp4aR7pgjnFHmqQ2fYhEu-_zsC7H_L7oJGbmYbn7ggBI97hc0Z-4rk7EyL9eMnSGI4dlZb76IXagIrFp2tJG1GyTwysMa)

![enter image description here](https://lh3.googleusercontent.com/brpM6sJcqo07xoXTXpr29V7AdJXWgJnu4L3Rc9W7znB1s70QC-qV8oclGSV4d2CaEgonzUxLaCyHqyYYy82RoBRJHKOQ73yR_vCzifYu0bI06IZjbAeqBizakesWwjwYkgGu_j2Q)

![enter image description here](https://lh5.googleusercontent.com/zqsWdOcQuHDr1A03mn7Hf1JWj5k7CqNMRYNn23VDiSueAohieIHUVAUmY9fETEiTmVYb6Btmz1fVoBNqRlDznp9VbPY1DezmYuk5izNqSuIgL0c9EK8HUEecUIpGq2cebAye7uYJ)


### Step 5. Create an Internet Gateway (IG) attached to the default route of the public subnet routing table.
![enter image description here](https://lh4.googleusercontent.com/JjOL2elVKcAu7PLIGIwgk7vSzy_s2vmhIhYxuRp6pIUgIibWXY4qTwyyAi52SrtUCifnKA2lFRNhDMn52qg95F2BEsQhy7Xrin01Im5JUQbERhLev786GW8jupxExyJ9JVUYgAIa)



## Setup up a Web Server on AWS Elastic Compute Cloud (EC2)
![enter image description here](https://lh6.googleusercontent.com/BRW7d2Noy79tBbd9ngZngMbCjc8v247QoLn3njE1QTp6ldNY23BvQtlQvBY10fNBVVp_JrsvPaw6LdFmrfE2XNl8Z5_GQlvj22Q2fKEHy4Vp_BMDq6ATHkVcjxu0RvMt61usXEHB)



## Setting up a Domain with Route53
![enter image description here](https://lh3.googleusercontent.com/g1yN-NtbiKbJxvQUW-DtAGJtp-ULLzq1ChS3THDAxn5N8T0So4PgAvRbcfmVa4JL4XuFTerMwyCnUxKyPxxMccNAN-zH_wTwVMx9Nwbnsq3Bbiunef48z9E__w3dba3iU8nXMcpi)

![enter image description here](https://lh5.googleusercontent.com/MhAhnp3VJr22I2x4FeFId4lMSD4fjAxWymm8_wyqynB9xxuAsRNd1UNJvoCwp9Mj9KRVIGmBxV5olUMhvqcQ7NPT48ZPmkC5xYWwya9o84ysV1ycRHGnJRWHG0mETtw1KdBevNe9)


## Obtaining a TLC Certificate


    [enter link description here](https://letsencrypt.org/getting-started/)

#### With Shell Access Using Certbot:
![enter image description here](https://lh3.googleusercontent.com/ZmBAfBIYxTybjCOrIh_HsCiy_J8dAed1RkxJlZJdsNL8L9NKrBra6oUBraKrqJo0c8_ODkVIcNYOgZhl6r8-BGbpKvNXlaQ_QDx613FylxXHxFA-Fz-lAzFpi90--fgtXpz_0-N0)

![enter image description here](https://lh5.googleusercontent.com/PZs9CCKSqQPtHm1mBERPBom9uY55egmW7g1ILzouUqoqI6dgIwRMq344owRgloN5mDmT4Mhs7Qeq9BwrEuH_4-56cHb5n7Ub_VNgePFKirlhk_ql1_gV72h_EHMiyu-ljcGb2Jup)


Install snapd
Install Certbot
![enter image description here](https://lh4.googleusercontent.com/yTyFNrG06eQIk5As7oDwoHhu-3Uuts6kIsUxRauWqZQasN15p1sUj8raKh-8jZsJsgWzMws38jEd5-nqLRAoRNRaqPPeox2-2Uc1iN2XXGBMoCXqTs2JGYUkct99wmU-tAOlQL0k)

![enter image description here](https://lh6.googleusercontent.com/KV64eYmBbEqp5rOsGiwcfGn8FyQcgMqXit8acmH2hP-DdTu5YvOHVWOYlB99OhZXVT2hXObdboDPUNrtJQX-oPVOyOfShnBK4e2wFMviX1flZ0yfIQynHs1UGoIpvbehhvxTpj4F)

![enter image description here](https://lh5.googleusercontent.com/W3emAlgTBBRNEC28DrlAvyzoSNkZVR1psgPoriws7GiAMxj0Nvw6Doh7ZPdKAjylNH7youN8h9KrtCXKb6jfXDjHaDLrFeDoZMPjXGRXN1Bw-BRLU5qwqmpQWmHobwJMJU7qb3Y_)

![enter image description here](https://lh3.googleusercontent.com/w1kP1Al1x2AZF68SICDFcJrs1KYewCzwhPifuXX6VgiTYXIZptaPhtoO1EiAF2t4LSNwBm0K6UNGkcRKv3VyNcKJ6C4W9Bg_t9xSE2OhRIN-mgxjCBQshVj2Y-L8a6wuzn0tIk9t)

![enter image description here](https://lh6.googleusercontent.com/JTQXabrFrgTfDtibBul-xJVvbGxEsivAPCV8Vt7QO020RBp0J_oeveplm7F-hOWtp6tzrIxe3Z--mandCUvP2DBOMZRGg7YVB0FHcljiFaS-nBHCpbrtCVmWlYKhy4zfYoJ2-kKv)

![enter image description here](https://lh6.googleusercontent.com/7aZ7jD4ll0RsgdIPQXuqPoFPo_yUhJuSDDLrT17kJppLiJ_Iaj7rGeTIEp5obBjhahqj17Mty1ndDNDBaZ7_lxGrBfHWt7cxNcGz-l0rkJqvRGG0UR4OL50y6db0eS5cFfofrgd5)

## How to run the Ansible Playbook Using Docker
1. Create a new container using the command `docker run –it -p 8080:80ubuntu:18.04/bin/bash`
2. Run the command `apt-get update && apt-get upgrade` so the repositories have the most updated packages and installed packages will update
3. Run the command `apt install -y ansible` to install ansible
4. Run the command `mkdir -p /home/example ; cd /home/example` using another directory name beside 'example' so you have a directory to work out of
5. Run the command `apt install -y git` to install git
6. Run the command `git clone https://github.com/Ajakelewis/SeniorDesign.git` so you have access to the playbook
7. Run the command `mv /home/example/SeniorDesign/Ansible-Playbook.yml .` to move the playbook into the ansible directory
8. Run the command `ansible-playbook Ansible-Playbook.yml` to run the playbook
