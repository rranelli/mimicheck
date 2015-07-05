module MimiCheck
  module Generator
    class Int
      include Generator

      def initialize(range = -1e9..1e9)
        @float_gen = Float.new(range)
      end
      attr_reader :float_gen
      private :float_gen

      def generate
        float_gen.generate.to_i
      end
    end
  end
end
