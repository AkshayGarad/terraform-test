resource "aws_api_gateway_rest_api" "example" {
  name = "example"
}

resource "aws_api_gateway_deployment" "example" {
  rest_api_id = "${aws_api_gateway_rest_api.example.id}"
  stage_name  = "example"
}

resource "aws_api_gateway_api_key" "example" {
  name = "example"

  stage_key {
    rest_api_id = "${aws_api_gateway_rest_api.example.id}"
    stage_name  = "${aws_api_gateway_deployment.example.stage_name}"
  }
}
