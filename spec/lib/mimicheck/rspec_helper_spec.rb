describe MimiCheck::RSpecHelper do
  include MimiCheck::RSpecHelper

  let(:property) { -> (_, _) { true } }

  let(:g1) { -> () { 1 } }
  let(:g2) { -> () { 2 } }

  it { expect { check(property) }.to raise_error(/:generators/) }
  it { expect { check_with_examples(property) }.to raise_error(/:examples/) }

  shared_examples_for 'can explicitly check' do
    it 'is able to #check if a property is defined' do
      check(property, [g1, g2])
    end

    it 'is able to #check_examples if a property is defined' do
      check_with_examples(property, [[1, 2], [3, 4], [5, 6]])
    end
  end

  it_behaves_like 'can explicitly check'

  context 'with generators defined' do
    let(:generators) { [g1, g2] }

    it_behaves_like 'can explicitly check'

    it { check(property) }

    context 'with examples defined' do
      let(:examples) { [[1, 2], [3, 4], [5, 6]] }
      it { check_with_examples(property, examples) }
    end
  end

  context 'with examples defined' do
    let(:examples) { [[1, 2], [3, 4], [5, 6]] }

    it_behaves_like 'can explicitly check'

    it { check_with_examples(property, examples) }
    it do
      expect { check(property, generators) }.to raise_error(/:generators/)
    end

    context 'with generators defined' do
      let(:generators) { [g1, g2] }
      it { check(property, generators) }
    end
  end
end
