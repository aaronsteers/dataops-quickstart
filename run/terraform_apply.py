#!usr/bin/env python3
"""Apply any pending infra changes and then update associated pointers in 'src/infra/resources'."""

# terraform init
# terraform apply -no-input

# TODO: Convert the below bash scripts into python

# cd infra
# echo "Beginning terraform apply..."
# terraform apply
# echo "Terraform apply completed."

# echo "Updating output files..."
# rm outputs/*
# function terraform_output() {
#     echo "Saving terraform output to infra/output/$1..."
#     terraform output $1 > outputs/$1
# }
# terraform_output docker_repo_root
# terraform_output docker_repo_image_url
# terraform_output ecs_cluster_name
# terraform_output ecs_task_name
# terraform_output vpc_private_subnets
# terraform_output aws_region
# terraform_output ecs_security_group
# terraform_output ecs_runtask_cli
# terraform_output ecs_runtask_script
# terraform_output ecs_logging_url
# cd -
# echo "Terraform apply and outputs completed successfully!"
