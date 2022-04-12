# aws_webserver
Objective: 
•	Create a High Level Design of the home assignment
•	The web service must be highly available
•	Be able to hit a sample web page from the web service deployed using HTTPS port 443 and redirected to port 8080
•	For any areas which you have considered not to automate, please state these clearly and if possible, provide details of the solution you would have implemented including your experience/depth of knowledge of that area.
•	Be prepared to be questioned and ready to explain your design decision in regards of your choice of solution.
•	Provide a link to the git Project, if code is attempted
•	Code for provisioning and deploying the web service in AWS
•	Readme file must be populated detailing your solution and how to run it.
•	Link to the sample web page presented by the deployed service. 

 
Tech Stack:
•	The choice of web service is up to you.  For example, apache, nginx, etc
•	For provisioning use terraform and deployment tool use Ansible
•	OS – Ubuntu or Centos

 
Points to consider:
1.	Monitoring and maintainability
2.	Capacity and growth
3.	Deploying to a Production environment that has VMs already running.

#Approach
I have added the High level Design in Assignment. The idea of design is to deploy a webserver on highly secure and sclable soultion in aws.
I have used below aws services to achive the solution:

DNS services with Amazon Route 53 – Provides DNS services to simplify domain management.
Edge security with AWS WAF – Filters malicious traffic, including cross site
scripting (XSS) and SQL injection via customer-defined rules.
Load balancing with Elastic Load Balancing (ELB) – Enables you to spread load across multiple
Availability Zones and AWS Auto Scaling groups for redundancy and decoupling of services.
Firewalls with security groups – Moves security to the instance to provide a stateful, host-level firewall for both web and application servers.
Amazon ElastiCache – Provides caching services with Redis or Memcached to remove load from the app and database, and lower latency for frequent requests.
Amazon RDS– Creates a highly available, multi-AZ database architecture with six possible DB engines.
For observality and monitoring used Cloudwatch which provid the matrics for Ec2 CPU utilization, health check, Read/Write IO metrics.
and based on that we trigger Alarm so that our ASG can increase/decrease the instances and make the infra Highly available using mutil availability zone.

#Area of Improvement:
Security: We can use Shiled for Ddos protection

In this not assignment I have not wrriten the terraform script for all the services.
