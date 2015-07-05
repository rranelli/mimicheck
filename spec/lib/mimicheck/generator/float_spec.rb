describe MimiCheck::Generator::Float do
  let(:generator) { described_class.new(range) }
  let(:range) { min..max }
  let(:min) { rand(-100..100) }
  let(:max) { min + rand(50) }

  let(:generators) { [generator] }
  let(:trials) { 2000 }

  let(:more_than_range_min?) { -> (x) { x >= range.min } }
  let(:less_than_range_max?) { -> (x) { x <= range.max } }

  it_behaves_like 'generator'

  it { check(more_than_range_min?) }
  it { check(less_than_range_max?) }

  context 'when the range contains only a single possible value' do
    let(:range) { min..min }

    let(:always_same?) { -> (x) { x == min } }
    it { check(always_same?) }
  end

  context 'when the range is empty' do
    let(:range) { min...min }

    it { expect(&generator).to raise_error(ArgumentError) }
  end
end
