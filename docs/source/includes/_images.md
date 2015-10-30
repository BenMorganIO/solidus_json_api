# Images

## List Images

```shell
curl "https://example.com/api/v2/images"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_images",
      "attributes": {
        "position": 1,
        "alt": null,
        "links": {
          "original": "/spree/products/1/original/ror_baseball_jersey_red.png?1442035822",
          "mini": "/spree/products/1/mini/ror_baseball_jersey_red.png?1442035822",
          "small": "/spree/products/1/small/ror_baseball_jersey_red.png?1442035822",
          "product": "/spree/products/1/product/ror_baseball_jersey_red.png?1442035822",
          "large": "/spree/products/1/large/ror_baseball_jersey_red.png?1442035822"
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

List all of the images stored in the database.

## Show Image

```shell
curl "https://example.com/api/v2/images/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_images",
    "attributes": {
      "position": 1,
      "alt": null,
      "links": {
        "original": "/spree/products/1/original/ror_baseball_jersey_red.png?1442035822",
        "mini": "/spree/products/1/mini/ror_baseball_jersey_red.png?1442035822",
        "small": "/spree/products/1/small/ror_baseball_jersey_red.png?1442035822",
        "product": "/spree/products/1/product/ror_baseball_jersey_red.png?1442035822",
        "large": "/spree/products/1/large/ror_baseball_jersey_red.png?1442035822"
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

Fetch an image and its links via the image's `id`.

## Show Variant of an Image

```shell
curl "https://example.com/api/v2/images/1/variant"
```

```json
{
  "data": {
    "id": "17",
    "type": "spree_variants",
    "attributes": {
      "sku": "ROR-00001",
      "weight": "0.0",
      "height": null,
      "width": null,
      "depth": null,
      "is_master": false,
      "position": 2,
      "name": "Ruby on Rails Baseball Jersey",
      "price": null,
      "display_price": "$0.00 CAD"
    },
    "relationships": {
      "prices": {
        "data": [
          {
            "type": "spree_prices",
            "id": "33"
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
          "id": "3"
        }
      }
    }
  }
}
```

Fetch the variant that an image belongs to via the variant's `id`.

## Show Product of an Image

```shell
curl "https://example.com/api/v2/images/1/product"
```

```json
{
  "data": {
    "id": "3",
    "type": "spree_products",
    "attributes": {
      "name": "Ruby on Rails Baseball Jersey",
      "description": "Dolorem molestias sint maxime id at rem qui exercitationem. Neque voluptas corrupti magni suscipit iusto voluptatum. Ea quibusdam dolorem inventore praesentium sed dicta eveniet et. Rerum inventore laudantium quisquam earum consequatur dignissimos.",
      "slug": "ruby-on-rails-baseball-jersey",
      "meta_description": null,
      "meta_keywords": null,
      "store_name": "Whole New Home"
    },
    "relationships": {
      "master": {
        "data": {
          "type": "spree_variants",
          "id": "3"
        }
      },
      "variants": {
        "data": [
          {
            "type": "spree_variants",
            "id": "1"
          }
        ]
      },
      "taxons": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "53"
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
            "id": "24"
          }
        ]
      }
    }
  }
}
```

Find the product that image belongs to via the image's `id`.
