#
# Cookbook Name:: aar
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# execute 'apt-get update'

# install the following packages
#   * apache2
#   * libapache2-mod-wsgi
#   * python-pip
#   * python-mysqldb
%w{apache2 libapache2-mod-wsgi python-pip python-mysqldb}.each do |p|
  package p
end

# Use pip to install flask
execute 'pip install flask' do
  not_if "pip show Flask | grep Flask"
end

# Create /etc/apache2/sites-available/AAR-apache.conf with the template
# from templates/default/AAR-apache.conf.erb
template "/etc/apache2/sites-available/AAR-apache.conf" do

end

# Disable the default site using the command a2dissite, reload the apache2 service
execute "a2dissite 000-default" do
  only_if do
    File.symlink?("/etc/apache2/sites-enabled/000-default.conf")
  end
  notifies :reload, "service[apache2]"
end

# Enable the AAR-apache site using the command a2ensite, reload the apache2 service
execute "a2ensite AAR-apache" do
  not_if do
    File.symlink?("/etc/apache2/sites-enabled/AAR-apache.conf")
  end
  notifies :reload, "service[apache2]"
end

# Reload Apache
service 'apache2' do
  supports :reload => true
  action :start
end
