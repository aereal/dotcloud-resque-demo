require 'resque'

module Demo
  module Job
    @queue = :default

    def self.perform(params)
      sleep 10
      puts "Processed a job!"
    end
  end
  
  module FailingJob
    @queue = :failing

    def self.perform(params)
      sleep 10
      raise 'not processable!'
      puts "Processed a job!"
    end
  end
end
