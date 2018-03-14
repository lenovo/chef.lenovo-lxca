#
# Cookbook Name:: lxca
# Spec:: lxca_update_comp
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_update_comp' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_firmware_update_status_lxca_update_comp('discover_firmware_update_status')
    expect(chef_run).to discover_updatable_device_comp_lxca_update_comp('discover_updatable_device_comp')
    expect(chef_run).to apply_firmware_update_lxca_update_comp('apply_firmware_update')
    expect(chef_run).to cancel_firmware_update_lxca_update_comp('cancel_firmware_update')
    expect(chef_run).to modify_power_state_lxca_update_comp('modify_power_state')
  end
end


