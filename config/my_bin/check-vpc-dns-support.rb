require 'aws-sdk-ec2'

%w[ap-northeast-1 us-east-1].each do |region|
  puts "region: #{region}"

  ec2 = Aws::EC2::Client.new(region: region)
  vpcs = ec2.describe_vpcs.flat_map(&:vpcs)
  vpcs.map { |v| [v.tags.find { |t| t.key == "Name" }.value, v.vpc_id] }.to_h.each do |vpc_name, vpc_id|
    v = ec2.describe_vpc_attribute(vpc_id: vpc_id, attribute: 'enableDnsSupport').enable_dns_support.value
    puts "id: #{vpc_id}\tname: #{vpc_name}\tenable_dns_support: #{v}"
  end

  puts
end
