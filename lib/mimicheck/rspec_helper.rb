module MimiCheck
  module RSpecHelper
    def check(prop, gens = nil)
      gens = Array(gens || generators)

      result = checker_for(prop).check(gens)
      expect(result).to eq(MimiCheck::Result::Success.new(prop))
    end

    def check_with_examples(prop, exs = nil)
      exs = Array(exs || examples)

      result = checker_for(prop).check_examples(exs)
      expect(result).to eq(MimiCheck::Result::Success.new(prop))
    end

    def generators
      fail 'You must define a list of generators with let(:generators) { ... }'
    end

    def examples
      fail 'You must define a list of examples with let(:examples) { ... }'
    end

    private

    def checker_for(prop, trls = MimiCheck.trials)
      trls = trials if respond_to?(:trials)
      MimiCheck::Checker.for(prop).with(trials: trls)
    end
  end
end
