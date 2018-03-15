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
# Spec:: lxca_node
#

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_node' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_node('list_all')
    expect(chef_run).to discover_managed_lxca_node('list_managed')
    expect(chef_run).to discover_unmanaged_lxca_node('list_unmanaged')
    expect(chef_run).to filter_by_chassis_lxca_node('filter_by_chassis')
    expect(chef_run).to filter_by_uuid_lxca_node('filter_by_uuid')
    expect(chef_run).to power_on_lxca_node('power_on')
    expect(chef_run).to power_off_lxca_node('power_off')
    expect(chef_run).to power_restart_lxca_node('power_restart')
    expect(chef_run).to blink_led_lxca_node('blink_led')
    expect(chef_run).to turn_on_led_lxca_node('turn_on_led')
    expect(chef_run).to turn_off_led_lxca_node('turn_off_led')
  end
end


