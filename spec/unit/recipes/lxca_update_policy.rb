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

# Cookbook Name:: lxca
# Spec:: lxca_update_policy

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_update_policy' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_update_policy_lxca_update_policy('discover_update_policy')
    expect(chef_run).to discover_application_firmware_lxca_update_policy('discover_application_firmware')
    expect(chef_run).to discover_persisted_compare_results_lxca_update_policy('discover_persisted_compare_results')
    expect(chef_run).to discover_compare_results_lxca_update_policy('discover_compare_results')
    expect(chef_run).to assign_compliance_policy_lxca_update_policy('assign_compliance_policy')
    expect(chef_run).to delete_compliance_policy_lxca_update_policy('delete_compliance_policy')
  end
end


