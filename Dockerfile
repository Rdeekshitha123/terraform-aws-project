FROM hashicorp/terraform:1.13.1
RUN apk add --no-cache bash
WORKDIR /app


COPY . .


CMD ["terraform", "--version"]

