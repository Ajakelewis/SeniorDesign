
                                                   Team Blue's Documentation (Draft)


    Github Repository
  
We all needed to make a Github Account so that we may be able to collaborate together via the Repository and organize the projects files in one place.
  
    AWS account
 
We made an Amazon Web Services Account because it has a broad support for various platforms we will be implementing in our project, the advanced configurability of the console to manage our webserver and the infrastructure is also scalable depending on our specific needs. 

    Domain (teamblue481.com)

Our group decided to use Amazon's Web server Management Services via Route 53 to create a scalable DNS, Domain and Registration Service. The Hosted Zones that are created automatically can be configured to to route specific traffic from public to private zones. We can create endpoints to route users to certain applications if needed thereafter. 

    VPC on AWS

We set up a Virtual Private Connection and dropped in our resources to use for each VPC we create. 
The Tidal Migrations Subnet Builder takes the idea of an IP Calculator to the next level, allowing you to build entire cloud and datacenter IP address plans visually. Simply enter your highest-level parent subnet and start breaking it down by selecting subnets of the appropriate sizes using the buttons to the right.

    EC2 Web Server
    
Using Amazon’s Elastic Compute Cloud we don't need to use physical hardware for setting up the server and can develop and deploy the application much faster. We are also able to configure the security, network and manage storage for as many virtual servers we launch. 

    TLS Certs
  
Using Amazon’s Certificate Manager integrated in AWS, we renew our certs after the request and validation process and enable ssl for cloud front. 
We used Let’s encrypt and certbot to generate our TLS Certificate. 

   Ansible Playbook

 We will be managing our server via Ansible to configure the infrastructure further. 


