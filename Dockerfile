FROM busybox:latest as ttydBuilder

WORKDIR /build

RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64

FROM node:19.6.0 as builder

WORKDIR /build
COPY . .
RUN yarn

FROM node:19-slim

ENV OPENAI_API_KEY ''
WORKDIR /app
COPY --from=builder /build/index.mjs .
COPY --from=builder /build/node_modules ./node_modules
COPY --from=ttydBuilder /build/ttyd.x86_64 /app/ttyd
COPY ./bin .

CMD ["bash", "/app/start.sh"]

