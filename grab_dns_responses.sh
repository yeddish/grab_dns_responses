#!/bin/bash

while true; do echo Copying new DNS Responses.;cp dns_responses.txt new-dns_responses.txt;ipconfig /displaydns | grep Record | grep -v "Record Type" | sed 's/^\s*//' | sed 's/^Record/\nRecord/' | sed 's/^.*: //' | sed 's/\r//' | tr '\n' '|' | sed 's/||/\n/g' | sed 's/|/ /' >> new-dns_responses.txt;sort new-dns_responses.txt | uniq > dns_responses.txt; wc dns_responses.txt; sleep 15; done
