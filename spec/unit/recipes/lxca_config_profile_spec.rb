#
# Cookbook Name:: lxca
# Spec:: lxca_config_profile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_config_profile' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_config_profile('list_all')
    expect(chef_run).to filter_by_id_lxca_config_profile('filter_by_profileid')
    expect(chef_run).to activate_config_profile_lxca_config_profile('activate_config_profile')
    expect(chef_run).to rename_config_profile_lxca_config_profile('rename_config_profile')
    expect(chef_run).to unassign_config_profile_lxca_config_profile('unassign_config_profile')
    expect(chef_run).to delete_config_profile_lxca_config_profile('delete_config_profile')
  end
end


