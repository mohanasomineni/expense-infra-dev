 resource "aws_key_pair" "openvpnas" {
   key_name = "openvpnas"
   public_key = file("D:\\devops\\daws-82s\\openvpnas.pub")
 }
 
 resource "aws_instance" "openvpnas" {
    ami                     = data.aws_ami.openvpn.id 
    key_name = aws_key_pair.openvpnas.key_name
    vpc_security_group_ids  = [data.aws_ssm_parameter.vpn_sg_id.value ]
    instance_type           = "t3.micro"
    subnet_id = local.public_subnet_ids
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-vpn"
        }
    )
} 