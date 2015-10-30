# Prices

## List Prices

```shell
curl "https://example.com/api/v2/prices"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_prices",
      "attributes": {
        "amount": "15.99",
        "price": "15.99",
        "display_amount": "$15.99 CAD",
        "display_price": "$15.99 CAD",
        "currency": "CAD"
      },
      "relationships": {
        "variant": {
          "data": {
            "type": "spree_variants",
            "id": "1"
          }
        }
      }
    }
  ]
}
```

List all of the prices in the database.

## Show Price

```shell
curl "https://example.com/api/v2/prices/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_prices",
    "attributes": {
      "amount": "15.99",
      "price": "15.99",
      "display_amount": "$15.99 CAD",
      "display_price": "$15.99 CAD",
      "currency": "CAD"
    },
    "relationships": {
      "variant": {
        "data": {
          "type": "spree_variants",
          "id": "1"
        }
      }
    }
  }
}
```

Fetch a price via its `id`.

## Show Variant of a Price

```shell
curl "https://example.com/api/v2/prices/1/variant"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_variants",
    "attributes": {
      "sku": "ROR-00011",
      "weight": "0.0",
      "height": "1.0",
      "width": "3.0",
      "depth": "2.0",
      "is_master": true,
      "position": 1,
      "name": "Ruby on Rails Tote",
      "price": "15.99",
      "display_price" : "$15.99 CAD"
    },
    "relationships": {
      "prices": {
        "data": [
          {
            "type": "spree_prices",
            "id": "1"
          }
        ]
      },
      "option_values": {
        "data": [
          {
            "type": "spree_option_values",
            "id": "1"
          }
        ]
      },
      "images": {
        "data": [
          {
            "type": "spree_images",
            "id": "1"
          }
        ]
      },
      "product": {
        "data": {
          "type": "spree_products",
          "id": "1"
        }
      }
    }
  }
}
```

Fetch the variant a price belongs to via the price's `id`.

## Show Product of a Price

```shell
curl "https://example.com/api/v2/prices/1/product"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_products",
    "attributes": {
      "name": "Ruby on Rails Tote",
      "description": "Dolorem molestias sint maxime id at rem qui exercitationem. Neque voluptas corrupti magni suscipit iusto voluptatum. Ea quibusdam dolorem inventore praesentium sed dicta eveniet et. Rerum inventore laudantium quisquam earum consequatur dignissimos.",
      "slug": "ruby-on-rails-tote",
      "meta_description": null,
      "meta_keywords": null,
      "store_name": "Whole New Home"
    },
    "relationships": {
      "master": {
        "data": {
          "type": "spree_variants",
          "id": "1"
        }
      },
      "variants": {
        "data": []
      },
      "taxons": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "18"
          }
        ]
      },
      "option_types": {
        "data": [
          {
            "type": "spree_option_types",
            "id": "1"
          }
        ]
      },
      "images": {
        "data": [
          {
            "type": "spree_images",
            "id": "1"
          }
        ]
      }
    }
  }
}
```

Fetch the product a price belongs to via the price's `id`.
