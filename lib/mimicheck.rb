require_relative 'mimicheck/tail_call_optimization'
require_relative 'mimicheck/result'
require_relative 'mimicheck/checker'
require_relative 'mimicheck/generator'
require_relative 'mimicheck/version'
require_relative 'mimicheck/rspec_helper'

module MimiCheck
  class << self
    attr_accessor :trials
  end
  self.trials ||= 100
end
