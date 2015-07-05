module MimiCheck
  class Result
    class Success
      def initialize(property)
        @property = property
      end
      attr_reader :property

      def ==(other)
        return false unless other.is_a?(self.class)
        property == other.property
      end
    end

    class Falsified
      def initialize(property, counter_examples)
        @property = property
        @counter_examples = counter_examples
      end
      attr_reader :property, :counter_examples

      def ==(other)
        return false unless other.is_a?(self.class)
        property == other.property &&
          counter_examples == other.counter_examples
      end
    end
  end
end
