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
# Spec:: lxca_scalable_complex
#

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_scalable_complex' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_scalable_complex('list_all')
    expect(chef_run).to discover_managed_lxca_scalable_complex('list_managed')
    expect(chef_run).to discover_unmanaged_lxca_scalable_complex('list_unmanaged')
    expect(chef_run).to discover_flex_lxca_scalable_complex('list_flex')
    expect(chef_run).to discover_rackserver_lxca_scalable_complex('list_rackserver')
    expect(chef_run).to filter_by_uuid_lxca_scalable_complex('filter_by_uuid')
  end
end


