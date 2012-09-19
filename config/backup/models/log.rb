# encoding: utf-8

require 'yaml'


conf = YAML.load_file(File.expand_path('../config/yetting.yml',  __FILE__))

##
# Backup Generated: log
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t log [-c <path_to_configuration_file>]
#
Backup::Model.new(:log, 'Description for log') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  split_into_chunks_of 250

  ##
  # Amazon Simple Storage Service [Storage]
  #
  # Available Regions:
  #
  #  - ap-northeast-1
  #  - ap-southeast-1
  #  - eu-west-1
  #  - us-east-1
  #  - us-west-1
  #
  store_with S3 do |s3|
    s3.access_key_id     = conf['production']['aws']['access_key_id']
    s3.secret_access_key = conf['production']['aws']['secret_access_key']
    s3.region            = "ap-northeast-1"
    s3.bucket            = conf['production']['aws']['s3']['bucket']
    s3.path              = "backup/log"
    s3.keep              = 10
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

end
