require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    mail = ProductMailer.with(product: products(:tshirt), subscriber: subscribers(:david)).in_stock
    assert_match "in stock", mail.subject
    assert_equal [ subscribers(:david).email ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
