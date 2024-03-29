# Build Go Server Binary
FROM golang:1.17.1-buster AS build

ARG GITHUB_TOKEN=local
ARG VERSION=local

# GITHUB_TOKEN is used to fetch codes from private repository
RUN echo "machine github.com login ${GITHUB_TOKEN}" > ~/.netrc

WORKDIR /project

# Only copy go.mod and go.sum, and download go mods separately to support layer caching
COPY ./main.go ./go.mod ./
RUN go mod download
RUN go build  -o ./bin/server .

FROM debian:buster
RUN apt update && apt install -y curl
COPY --from=build /project/bin/server /bin/server

CMD ["/bin/server"]