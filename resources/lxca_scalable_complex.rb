################################################################################
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
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

resource_name :lxca_scalable_complex
provides :lxca_scalable_complex

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :uuid, String

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
  @client.discover_scalableComplexes.map do |scalableComplex|
    scalableComplex.instance_variables.each do |att|
      puts "#{att} - #{scalableComplex.instance_variable_get att}"
    end
  end
end

action :discover_managed do
  create_client if @client.nil?
  @client.discover_scalableComplexes({:status => 'managed'}).map do |scalableComplex|
    scalableComplex.instance_variables.each do |att|
      puts "#{att} - #{scalableComplex.instance_variable_get att}"
    end
  end
end
  
action :discover_unmanaged do
  create_client if @client.nil?
  @client.discover_scalableComplexes({:status => 'unmanaged'}).map do |scalableComplex|
    scalableComplex.instance_variables.each do |att|
      puts "#{att} - #{scalableComplex.instance_variable_get att}"
    end
  end
end

action :discover_flex do
  create_client if @client.nil?
  @client.discover_scalableComplexes({:type => 'flex'}).map do |scalableComplex|
    scalableComplex.instance_variables.each do |att|
      puts "#{att} - #{scalableComplex.instance_variable_get att}"
    end
  end
end

action :discover_rackserver do
  create_client if @client.nil?
  @client.discover_scalableComplexes({:type => 'rackserver'}).map do |scalableComplex|
    scalableComplex.instance_variables.each do |att|
      puts "#{att} - #{scalableComplex.instance_variable_get att}"
    end
  end
end

action :filter_by_uuid do
  create_client if @client.nil?
  if new_resource.uuid.nil?
    Chef::Log.fatal("Attribute uuid is mandatory for the action filter_by_uuid")
  end
  @client.fetch_scalableComplexes(["#{new_resource.uuid}"]).map do |scalableComplex|
    scalableComplex.instance_variables.each do |att|
      puts "#{att} - #{scalableComplex.instance_variable_get att}"
    end
  end
end

