# Products

## List Products

```shell
curl "https://example.com/api/v2/products"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_products",
      "attributes": {
        "name": "Ruby on Rails Tote",
        "description": "Velit nemo odio ducimus nobis non doloremque beatae sunt. Totam quia voluptatum perferendis tempore sed voluptate consequuntur. Sit id corporis autem veritatis reprehenderit.",
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
        "option_types": {
          "data": [
            {
              "type": "spree_option_types",
              "id": "1"
            }
          ]
        },
        "taxons": {
          "data": [
            {
              "type": "spree_taxons",
              "id": "1"
            }
          ]
        }
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
  ]
}
```

List all of the products in the database.

## Show Product

```shell
curl "https://example.com/api/v2/products/1"

# or by slug

curl "https://example.com/api/v2/products/ruby-on-rails-tote"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_products",
    "attributes": {
      "name": "Ruby on Rails Tote",
      "description": "Velit nemo odio ducimus nobis non doloremque beatae sunt. Totam quia voluptatum perferendis tempore sed voluptate consequuntur. Sit id corporis autem veritatis reprehenderit.",
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
            "id": "1"
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

Select a product via it's `id`.

## List Option Types of a Product

```shell
curl "https://example.com/api/v2/products/1/option_types"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_option_types",
      "attributes": {
        "name": "tshirt-size",
        "presentation": "Size",
        "position": 1
      },
      "relationships": {
        "option_values": {
          "data": [
            {
              "type": "spree_option_values",
              "id": "1"
            }
          ]
        },
        "products": {
          "data": [
            {
              "type": "spree_products",
              "id": "1"
            }
          ]
        }
      }
    }
  ]
}
```

List all of the option types that a product owns via the product's `id`.

## Show Option Type of a Product

```shell
curl "https://example.com/api/v2/products/1/option_types/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_option_types",
    "attributes": {
      "name": "tshirt-size",
      "presentation": "Size",
      "position": 1
    },
    "relationships": {
      "option_values": {
        "data": [
          {
            "type": "spree_option_values",
            "id": "1"
          }
        ]
      },
      "products": {
        "data": [
          {
            "type": "spree_products",
            "id": "1"
          }
        ]
      }
    }
  }
}
```

Fetch an option type of a product by both of their `id`s.

## List Variants of a Product

```shell
curl "https://example.com/api/v2/products/1/variants"
```

```json
{
  "data": [
    {
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
  ]
}
```

List all variants including the master of a product by the products `id`.

## Show Variant of a Product

```shell
curl "https://example.com/api/v2/products/1/variants/1"
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

Fetch a variant or a product's master variant that a product owns by the products `id`.

## List Images of a Product

```shell
curl "https://example.com/api/v2/products/1/images"
```

```json
{
  "data": [
    {
      "id": "21",
      "type": "spree_images",
      "attributes": {
        "position": 1,
        "alt": null,
        "links": {
          "original": "/spree/products/21/original/ror_tote.jpeg?1442035828",
          "mini": "/spree/products/21/mini/ror_tote.jpeg?1442035828",
          "small": "/spree/products/21/small/ror_tote.jpeg?1442035828",
          "product": "/spree/products/21/product/ror_tote.jpeg?1442035828",
          "large": "/spree/products/21/large/ror_tote.jpeg?1442035828"
        }
      },
      "relationships": {
        "viewable": {
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

List all of the images that belong to a product via the product's `id`.

## Show Image of a Product

```shell
curl "https://example.com/api/v2/products/1/images/21"
```

```json
{
  "data": {
    "id": "21",
    "type": "spree_images",
    "attributes": {
      "position": 1,
      "alt": null,
      "links": {
        "original": "/spree/products/21/original/ror_tote.jpeg?1442035828",
        "mini": "/spree/products/21/mini/ror_tote.jpeg?1442035828",
        "small": "/spree/products/21/small/ror_tote.jpeg?1442035828",
        "product": "/spree/products/21/product/ror_tote.jpeg?1442035828",
        "large": "/spree/products/21/large/ror_tote.jpeg?1442035828"
      }
    },
    "relationships": {
      "viewable": {
        "data": {
          "type": "spree_variants",
          "id": "1"
        }
      }
    }
  }
}
```

Fetch an image of a product via the product and the images' `id`.
