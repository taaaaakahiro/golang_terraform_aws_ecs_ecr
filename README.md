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
 
## build
```
$ docker build --platform=linux/amd64 -t terraform-fargate-practice-ecr .
```