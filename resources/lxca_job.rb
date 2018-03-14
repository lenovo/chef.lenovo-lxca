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

resource_name :lxca_job
provides :lxca_job

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :uuid, String
property :id, String
property :state, String

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

action :discover_all do
  create_client if @client.nil?
  @client.discover_jobs.map do |job|
    job.instance_variables.each do |att|
      puts "#{att} - #{job.instance_variable_get att}"
    end
  end
end

action :filter_by_id do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action filter_by_id")
  end
  @client.fetch_jobs(["#{new_resource.id}"]).map do |job|
    job.instance_variables.each do |att|
      puts "#{att} - #{job.instance_variable_get att}"
    end
  end
end

action :filter_by_uuid do
  create_client if @client.nil?
  if new_resource.uuid.nil?
    Chef::Log.fatal("Attribute uuid is mandatory for the action filter_by_uuid")
  end
  @client.discover_jobs({:uuid => "#{new_resource.uuid}"}).map do |job|
    job.instance_variables.each do |att|
      puts "#{att} - #{job.instance_variable_get att}"
    end
  end
end

action :filter_by_state do
  create_client if @client.nil?
  if new_resource.state.nil?
    Chef::Log.fatal("Attribute state is mandatory for the action filter_by_state")
  end
  @client.discover_jobs({:state => "#{new_resource.state}"}).map do |job|
    job.instance_variables.each do |att|
      puts "#{att} - #{job.instance_variable_get att}"
    end
  end
end

action :cancel_job do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action cancel_job")
  end
  @client.cancel_job("#{new_resource.id}")
end

action :delete_job do
  create_client if @client.nil?
  if new_resource.id.nil?
    Chef::Log.fatal("Attribute id is mandatory for the action delete_job")
  end
  @client.delete_job("#{new_resource.id}")

end

