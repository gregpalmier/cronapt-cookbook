#
# Cookbook Name:: cronapt
# Recipe:: default
#
# Copyright (C) 2014 Greg Palmier

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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

template "/etc/apt/apt.conf.d/local" do
  source "dpkg-options.erb"
  owner "root"
  group 0
  mode 00644
  variables(
    :force_confmiss => node['cronapt']['force_confmiss'],
    :force_confnew => node['cronapt']['force_confnew'],
    :force_confdef => node['cronapt']['force_confdef'],
    :force_confold => node['cronapt']['force_confold'],
  )
end

template "/etc/cron-apt/config" do
  source "config.erb"
  owner "root"
  group 0
  mode 00644
end
