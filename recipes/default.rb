#
# Cookbook Name:: scafandru
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'tomcat'
include_recipe "tomcat::users"

group node[:scafandru][:group]

user node[:scafandru][:user] do
  group node[:scafandru][:group]
  system true
  shell '/bin/bash'
end


artifact_deploy 'scafandru' do
  version           node[:scafandru][:artifact_version]
  artifact_location node[:scafandru][:artifact_url]
  deploy_to         node[:scafandru][:deploy_to]
  owner             node[:scafandru][:user]
  group             node[:scafandru][:group]
  action            :deploy
end

directory "#{node[:tomcat][:home]}/webapps" do
  recursive true
end

link "#{node[:tomcat][:home]}/webapps/myface.war" do
  to "#{node[:scafandru][:deploy_to]}/current/myface.war"
end