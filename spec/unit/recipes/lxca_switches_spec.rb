#
# Cookbook Name:: lxca
# Spec:: lxca_switches
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_switches' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_switches('list_all')
    expect(chef_run).to filter_by_chassis_lxca_switches('filter_by_chassis')
    expect(chef_run).to filter_by_uuid_lxca_switches('filter_by_uuid')
  end
end


