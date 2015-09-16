#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'apache2' do
  action :install
end

service 'apache2' do
  action [:start, :enable]
end
