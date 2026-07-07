# frozen_string_literal: true

require_relative "my_utility/version"
require_relative "my_utility/formatter"
require_relative "my_utility/inventory_notifier"

module MyUtility
  class Error < StandardError; end
end
