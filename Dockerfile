# Build Go Server Binary
FROM golang:1.17.1-buster

ARG GITHUB_TOKEN=local
ARG VERSION=local

# GITHUB_TOKEN is used to fetch codes from private repository
RUN echo "machine github.com login ${GITHUB_TOKEN}" > ~/.netrc

WORKDIR /project

# Only copy go.mod and go.sum, and download go mods separately to support layer caching
COPY ./go.* ./
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o /arm64bins/api -v \
            -ldflags="-w -s -X github.com/taaaaakahiro/golang-terraform-aws-ecs-ecr/version.Version=${VERSION}" \
            ./

# Build Docker with Only Server Binary
FROM alpine:latest

RUN apk --no-cache add ca-certificates

COPY --from=0 /arm64bins/api /bin/server

RUN addgroup -g 1001 example && adduser -D -G example -u 1001 example

USER 1001

CMD ["/bin/server"]