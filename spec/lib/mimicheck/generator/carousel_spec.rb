describe MimiCheck::Generator::Carousel do
  subject(:generator) { described_class.new(*elements) }

  let(:elements) { MimiCheck::Generator::Array.new(int_gen, 1..20).generate }
  let(:int_gen) { MimiCheck::Generator::UInt.new }

  let(:trials) { 100 }
  let(:generators) { [generator] }

  let(:included_in_passed_elements?) { -> (x) { elements.include?(x) } }

  it_behaves_like 'generator'

  describe '#generate' do
    it { check(included_in_passed_elements?) }

    it 'returns the given elements in order' do
      gen_elts = (1..(elements.size)).map { generator.generate }
      expect(gen_elts).to eq(elements)
    end

    it 'repeats the elements when generating enough times' do
      gen_elts = (1..(elements.size * 2)).map { generator.generate }
      expect(gen_elts).to eq(elements * 2)
    end
  end
end
