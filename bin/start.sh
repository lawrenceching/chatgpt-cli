#!/bin/bash

chmod +x /app/ttyd
/app/ttyd -p 8080 -B bash -c 'node index.mjs'