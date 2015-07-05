module MimiCheck
  module Generator
    class Elements
      include Generator

      def initialize(*elements)
        @elements = elements
      end
      attr_reader :elements
      private :elements

      def generate
        elements.sample
      end
    end
  end
end
