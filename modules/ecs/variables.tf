variable "env" {
    description = "環境名"
}

variable "service" {
    description = "service名"
}

variable "function" {
    description = "機能名"
}

variable "backend_ecr_repository_url" {}
variable "sg_container_id" {}
variable "subnet_container_1a_id" {}
variable "subnet_container_1c_id" {}
variable "account_id" {}
variable "alb_tg_blue_arn" {}