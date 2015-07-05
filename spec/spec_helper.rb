$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mimicheck'

RSpec.configure do |config|
  config.order = :random
  config.include MimiCheck::RSpecHelper
end

RSpec.shared_examples_for 'generator' do
  it { is_expected.to respond_to(:call) }
  it { is_expected.to respond_to(:to_proc) }
  it { is_expected.to respond_to(:generate) }
end
