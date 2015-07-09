describe MimiCheck::Checker do
  subject(:checker) { base_checker }

  let(:base_checker) { described_class.for(property).with(trials: trials) }
  let(:trials) { MimiCheck.trials }

  let(:property) { -> (_, _) { true } }

  shared_examples_for 'property check' do
    it { is_expected.to be_a(MimiCheck::Result::Success) }
    it { is_expected.to eq(MimiCheck::Result::Success.new(property)) }

    it 'evaluates the property once for every example' do
      expect(property).to receive(:call)
        .exactly(num_examples).times
        .and_call_original

      subject
    end

    context 'when the property is falsified' do
      let(:property) { -> (_, _) { false } }

      it { is_expected.to be_a(MimiCheck::Result::Falsified) }

      it 'short circuits property evaluation' do
        expect(property).to receive(:call)
          .exactly(:once)
          .and_call_original

        subject
      end

      context 'when the property throws an exception' do
        let(:property) { -> (_, _) { fail } }

        it { is_expected.to be_a(MimiCheck::Result::Falsified) }

        it 'short circuits property evaluation' do
          expect(property).to receive(:call)
            .exactly(:once)
            .and_call_original

          subject
        end
      end
    end
  end

  describe '#check_examples' do
    subject(:check_examples) { checker.check_examples(examples) }

    let(:examples) { (0..rand(1..50)).map { |x| [{ a: x }, { b: x }] } }

    let(:num_examples) { examples.size }

    it_behaves_like 'property check'

    context 'when pre-loading the examples' do
      let(:checker) { base_checker.with(examples: examples) }

      it_behaves_like 'property check'
    end
  end

  describe '#check' do
    subject(:check) { checker.check(generators) }

    let(:generators) { [gen1, gen2] }
    let(:gen1) { -> {} }
    let(:gen2) { -> {} }

    let(:num_examples) { trials }

    it_behaves_like 'property check'

    context 'when pre-loading the generators' do
      let(:checker) { base_checker.with(generators: generators) }

      it_behaves_like 'property check'
    end

    describe 'known properties of arrays' do
      let(:generators) { [generator] }

      let(:generator) { MimiCheck::Generator::Array.new(int_gen, 1..100) }
      let(:int_gen) { MimiCheck::Generator::Int.new(0..10) }

      describe 'sort must be idempotent' do
        let(:property) { -> (xs) { xs.sort == xs.sort.sort } }
        it { is_expected.to be_a(MimiCheck::Result::Success) }
      end

      describe 'sort must be sorted' do
        let(:property) do
          lambda do |xs|
            xs.sort!
            _head, *tail = xs
            *head, _last = xs
            head.zip(tail).all? { |x, y| y >= x }
          end
        end

        it { is_expected.to be_a(MimiCheck::Result::Success) }
      end

      describe 'reverse is its own inverse' do
        let(:property) { -> (xs) { xs.reverse.reverse! == xs } }
        it { is_expected.to be_a(MimiCheck::Result::Success) }
      end
    end
  end
end
