# Ansible_Task2

##  1- Building infrastructure
### Steps: 
- Create VPC with 4 Subnets (2 Public & 2 Private)
- Create NAT  and internet gateways.
- Create Security group and attach it.
- Launch 3 instances ( 1 public Jump Host & 2 private ones)
- Create Target groups and Load Balancer.

### From terminal update  ~/.ssh/config
https://github.com/atefhares/DevOps-Challenge-Demo-Code

##  2- Ansible Part

- Creating Roles through ansible-galaxy 
- Writing inventory &Playbook.
- Run Playbook.
  
### For Nexus: 

Following steps in this link: 


https://devopscube.com/how-to-install-latest-sonatype-nexus-3-on-linux/


### For Sonarcube: 

Following steps in this link: Installing postgres and sonarqube.

https://www.vultr.com/docs/install-sonarqube-on-ubuntu-20-04-lts/

### Nexus should run at port: 8081 and SonarQube at port: 9000
