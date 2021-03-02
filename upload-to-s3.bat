#!/bin/bash
aws s3 cp s3://www.standwithkashmir.org.au/fact-test/ ./archive --recursive
# Empty the S3 bucket
aws s3 rm s3://www.standwithkashmir.org.au/fact-test/ --recursive

# Upload our project files to the S3 bucket
aws s3 cp dist/ s3://www.standwithkashmir.org.au/fact-test/ --recursive

aws cloudfront create-invalidation --distribution-id E2E8RFVSJXH6JE --paths "/*"
