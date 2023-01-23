output "my-api_certificate_ARN" {
  description = "The ARN of the certificate"
  value       = aws_acm_certificate.my-api_certificate.arn
}

output "my-api_certificate-2_ARN" {
  description = "The ARN of the certificate"
  value       = aws_acm_certificate.my-api_certificate-2.arn
}