module MimiCheck
  module Generator
    class SuchThat
      extend TailCallOptimization
      include Generator

      def initialize(generator, predicate = nil, &blk)
        @generator = generator
        @predicate = predicate || blk
      end
      attr_reader :generator, :predicate
      private :generator, :predicate

      def generate
        result = generator.call
        return result if predicate.call(result)
        generate
      end
      tail_recursive :generate
    end
  end
end
