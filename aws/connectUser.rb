require 'aws-sdk'

# file_path = File.join(Dir.home, 'aws_credentials.json')
file_content = File.read('/home/solam/.aws/aws_credentials.json')
credentials_data = JSON.parse(file_content)

# Extract AWS credentials
access_key = credentials_data['access_key']
secret_key = credentials_data['secret_key']
Aws.config.update({
  region: 'af-south-1',
  credentials: Aws::Credentials.new(access_key, secret_key)
})

s3 = Aws::S3::Client.new

resp = s3.list_buckets
puts resp
# resp.buckets.each do |bucket|
#   puts 1
# end