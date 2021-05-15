resource "aws_iam_user" "blue_team" {
  name  = "blueteam"
  
}

resource "aws_iam_role_policy" "proj2-policy" {
  name = "proj2-iam-policy"
  role = "${aws_iam_role.proj2-iam-role.id}"

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

resource "aws_iam_role" "proj2-iam-role" {
  name = "proj2-iam-role"

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
    tag-key = "proj2-iam-role"
  }
}

resource "aws_iam_instance_profile" "proj2-iam-instance-profile" {
  name = "proj2-iam-instance-profile"
  role = "${aws_iam_role.proj2-iam-role.name}"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.blue_team.name,
    aws_iam_user.proj_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "proj2-group"
}

resource "aws_iam_user" "proj_two" {
  name = "proj2-user"
}


