require 'aws-sdk'

Aws.config.update({
  region: 'af-south-1',
  credentials: Aws::Credentials.new('AKIA6GBMFG5X7FSKIBKG', '6j8UfBNDsjkTWI+6iwsFGdOAGSjjeTyJXYL7XA6T')
})

s3 = Aws::S3::Client.new

resp = s3.list_buckets
puts resp
# resp.buckets.each do |bucket|
#   puts 1
# end