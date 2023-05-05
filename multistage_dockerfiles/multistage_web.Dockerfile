
# Comandos originales

# FROM golang
# COPY dispatcher.go .
# COPY static .
# RUN go build dispatcher.go
# CMD ["./dispatcher"]


# Comandos aplicando multi stage

# Stage 1
FROM golang AS backend
COPY dispatcher.go .
COPY static .
RUN go build dispatcher.go

# Stage 2
FROM alpine
COPY --from=backend /go/dispatcher /
CMD ["/dispatcher"]
