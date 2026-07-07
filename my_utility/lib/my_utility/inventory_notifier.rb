# frozen_string_literal: true

module MyUtility
  module InventoryNotifier
    extend ActiveSupport::Concern

    included do
      has_many :subscribers, dependent: :destroy
      after_update_commit :notify_subscribers, if: :back_in_stock?
    end

    def back_in_stock?
      inventory_count_previously_was.zero? && inventory_count.positive?
    end

    def notify_subscribers
      subscribers.each do |sub|
        ProductMailer.with(product: self, subscriber: sub).in_stock.deliver_later
      end
    end
  end
end
