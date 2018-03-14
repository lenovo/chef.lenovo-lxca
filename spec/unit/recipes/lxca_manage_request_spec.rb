#
# Cookbook Name:: lxca
# Spec:: lxca_manage_request
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_manage_request' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to fetch_manage_request_lxca_manage_request('fetch_manage_request')
    expect(chef_run).to manage_discovered_devices_lxca_manage_request('manage_discovered_devices')
  end
end


