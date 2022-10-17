#!/bin/bash

cat > index.html <<EOF
<h1> Hello, World from $(hostname -f)@$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone) </h1>
<p> DB address: ${db_address} </p>
<p> DB port: ${db_port} </p>
EOF

nohup busybox httpd -f -p ${server_port} &