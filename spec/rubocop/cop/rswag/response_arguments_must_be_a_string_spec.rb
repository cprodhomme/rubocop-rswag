# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rswag::ResponseArgumentsMustBeAString, :config do
  let(:config) { RuboCop::Config.new }

  it 'registers an offense when `response` argument is an Integer' do
    expect_offense(<<~RUBY)
      response 200, "Index"
      ^^^^^^^^^^^^^^^^^^^^^ `response` arguments must be a string.
    RUBY
  end

  it 'does not register an offense when using string argument for `response`' do
    expect_no_offenses(<<~RUBY)
      response "200", "Index"
    RUBY
  end
end
