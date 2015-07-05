module MimiCheck
  module Generator
    class Char
      include Generator

      def initialize
        @uint_gen = UInt.new(0..128)
      end
      attr_reader :uint_gen
      private :uint_gen

      def generate
        uint_gen.generate.chr
      end
    end
  end
end
