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

resource_name :lxca_update_comp
provides :lxca_update_comp

property :host, String, required: true
property :port, String, required: true
property :login_user, String, required: true
property :login_password, String, required: true
property :verify_ssl, String, required: true
property :auth_type, String, default: 'basic_auth'
property :csrf_token, String
property :activation_mode, String, default: 'immediate'
property :force_update_mode, String, default: 'false'
property :on_error_mode, String, default: 'stopdeviceOnError'
property :server, Array, default: []
property :switch, Array, default: []
property :storage, Array, default: []
property :cmm, Array, default: []

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

action :discover_firmware_update_status do
  create_client if @client.nil?
  @client.discover_firmware_update_status.map do |update|
    update.instance_variables.each do |att|
      puts "#{att} - #{update.instance_variable_get att}"
    end
  end
end

action :discover_updatable_device_comp do
  create_client if @client.nil?
  @client.discover_updatable_device_comp.map do |update|
    update.instance_variables.each do |att|
      puts "#{att} - #{update.instance_variable_get att}"
    end
  end
end

action :apply_firmware_update do
  create_client if @client.nil?

  @client.apply_firmware_update(new_resource.activation_mode, new_resource.force_update_mode, new_resource.on_error_mode, new_resource.server, new_resource.switch, new_resource.storage, new_resource.cmm)
end

action :cancel_firmware_update do
  create_client if @client.nil?

  @client.cancel_firmware_update(new_resource.server, new_resource.switch, new_resource.storage, new_resource.cmm)
end

action :modify_power_state do
  create_client if @client.nil?

  @client.modify_power_state(new_resource.server, new_resource.switch, new_resource.storage, new_resource.cmm)
end

