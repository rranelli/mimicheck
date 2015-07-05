describe MimiCheck::Generator::Elements do
  subject(:generator) { described_class.new(*elements) }

  let(:elements) { MimiCheck::Generator::Array.new(int_gen, 1..5).generate }
  let(:int_gen) { MimiCheck::Generator::UInt.new }

  let(:trials) { 100 }

  let(:generators) { [generator] }
  let(:included_in_passed_elements?) { -> (x) { elements.include?(x) } }

  it_behaves_like 'generator'

  describe '#generate' do
    it { check(included_in_passed_elements?) }

    context 'when some arguments are arrays' do
      let(:elements) { [[:a, :b], [:c, :d]] }

      it { check(included_in_passed_elements?) }
    end
  end
end
