#! /bin/bash
sudo amazon-linux-extras install -y nginx1
aws s3 cp --recursive s3://${s3_bucket_name}/website/ /home/ec2-user/
sudo rm -r /usr/share/nginx/html/
sudo cp -r /home/ec2-user/ /usr/share/nginx/html/
chmod 755 /usr/share/nginx/html/
sudo systemctl restart nginx.service