#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Sebastian::Application.load_tasks




require 'chef'

TOPDIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$vcs = :git
load 'chef/tasks/chef_repo.rake'