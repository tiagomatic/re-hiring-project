# Start from the official Golang base image for the build stage
FROM golang:1.16-alpine as builder

# Set the current working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the new working directory
COPY go.* ./

# Download dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code into the container's working directory
COPY . .

# Set necessary environment variables needed for our image and build the application
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -o main .

# Start a new stage from a smaller base image to create a minimal final image
FROM alpine:latest as runner

# Install ca-certificates in case you need to call HTTPS endpoints
RUN apk --no-cache add ca-certificates

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the current working directory inside the container
WORKDIR /home/appuser

# Copy the pre-built binary file from the previous stage and the .env file
COPY --from=builder /app/main .

# Change to the non-root user
USER appuser

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the executable
CMD ["./main"]
