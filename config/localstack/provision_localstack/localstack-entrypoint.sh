#!/usr/bin/env bash
awslocal s3 mb s3://some-test-bucket
awslocal sqs create-queue --queue-name example-queue-1
awslocal sqs create-queue --queue-name example-queue-new
