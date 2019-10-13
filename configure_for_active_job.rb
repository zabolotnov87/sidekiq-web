# frozen_string_literal: true

require 'active_job'

ActiveJob::Base.queue_adapter = :sidekiq

module SidekiqScheduler
  module Utils
    def self.try_to_constantize(klass)
      Object.const_set(klass, Class.new(ActiveJob::Base))
    end
  end

  class Scheduler
    def active_job_enqueue?(_)
      true
    end
  end
end
