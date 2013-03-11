#
# Cookbook Name:: scafandru
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"
include_recipe "database::mysql"

service "mysql" do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

mysql_connection_info = {
  host:     "localhost",
  username: "root",
  password: node[:mysql][:server_root_password] # from the Vagrantfile
}

mysql_database node[:mysql][:database_name] do
  connection  mysql_connection_info
  action      :create
end

mysql_database_user node[:mysql][:database_user_name] do
  connection      mysql_connection_info
  password        node[:mysql][:database_user_password]
  database_name   node[:mysql][:database_name]
  host            "localhost"
  action          [:create, :grant]
end


