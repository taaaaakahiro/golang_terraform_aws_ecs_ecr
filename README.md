# golang-terraform-aws-ecs-ecr

### run
1. init
```sh
$ cd init #./golang-terraform-aws-ecs-ecr/init
$ terraform apply
```
2. dev
```sh
$ cd ..
$ terraform apply # ./golang-terraform-aws-ecs-ecr
```

### Reference
 - https://github.com/grisha/hello-go-ecs-terraform/blob/master/tf/main.tf  
 - https://github.com/turnerlabs/terraform-ecs-fargate/blob/master/env/dev/ecs.tf  
 - https://github.com/telia-oss/terraform-aws-ecs-fargate  
 - https://github.com/katsuya-n/pub_ecs_laravel_infra/blob/release-1.0.0/modules/ecs/main.tf
 - https://blog.not75743.com/post/ecs_private/
 
## build & push
```sh
#build
$ docker build --platform=linux/amd64 -t dev-ecr . # by Apple Silicon
$ docker build -t dev-ecr . # by linux

#push
$ docker tag dev-ecr:latest <account id>.dkr.ecr.ap-northeast-1.amazonaws.com/dev-ecr:latest
$ docker push <ACCOUNT_ID>.dkr.ecr.ap-northeast-1.amazonaws.com/dev-ecr:latest
```

## wiki
- https://github.com/taaaaakahiro/golang-terraform-aws-ecs-ecr/wiki/%5B%E5%8B%95%E4%BD%9C%E7%A2%BA%E8%AA%8D%5DECS-on-Fargate