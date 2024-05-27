usage:
.env:
```
CF_Token=cf_token
CF_Account_ID=cf_account_id
AWS_ACCESS_KEY_ID=aws_access_key
AWS_SECRET_ACCESS_KEY=aws_secret_accsess_key
AWS_DEFAULT_REGION=us-east-1
AWS_CERTIFICATE_ARN=arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-1234567890ab
MY_DOMAIN=example.com.ua

```

```
docker run -it --rm --env-file .env ryabukha/acme.sh:0.0.1
```
