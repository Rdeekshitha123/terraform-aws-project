FROM alpine:3.18

RUN apk add --no-cache bash terraform
WORKDIR /app
COPY . .

CMD ["terraform", "--version"]
