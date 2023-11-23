update isengard dns account for xxxxxxxxxxxx.awsandy.people.aws.dev

create a wildcard * cert for: xxxxxxxxxxxx.awsandy.people.aws.dev

get cert arn

## in yaml for Gateway:



port: 443
name: wildcard.xxxxxxxxxxxx.awsandy.people.aws.dev    # note use name "wildcard" not *

tls:
  mode: Terminate
  options:
    application-networking.k8s.aws/certificate-arn: arn:aws:acm:


## In HTTP route:

spec:
  hostnames: 
  - service1.xxxxxxxxxxxx.awsandy.people.aws.dev      #  custom dns
  parentRefs:
  - kind: Gateway
    name: global
    sectionName: wildcard.xxxxxxxxxxxx.awsandy.people.aws.dev # custom cert 



cname for service1 to lattice address

