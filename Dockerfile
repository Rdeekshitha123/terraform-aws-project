FROM hashicorp/terraform:1.13.1

WORKDIR /app


COPY . .


CMD ["terraform", "--version"]

