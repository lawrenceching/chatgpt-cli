#!/bin/bash

/app/ttyd -p 8080 -c changeme:changeme -B bash -c 'node index.mjs'