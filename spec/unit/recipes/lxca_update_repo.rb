#
# Cookbook Name:: lxca
# Spec:: lxca_update_repo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_update_repo' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_update_repo_lxca_update_repo('discover_update_repo')
    expect(chef_run).to read_update_repo_lxca_update_repo('read_update_repo')
    expect(chef_run).to refresh_update_repo_lxca_update_repo('refresh_update_repo')
    expect(chef_run).to acquire_firmware_updates_lxca_update_repo('acquire_firmware_updates')
    expect(chef_run).to delete_firmware_updates_lxca_update_repo('delete_firmware_updates')
    expect(chef_run).to export_firmware_updates_lxca_update_repo('export_firmware_updates')
  end
end


