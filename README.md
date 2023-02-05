# chatgpt-cli

### Get Started

##### CLI
```
OPENAI_API_KEY=XXX node index.mjs
```

##### Web
```
ttyd -p 8080 -c changeme:changeme -B bash -c 'OPENAI_API_KEY=XXX node index.mjs'
```

##### Docker

docker run --name chatgpt -p 8080:8080 -e OPENAI_API_KEY='XXX' --rm -dit tmp:latest