# Option Values

## List Option Values

```shell
curl "https://kabuni.com/api/v2/option_values"
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

List all of the option values.

## Show Option Value

```shell
curl "https://kabuni.com/api/v2/option_values/1"
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

Find an option value by its `id`.

## Show Option Type of an Option Value

```shell
curl "https://kabuni.com/api/v2/option_values/1/option_type"
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

Find the option type of an option value by the option value's `id`.

## List Variants of an Option Value

```shell
curl "https://kabuni.com/api/v2/option_values/1/variants"
```

```json
{
  "data": [
    {
      "id": "1",
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
        "price": "15.99",
        "display_price": "$15.99 CAD"
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
  ]
}
```

List all of the variants that belong to an option value via the option value's `id`.

## Show Variant of an Option Value

```shell
curl "https://kabuni.com/api/v2/option_values/1/variants/1"
```

```json
{
  "data": {
    "id": "1",
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
      "price": "15.99",
      "display_price": "$15.99 CAD"
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

Show a variant that belongs to an option value via the option value's `id`.
