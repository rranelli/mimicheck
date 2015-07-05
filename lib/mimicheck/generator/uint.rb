module MimiCheck
  module Generator
    class UInt
      include Generator

      def initialize(range = 0..1e9)
        @int_gen = Int.new(range)
      end
      attr_reader :int_gen
      private :int_gen

      def generate
        int_gen.generate.abs
      end
    end
  end
end
