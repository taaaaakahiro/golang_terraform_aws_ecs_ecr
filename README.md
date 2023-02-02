# golang-terraform-aws-ecs-ecr

### run
1. init
    ```sh
    $ cd .init #./golang-terraform-aws-ecs-ecr/init
    $ terraform apply
    ```

2. build & push
    ```sh
    # login
    $ aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.ap-northeast-1.amazonaws.com

    # build
    $ docker build --platform=linux/amd64 -t dev-ecr . # by Apple Silicon
    $ docker build -t dev-ecr . # by linux

    # add tag
    $ docker tag dev-ecr:latest <ACCOUNT_ID>.dkr.ecr.ap-northeast-1.amazonaws.com/dev-ecr:latest

    # push
    $ docker push <ACCOUNT_ID>.dkr.ecr.ap-northeast-1.amazonaws.com/dev-ecr:latest
    ```

3. dev
    ```sh
    $ cd ./dev
    $ terraform apply # ./golang-terraform-aws-ecs-ecr/dev
    ```

4. access
    access to ALB DSN

### Reference
 - https://github.com/grisha/hello-go-ecs-terraform/blob/master/tf/main.tf  
 - https://github.com/turnerlabs/terraform-ecs-fargate/blob/master/env/dev/ecs.tf  
 - https://github.com/telia-oss/terraform-aws-ecs-fargate  
 - https://github.com/katsuya-n/pub_ecs_laravel_infra/blob/release-1.0.0/modules/ecs/main.tf
 - https://blog.not75743.com/post/ecs_private/

## wiki
- https://github.com/taaaaakahiro/golang-terraform-aws-ecs-ecr/wiki/%5B%E5%8B%95%E4%BD%9C%E7%A2%BA%E8%AA%8D%5DECS-on-Fargate