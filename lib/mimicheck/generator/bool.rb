module MimiCheck
  module Generator
    class Bool
      include Generator

      def initialize
        @elements_gen = Elements.new(true, false)
      end
      attr_reader :elements_gen
      private :elements_gen

      def generate
        elements_gen.generate
      end
    end
  end
end
