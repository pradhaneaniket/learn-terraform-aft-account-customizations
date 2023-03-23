resource "aws_iam_policy" "cloudadmin" {
    name = "AWSCloudAdmin"
    description = "Policy for CT Managment IDC Permission Set"
    policy = file("./policy/Cloud_Admin.json")
}