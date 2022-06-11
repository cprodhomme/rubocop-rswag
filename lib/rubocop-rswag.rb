# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/rswag'
require_relative 'rubocop/rswag/version'
require_relative 'rubocop/rswag/inject'

RuboCop::Rswag::Inject.defaults!

require_relative 'rubocop/cop/rswag_cops'
