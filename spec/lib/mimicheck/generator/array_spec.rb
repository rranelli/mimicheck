describe MimiCheck::Generator::Array do
  subject(:generator) { described_class.new(inner_gen, size_range) }
  let(:inner_gen) { MimiCheck::Generator::Int.new }
  let(:size_range) { 1..10 }

  let(:trials) { 100 }
  let(:generators) { [generator] }

  it_behaves_like 'generator'

  describe '#generate' do
    subject(:generate) { generator.generate }

    it do
      expect(inner_gen).to receive(:generate)
        .at_least(:once)
      generate
    end

    context 'when the size is fixed' do
      let(:size_range) { 10..10 }
      let(:same_size?) { -> (x) { x.size == size_range.min } }

      it 'generates arrays of that exact size' do
        check(same_size?)
      end
    end

    context 'when generating always the same element' do
      let(:inner_gen) { -> { 3 } }

      let(:compact_is_empty?) { -> (xs) { xs.uniq == [3] } }

      it 'only contains nil elements' do
        check(compact_is_empty?)
      end
    end
  end
end
