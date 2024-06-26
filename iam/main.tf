provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "myUser" {
    name = "Justin"


}

resource "aws_iam_policy" "customPolicy" {
    name = "MyPolicy"
    // EOF - End of File
    policy = <<EOF

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "rds:*",
            "Resource": ["arn:aws:rds:region:*:*"]
        },
        {
            "Effect": "Allow",
            "Action": ["rds:Describe*"],
            "Resource": ["*"]
        }
    ]
}

EOF    
}

resource "aws_iam_policy_attachment" "policyBind" {
    name = "attachment"
    users = [aws_iam_user.myUser.name]
    policy_arn = aws_iam_policy.customPolicy.arn
}