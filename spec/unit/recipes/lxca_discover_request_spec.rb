#
# Cookbook Name:: lxca
# Spec:: lxca_discover_request
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_discover_request' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_manageable_devices_lxca_discover_request('discover_manageable_devices')
    expect(chef_run).to monitor_discover_request_lxca_discover_request('monitor_discover_request')
  end
end


