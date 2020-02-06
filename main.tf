resource "aws_eip" "nat" {
    instance = "${aws_instance.nat.id}"
    vpc = true
}

resource "aws_eip" "webapp" {
    instance = "${aws_instance.web-1.id}"
    vpc = true
}

resource "aws_route_table" "us-east-1a-public" {
    vpc_id = "${data.aws_vpc.selected.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ig-main.id}"
    }

    tags= {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "us-east-1a-public" {
    subnet_id = "${aws_subnet.us-east-1a-public.id}"
    route_table_id = "${aws_route_table.us-east-1a-public.id}"
}

resource "aws_route_table" "us-east-1a-private" {
    vpc_id = "${data.aws_vpc.selected.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags = {
        Name = "Private Subnet"
    }
}

####################
resource "aws_route_table_association" "us-east-1a-private" {
    subnet_id = "${aws_subnet.us-east-1a-private.id}"
    route_table_id = "${aws_route_table.us-east-1a-private.id}"
}

resource "aws_subnet" "us-east-1a-public" {
    vpc_id = "${data.aws_vpc.selected.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Public Subnet"
    }
}

resource "aws_subnet" "us-east-1a-private" {
    vpc_id = "${data.aws_vpc.selected.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Private Subnet"
    }
}

resource "aws_internet_gateway" "ig-main" {
    vpc_id = "${data.aws_vpc.selected.id}"
    #"${aws_vpc.main_vpc.id}"
}
