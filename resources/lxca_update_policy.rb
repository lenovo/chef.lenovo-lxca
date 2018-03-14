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

resource_name :lxca_update_policy
provides :lxca_update_policy

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :jobid, String
property :policy_name, String
property :uuid, String
property :type, String
property :keep, String, default: 'true'
property :auto_assign, String, default: 'false'
property :remove_package, String

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

action :discover_update_policy do
  create_client if @client.nil?
  @client.discover_update_policy.map do |policy|
    policy.instance_variables.each do |att|
      puts "#{att} - #{policy.instance_variable_get att}"
    end
  end
end

action :discover_application_firmware do
  create_client if @client.nil?
  @client.discover_application_firmware.map do |policy|
    policy.instance_variables.each do |att|
      puts "#{att} - #{policy.instance_variable_get att}"
    end
  end
end

action :discover_persisted_compare_results do
  create_client if @client.nil?
  @client.discover_persisted_compare_results.map do |policy|
    policy.instance_variables.each do |att|
      puts "#{att} - #{policy.instance_variable_get att}"
    end
  end
end

action :discover_compare_results do
  create_client if @client.nil?
  if new_resource.jobid.nil?
    Chef::Log.fatal("Attribute jobid is mandatory for the action discover_compare_results")
  end

  @client.discover_compare_results({"jobid":"#{new_resource.jobid}"}).map do |policy|
    policy.instance_variables.each do |att|
      puts "#{att} - #{policy.instance_variable_get att}"
    end
  end
end

action :assign_compliance_policy do
  create_client if @client.nil?
  if new_resource.policy_name.nil?
    Chef::Log.fatal("Attribute policy_name is mandatory for the action assign_compliance_policy")
  end
  if new_resource.type.nil?
    Chef::Log.fatal("Attribute type is mandatory for the action assign_compliance_policy")
  end
  if new_resource.uuid.nil?
    Chef::Log.fatal("Attribute uuid is mandatory for the action assign_compliance_policy")
  end

  @client.assign_compliance_policy("#{new_resource.policy_name}", "#{new_resource.type}", "#{new_resource.uuid}", "#{new_resource.keep}", "#{new_resource.auto_assign}")
end

action :delete_compliance_policy do
  create_client if @client.nil?
  if new_resource.policy_name.nil?
    Chef::Log.fatal("Attribute policy_name is mandatory for the action delete_compliance_policy")
  end
  if new_resource.remove_package.nil?
    Chef::Log.fatal("Attribute remove_package is mandatory for the action delete_compliance_policy")
  end

  @client.delete_compliance_policy("#{new_resource.policy_name}", "#{new_resource.remove_package}")
end


