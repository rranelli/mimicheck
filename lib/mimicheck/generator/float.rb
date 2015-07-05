module MimiCheck
  module Generator
    class Float
      include Generator

      def initialize(range = -1e10..1e10)
        @min = range.min
        @max = range.max
      end

      attr_reader :min, :max
      private :min, :max

      def generate
        fail ArgumentError unless min && max
        Random.rand * (max - min) + min
      end
    end
  end
end
