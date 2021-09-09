#!/bin/sh

# Create self-signed certificate

openssl req -nodes -new -x509 -keyout server.key -out server.cert \
  -subj /C=GB/ST=London/L=London/O=my-o/OU=my-ou/CN=localhost


echo "Register certificate in local keychain"

sudo security add-trusted-cert -d -r trustRoot \
   -k /Library/Keychains/System.keychain server.cert

