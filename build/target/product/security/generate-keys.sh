#!/bin/bash

# Example of creating hentai subject file
# $ '/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com' > hentai

export pixeldust=`cat pixeldust`
for x in releasekey platform shared media; do \
    ../../../../../../development/tools/make_key ./$x "$pixeldust"; \
done
