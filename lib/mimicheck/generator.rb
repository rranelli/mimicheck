require_relative 'generator/array'
require_relative 'generator/bool'
require_relative 'generator/byte'
require_relative 'generator/carousel'
require_relative 'generator/char'
require_relative 'generator/elements'
require_relative 'generator/float'
require_relative 'generator/int'
require_relative 'generator/string'
require_relative 'generator/such_that'
require_relative 'generator/uint'
require_relative 'generator/wrapper'

module MimiCheck
  module Generator
    def call(*)
      generate
    end

    def to_proc
      -> (*) { call }
    end
  end
end
