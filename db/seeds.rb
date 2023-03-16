Product.create!([
  { name: "By the Fireplace Replica Perfume", price: "160.0", description: "A warm scent combines orange flower, clove oil, and chestnut atop a comforting vanilla fragrance to re-create the signature warmth and coziness of a crackling fire", inventory: 100 },
  { name: "Charlotte Tilbury Matte Revolution Lipstick - Pillow Talk", price: "35.0", description: "Matte Revolution in Pillow Talk enhances the natural hue of your lips so is unique to your skin tone and natural lip color.", inventory: 1000 },
  { name: "Forever Skin Glow Dior Foundation", price: "55.0", description: "Dior Forever Skin Glow is the radiant foundation by Dior that gives high perfection to the complexion with 24h wear.", inventory: 2 },
  { name: "Dyson Airwrap Styler", price: "599.99", description: "The only multi-styler to curl, shape, and hide flyaways using the Coanda effect. Not extreme heat.", inventory: 20 },
  { name: "Purity One-Step Facial Cleanser", price: "41.0", description: "Deep-cleans pores, eliminates makeup buildup, and lightly hydrates and tones skin", inventory: 1 },
])

Supplier.create!([
  { name: "Dyson", email: "dyson@test", phone_number: "1234566789" },
  { name: "Charlotte Tilbury", email: "charlottetilbury@test", phone_number: "9876654321" },
])

Image.create!([
  { url: "https://media.kohlsimg.com/is/image/kohls/5142337?wid=1200&hei=1200&op_sharpen=1", product_id: 1 },
  { url: "https://eco-beauty.dior.com/dw/image/v2/BDGF_PRD/on/", product_id: 2 },
  { url: "https://dyson-h.assetsadobe2.com/is/image/content/dam/dyson/images/products/hero/400714-01.png?$responsive$&cropPathE=desktop&fit=stretch,1&wid=960", product_id: 3 },
  { url: "https://media.ulta.com/i/ulta/2583945?w=720&fmt=webp", product_id: 4 },
  { url: "https://images.ctfassets.net/wlke2cbybljx/6QLItVWaR3INrE5B8MMObK/79854007d3f3ed8a40a1e4d7e0c21e12/pillow-talk-packshot.png?w=500&h=500&fit=fill&fm=jpg&bg=", product_id: 5 },
  { url: "https://media.ulta.com/i/ulta/2532674?w=720&fmt=webp", product_id: 6 },
  { url: "https://www.sephora.com/productimages/sku/s2571404-main-zoom.jpg?imwidth=612", product_id: 7 },
  { url: "https://www.maisonmargiela-fragrances.us/dw/image/v2/AANG_PRD/on/demandware.static/-/Sites-margiela-master-catalog/default/dw2b3b9f37/images/products/MM005/MM005_03.jpg?sw=375&sh=375&sm=cut&sfrm=jpg&q=70", product_id: 1 },
])
