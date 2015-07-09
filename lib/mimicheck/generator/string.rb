module MimiCheck
  module Generator
    class String
      include Generator

      def initialize(range = 0..25)
        @range = range
      end
      attr_reader :range
      private :range

      def generate
        Array.new(Char.new, range).call.join('')
      end
    end
  end
end
