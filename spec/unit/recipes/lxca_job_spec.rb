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
# Spec:: lxca_job
#

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_job' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_job('list_all')
    expect(chef_run).to filter_by_jobid_lxca_job('filter_by_jobid')
    expect(chef_run).to filter_by_deviceid_lxca_job('filter_by_deviceid')
    expect(chef_run).to filter_by_state_lxca_job('filter_by_state')
    expect(chef_run).to cancel_job_lxca_job('cancel_job')
    expect(chef_run).to delete_job_lxca_job('delete_job')
  end
end


