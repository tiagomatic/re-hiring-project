FROM public.ecr.aws/lambda/go:1

# Copy function code and build it
COPY main.go ${LAMBDA_TASK_ROOT}
RUN go build -o main .

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "main" ]
