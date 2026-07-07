module MyUtility
    module Formatter
        def self.currency(amount)
            "$#{'%.2f' % amount}"
        end

        def self.titleize(string)
            string.split.map(&:capitalize).join(' ')
        end
    end
end