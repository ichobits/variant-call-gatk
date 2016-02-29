# coding: utf-8
#
# Cookbook Name:: variant-call-gatk
# Recipe:: data
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

kgenomes_url_base = "ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/HG00096/sequence_read/SRR"
kgenomes_dir = "#{node.dir.data}/kgenomes"
hg38_url_base = "ftp://gsapubftp-anonymous:@ftp.broadinstitute.org/bundle/hg38/hg38bundle"

kgenomes_idlist = ["062634", "062635", "062641", "077487", "081241"]
hg38_filelist = ["1000G_omni2.5.hg38.vcf.gz", "hapmap_3.3.hg38.vcf.gz",
                 "Homo_sapiens_assembly38.dbsnp138.vcf.gz",
                 "1000G_phase1.snps.high_confidence.hg38.vcf.gz",
                 "Mills_and_1000G_gold_standard.indels.hg38.vcf.gz",
                 "Homo_sapiens_assembly38.fasta.gz"]

# hg38_dir = "#{node.dir.data}/hg38bundle"
hg38_dir = node.dir.data


directory node.dir.data
directory hg38_dir
directory kgenomes_dir

kgenomes_idlist.each { |id|

  url1 = "#{kgenomes_url_base}#{id}_1.filt.fastq.gz"
  url2 = "#{kgenomes_url_base}#{id}_2.filt.fastq.gz"

  remote_file "#{kgenomes_dir}/#{File.basename( url1 )}" do
    action :create_if_missing
    source url1
    retries 1
  end

  remote_file "#{kgenomes_dir}/#{File.basename( url2 )}" do
    action :create_if_missing
    source url2
    retries 1
  end
}

hg38_filelist.each { |file|

  remote_file "#{hg38_dir}/#{file}" do
    action :create_if_missing
    source "#{hg38_url_base}/#{file}"
    retries 1
  end
}


bash "gunzip_bgzip_Homo_sapiens_assembly38.dbsnp138.vcf.gz" do
  code <<-SCRIPT
gunzip Homo_sapiens_assembly38.dbsnp138.vcf.gz
bgzip Homo_sapiens_assembly38.dbsnp138.vcf
  SCRIPT
  cwd hg38_dir
end

