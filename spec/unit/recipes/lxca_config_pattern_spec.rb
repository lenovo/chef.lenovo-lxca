#
# Cookbook Name:: lxca
# Spec:: lxca_config_pattern
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'
require_relative '../../helpers/matchers'

describe 'lxca::lxca_config_pattern' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.2.1511')
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect(chef_run).to discover_all_lxca_config_pattern('list_all')
    expect(chef_run).to filter_by_id_lxca_config_pattern('filter_by_patternid')
    expect(chef_run).to export_config_pattern_lxca_config_pattern('export_config_pattern')
    expect(chef_run).to deploy_config_pattern_lxca_config_pattern('deploy_config_pattern')
    expect(chef_run).to import_config_pattern_lxca_config_pattern('import_config_pattern')
  end
end


