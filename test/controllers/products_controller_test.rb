require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "image_url", "description", "created_at", "updated_at", "inventory"], data.keys

    assert_equal true, data.keys.include?("name")
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "Dermalogica Circular Hydration Serum", price: 64.00, image_url: "https://media.ulta.com/i/ulta/2591108?w=720&fmt=webp", description: "This long lasting serum immediately floods skin with hydration and helps prevent future hydration evaporation." }

      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    patch "/products/#{Product.first.id}.json", params: { price: 200 }
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal 200.0, data["price"].to_i
    patch "/products/#{Product.first.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
