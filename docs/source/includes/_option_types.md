# Option Types

## List Option Types

```shell
curl "https://kabuni.com/api/v2/option_types"
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

List all of the option types in the database.

## Show Option Type

```shell
curl "https://kabuni.com/api/v2/option_types/1"
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

Fetch an option type in the database.

## List Option Values of a Option Type

```shell
curl "https://kabuni.com/api/v2/option_types/1/option_values"
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
        }
      }
    }
  ]
}
```

See all of the option values that an option type owns.

## Show Option Values of a Option Type

```shell
curl "https://kabuni.com/api/v2/option_types/1/option_values/1"
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
      }
    }
  }
}
```

Fetch an option value that an option type owns.

## List Products of a Option Type

```shell
curl "https://kabuni.com/api/v2/option_types/1/products"
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
  ]
}
```

See all of the products that an option type owns.

## Show Product of a Option Type

```shell
curl "https://kabuni.com/api/v2/option_types/1/products/1"
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

Find a product that an option type owns.
