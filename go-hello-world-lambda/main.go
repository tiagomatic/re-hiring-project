package main

import (
    "context"
    "github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, name string) (string, error) {
    return "hello world"
}

func main() {
    lambda.Start(HandleRequest)
}
