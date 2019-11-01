#
# Cookbook:: mongodb
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
require 'spec_helper'



describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'Should update source list' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    it 'Should add mongoDB to source list' do
      expect(chef_run).to add_apt_repository('mongodb-org')
    end

    it 'Should install mongoDB' do
      expect(chef_run).to install_package 'mongodb-org'
    end

    it 'Should create a mongod.conf template file at /etc/mongod.conf' do
      expect(chef_run).to create_template '/etc/mongod.conf'
    end

    it 'Should create a mongod.service template file at /etc/mongod.service' do
      expect(chef_run).to create_template '/etc/mongod.service'
    end
  end
end
