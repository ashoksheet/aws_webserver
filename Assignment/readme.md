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

In this not assignment I have not wrriten the terraform script for all the services. I have devided the service code in modules so that we can re-use it while adding/updating the services.

#how it works:
Terraform init

Terraform plan

Terraform apply -auto-approve


In ec2 user data I have passed the script to install apache for webserver at the time of ec2 initialization
once the infra creation compelete we can hit the alb dns to open the web page.

In this code currently we can hit the web page using HTTP for HTTPS need to configure R53 and provide the SSL certificate which is not in the current code, I have wrriten the code basic infra it has not all module which is in design document.

