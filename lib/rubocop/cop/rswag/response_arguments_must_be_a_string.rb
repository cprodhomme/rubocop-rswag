# frozen_string_literal: true

module RuboCop
  module Cop
    module Rswag
      # TODO: Write cop description and example of bad / good code. For every
      # `SupportedStyle` and unique configuration, there needs to be examples.
      # Examples must have valid Ruby syntax. Do not use upticks.
      #
      # @safety
      #   Delete this section if the cop is not unsafe (`Safe: false` or
      #   `SafeAutoCorrect: false`), or use it to explain how the cop is
      #   unsafe.
      #
      # @example EnforcedStyle: bar (default)
      #   # Description of the `bar` style.
      #
      #   # bad
      #   bad_bar_method
      #
      #   # bad
      #   bad_bar_method(args)
      #
      #   # good
      #   good_bar_method
      #
      #   # good
      #   good_bar_method(args)
      #
      # @example EnforcedStyle: foo
      #   # Description of the `foo` style.
      #
      #   # bad
      #   bad_foo_method
      #
      #   # bad
      #   bad_foo_method(args)
      #
      #   # good
      #   good_foo_method
      #
      #   # good
      #   good_foo_method(args)
      #
      class ResponseArgumentsMustBeAString < Base
        MSG = '`response` arguments must be a string.'

        # @!method bad_method?(node)
        # (send nil? :bad_method ...)
        def_node_matcher :bad_method?, <<~PATTERN
          (send nil? :response (int $_) ...)
        PATTERN

        def on_send(node)
          return unless bad_method?(node)

          add_offense(node)
        end
      end
    end
  end
end
