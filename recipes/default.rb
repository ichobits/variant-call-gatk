# coding: utf-8
#
# Cookbook Name:: variant-call-gatk
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

include_recipe "chef-cuneiform::default"
include_recipe "variant-call-gatk::tools"
include_recipe "variant-call-gatk::data"
include_recipe "variant-call-gatk::workflow"
