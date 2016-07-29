FactoryGirl.define do
  factory :upgrade do
    pu_id 1
    pu_status 1
    pu_name "MyString"
    pug_name "MyString"
    pug_status 1
    inv_hide 1
    plan_inv_hide 1
    pu_priority 1
  end
  factory :order_item do
    product nil
    order nil
    unit_price "9.99"
    quantity 1
    total_price "9.99"
  end
  factory :order do
    subtotal "9.99"
    discount "9.99"
    total "9.99"
    order_status nil
  end
  factory :order_status do
    name "MyString"
  end
  factory :product do
    plan_id 1
    name "MyString"
    price "9.99"
    active false
    stock 1
  end
end
