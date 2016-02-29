#
# Cookbook Name:: variant-call-gatk
# Recipe:: tools
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "chef-bioinf-worker::gatk"
include_recipe "chef-bioinf-worker::picard"
include_recipe "chef-bioinf-worker::fastqc"
include_recipe "chef-bioinf-worker::bwa"
include_recipe "chef-bioinf-worker::samtools"
