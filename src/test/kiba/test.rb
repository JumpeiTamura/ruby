require 'bundler/setup'
require 'kiba'
require 'pry'
require './syncjob'

job = SyncJob.setup
Kiba.run(job)
