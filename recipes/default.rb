#
# Cookbook Name:: cronapt-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

package "cron-apt" do
  action :upgrade
end

template "/etc/cron.d/cron-apt" do
  source "cron-apt.erb"
  owner "root"
  group 0
  mode 00644
  variables(
    :enable_upgrade => node['cronapt']['enable_upgrade'],
    :nightly => node['cronapt']['nightly'],
    :hourly => node['cronapt']['hourly'],
    :fivemin => node['cronapt']['fivemin'],
  )
end

template "/etc/cron-apt/action.d/6-upgrade" do
  source "6-upgrade.erb"
  owner "root"
  group 0
  mode 00644
  variables(
    :enable_upgrade => node['cronapt']['enable_upgrade'],
  )
end

template "/etc/cron-apt/config" do
  source "config.erb"
  owner "root"
  group 0
  mode 00644
end
