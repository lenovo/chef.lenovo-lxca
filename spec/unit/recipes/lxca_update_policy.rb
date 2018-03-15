#------------------------------------------------------------
# Lenovo Copyright
#
# (c) Copyright Lenovo 2017.
#
# LIMITED AND RESTRICTED RIGHTS NOTICE:
# If data or software is delivered pursuant a General Services
# Administration (GSA) contract, use, reproduction, or disclosure
# is subject to restrictions set forth in Contract No. GS-35F-05925.
#-------------------------------------------------------------
# Cookbook Name:: lxca
# Spec:: lxca_update_policy
#

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


