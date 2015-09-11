#
# Cookbook Name:: aar
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# install the following packages
#   * apache2
#   * libapache2-mod-wsgi
#   * python-pip
#   * python-mysqldb

# Use pip to install flask

# Create /etc/apache2/sites-available/AAR-apache.conf with the template
# from templates/default/AAR-apache.conf.erb

# Disable the default site using the command a2dissite, reload the apache2 service

# Enable the AAR-apache site using the command a2ensite, reload the apache2 service
