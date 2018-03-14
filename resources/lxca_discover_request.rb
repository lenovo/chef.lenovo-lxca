################################################################################
# <LENOVO COPYRIGHT TO BE INSERTED>
#
# <The below Apache License information to be reviewed by legal
# and modified if need be>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

resource_name :lxca_discover_request
provides :lxca_discover_request

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :ip_addresses, Array
property :job_id, String

action_class do
  def create_client
    require 'xclarity_client'

    conf=XClarityClient::Configuration.new(
      :username => new_resource.login_user,
      :password => new_resource.login_password,
      :host => new_resource.host,
      :port => new_resource.port,
      :auth_type => new_resource.auth_type,
      :verify_ssl => new_resource.verify_ssl
    )

    @client = XClarityClient::Client.new(conf)
  end
end

action :discover_manageable_devices do
  create_client if @client.nil?
  if new_resource.ip_addresses.nil?
    Chef::Log.fatal("Attribute ip_addresses is mandatory for the action discover_manageable_devices")
  end

  @client.discover_manageable_devices(new_resource.ip_addresses)
end

action :monitor_discover_request do
  create_client if @client.nil?
  if new_resource.job_id.nil?
    Chef::Log.fatal("Attribute job_id is mandatory for the action monitor_discover_request")
  end

  @client.monitor_discover_request("#{new_resource.job_id}").map do |req|
    req.instance_variables.each do |attr|
      puts "#{attr} - #{req.instance_variable_get attr}"
    end
  end
end

