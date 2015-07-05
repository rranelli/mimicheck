module MimiCheck
  module Generator
    class Carousel
      include Generator

      def initialize(*elements)
        @elements = elements
        @current = -1
      end
      attr_reader :elements, :current
      private :elements, :current

      def generate
        return nil unless elements.size.nonzero?
        elements[(@current += 1) % elements.size]
      end
    end
  end
end
