module MimiCheck
  module Generator
    class Byte
      include Generator

      def initialize
        @uint_gen = UInt.new(0..255)
      end
      attr_reader :uint_gen
      private :uint_gen

      def generate
        uint_gen.generate
      end
    end
  end
end
