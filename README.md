# overturemaps italy
## prepare the data
Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and download the data<br/>
If you want download all
```
aws s3 cp --region us-west-2 --no-sign-request --recursive s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/ <DESTINATION>
```
To download single themes:
- admins<br/> *s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=admins*
- buildings<br/> *s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=buildings*
- places<br/>*s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=places*
- transportation<br/>*s3://overturemaps-us-west-2/release/2023-07-26-alpha.0/theme=transportation*
  



