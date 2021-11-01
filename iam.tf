resource "aws_iam_role" "ec2-role" {
  name               = var.role-name
  assume_role_policy = "${file("assume-role-policy.json")}"
}

resource "aws_iam_policy" "ec2-policy" {
  name        = var.policy-name
  policy      = "${file("policy.json")}"
}

resource "aws_iam_policy_attachment" "policy-attachment" {
  name       = var.policy-attachment-name
  roles      = ["${aws_iam_role.ec2-role.name}"]
  policy_arn = "${aws_iam_policy.ec2-policy.arn}"
}

resource "aws_iam_instance_profile" "role-instanceprofile" {
  name  = var.instance-profile-name
  role  = "${aws_iam_role.ec2-role.name}"
}