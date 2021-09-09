#!/bin/sh

# Create self-signed certificate

[ ! -d certificates ] && mkdir certificates
if [ ! -f certificates/server.key ] ; then
  echo "Creating server.cert"
  openssl req -nodes -new -x509 -keyout certificates/server.key   \
    -out certificates/server.cert                                \
    -subj /C=GB/ST=London/L=London/O=my-o/OU=my-ou/CN=localhost
else
  echo "Certificate server.cert already exists"
fi

# openssl x509 -outform PEM -in certificates/server.cert -out certificates/server.pem

# echo "Register certificate in local keychain"

# sudo security add-trusted-cert -d -r trustRoot \
#    -k /Library/Keychains/System.keychain server.cert

