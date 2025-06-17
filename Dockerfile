FROM golang:1.24.3 as builder
WORKDIR /app
COPY . .
RUN go build -o tracker main.go parcel.go

FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/tracker /app/tracker
COPY tracker.db /app/tracker.db
CMD ["./tracker"]
