resource "aws_iam_user" "blue_team" {
  name  = "blueteam"
  
}

resource "aws_iam_role_policy" "proj1-policy" {
  name = "proj1-iam-policy"
  role = "${aws_iam_role.proj1-iam-role.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "proj1-iam-role" {
  name = "proj1-iam-role"

  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Action": "sts:AssumeRole",
"Principal": {
 "Service": "ec2.amazonaws.com"
},
"Effect": "Allow"
}
]
}
EOF

  tags = {
    tag-key = "proj1-iam-role"
  }
}

resource "aws_iam_instance_profile" "proj1-iam-instance-profile" {
  name = "proj1-iam-instance-profile"
  role = "${aws_iam_role.proj1-iam-role.name}"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.blue_team.name,
    aws_iam_user.proj_one.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "proj1-group"
}

resource "aws_iam_user" "proj_one" {
  name = "proj1-user"
}

