module MimiCheck
  module Generator
    class Wrapper
      include Generator

      def initialize(element)
        @element = element
      end
      attr_reader :element
      private :element

      def generate
        return element unless element.respond_to?(:call)
        element.call
      end
    end
  end
end
