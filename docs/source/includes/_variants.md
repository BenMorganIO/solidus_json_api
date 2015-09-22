# Variants

## List Variants

```shell
curl "https://kabuni.com/api/v2/variants"
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
            },
            {
              "type": "spree_prices",
              "id": "2"
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

List all variants in the DB including master variants.

## Show Variant

```shell
curl "https://kabuni.com/api/v2/variants/1"
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
          },
          {
            "type": "spree_prices",
            "id": "2"
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

Fetch a variant by its `id`.

## List Prices of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/prices"
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
    },
    {
      "id": "2",
      "type": "spree_prices",
      "attributes": {
        "amount": "14.0",
        "price": "14.0",
        "display_amount": "€14,00 EUR",
        "display_price": "€14,00 EUR",
        "currency": "EUR"
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

List all of the prices for a variant.

## Show Price of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/prices/1"
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

Fetch a price for a variant by the price and variants `id`.

## Show Product of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/product"
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
          },
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

Fetch the product the a variant belongs to by the variant's `id`.

## List Option Values of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/option_values"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_option_values",
      "attributes": {
        "name": "Small",
        "presentation": "S",
        "position": 1
      },
      "relationships": {
        "option_type": {
          "data": {
            "type": "spree_option_types",
            "id": "1"
          }
        },
        "variants": {
          "data": [
            {
              "type": "spree_variants",
              "id": "1"
            }
          ]
        }
      }
    }
  ]
}
```

List all of the option values that belong to a variant via the variant's `id`.

## Show Option Value of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/option_values/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_option_values",
    "attributes": {
      "name": "Small",
      "presentation": "S",
      "position": 1
    },
    "relationships": {
      "option_type": {
        "data": {
          "type": "spree_option_types",
          "id": "1"
        }
      },
      "variants": {
        "data": [
          {
            "type": "spree_variants",
            "id": "1"
          }
        ]
      }
    }
  }
}
```

Fetch an option value via the option value's `id` and the variant's `id`.

## List Images of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/images"
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
          "mini": "/spree/products/21/mini/tot_tote.jpeg?1442035828",
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

List all of the images of a variant via the variant's `id`.

## Show Image of a Variant

```shell
curl "https://kabuni.com/api/v2/variants/1/images/21"
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
        "mini": "/spree/products/21/mini/tot_tote.jpeg?1442035828",
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

Fetch an image of a variant via the image and the variant's `id`s.
