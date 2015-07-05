module MimiCheck
  class Checker
    extend TailCallOptimization

    attr_reader :trials, :property, :generators, :examples

    def self.for(proc, &blk)
      new(proc || blk).with
    end

    def with(trials: nil, generators: nil, examples: nil)
      tap do
        @trials = trials if trials
        @generators = generators if generators
        @examples = examples if examples
      end
    end

    def check(gens = nil)
      check! Array(gens || generators)
    end

    def check_examples(exs = nil)
      check_examples! Array(exs || examples)
    end

    private

    def initialize(property)
      @property = property
      @trials = MimiCheck.trials
      @examples = []
      @generators = []
    end

    def check!(gens)
      exs = (1..trials).map { gens.map(&:call) }
      check_examples!(exs)
    end

    def check_examples!(exs)
      example, *es = exs
      return MimiCheck::Result::Success.new(property) unless example

      result, error = safe_check(*example)
      return MimiCheck::Result::Falsified.new(property, error) unless result

      check_examples!(es)
    end
    tail_recursive :check_examples!

    def safe_check(*example)
      [property.call(*example), { example: example }]
    rescue => error
      [false, { example: example, error: error }]
    end
  end
end
