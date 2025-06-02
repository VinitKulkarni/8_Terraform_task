resource "aws_ecr_repository" "flask_repo" {
  name                 = "flask-backend"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "express_repo" {
  name                 = "express-frontend"
  image_tag_mutability = "MUTABLE"
}
