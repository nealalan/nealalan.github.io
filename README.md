# a.k.a. Neal Dreher [(linkedin)](https://www.linkedin.com/in/nealdreher)
[http://nealalan.com](http://nealalan.com)
<br>
[https://neonaluminum.com](https://neonaluminum.com)
<br>
[https://4nealalan.wordpress.com/](https://4nealalan.wordpress.com/)
# Reading
## [nealalan.github.io/security](https://nealalan.github.io/security)
## [nealalan.github.io/tech](https://nealalan.github.io/tech)
# Projects
## <a href="https://nealalan.github.io/EC2_Ubuntu_LEMP">nealalan.github.io/EC2_Ubuntu_LEMP</a> (<a href="https://github.com/nealalan/EC2_Ubuntu_LEMP">repo</a>)
Setup for a secure nginx website on the AWS free tier<br>
Example: https://neonaluminum.com<br>
## <a href="https://nealalan.github.io/Transportation">nealalan.github.io/Transportation</a> (<a href="https://github.com/nealalan/Transportation">repo</a>)
Transportation data related scripts in Python<br>
Chicago Divvy Bike Share API parsing and reporting<br>
Chicago Transit Authority (trains & busses) location reporting, route reporting, stop reporting<br>
## <a href="https://nealalan.github.io/update_route53">nealalan.github.io/update_route53</a> (<a href="https://github.com/nealalan/update_route53">repo</a>)
Part of the EC2_Ubuntu_LEMP project, this bash script, for use in init.d, will automatically run ti update an AWS Route 53 DNS record with the EC2 public IP address. This will let a user go to a website via the domain name and let an administrator ssh directly to a server using the domain name instead of the IP address.<br>
Note: You will need an IAM credential installed under the instance root account, with DNS specific authority<br>
