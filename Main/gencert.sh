#!/bin/sh
openssl req -new -x509 -days 3650 -config openssl.cnf -out cert.pem
