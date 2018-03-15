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
# Spec:: lxca_update_repo
#

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


