module MimiCheck
  module Generator
    class Array
      include Generator

      def initialize(generator = default_gen, size_range = 0..20)
        @generator = generator
        @size_range = size_range
      end
      attr_reader :generator, :size_range
      private :generator, :size_range

      def generate
        size = Int.new(size_range).generate
        (1..size).map { generator.call }
      end
    end
  end
end
