# coding: utf-8
#
# Cookbook Name:: variant-call-gatk
# Recipe:: workflow
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

# create workflow directory
directory node.dir.wf

# place workflow
template "#{node.dir.wf}/variant-call-gatk.cf" do
  source "variant-call-gatk.cf.erb"
end

