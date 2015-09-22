# Taxons

## List Taxons

```shell
curl "https://kabuni.com/api/v2/taxons"
```

```json
{
  "data": [
    {
      "id": "2",
      "type": "spree_taxons",
      "attributes": {
        "name": "SLEEP",
        "permalink": "category/sleep",
        "position": 0,
        "description": null,
        "meta_title": null,
        "meta_description": null,
        "meta_keywords": null,
        "depth": 1,
        "classifications_count": null
      },
      "relationships": {
        "taxonomy": {
          "data": {
            "type": "spree_taxonomies",
            "id": "1"
          }
        },
        "parent": {
          "data": {
            "type": "spree_taxons",
            "id": "1"
          }
        },
        "children": {
          "data": [
            {
              "type": "spree_taxons",
              "id": "3"
            }
          ]
        }
      }
    }
  ]
}
```

List all the taxons in the database.

## Show Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_taxons",
    "attributes": {
      "name": "Category",
      "permalink": "category",
      "position": 0,
      "description": null,
      "meta_title": null,
      "meta_description": null,
      "meta_keywords": null,
      "depth": 0,
      "classifications_count": 1
    },
    "relationships": {
      "taxonomy": {
        "data": {
          "type": "spree_taxonomies",
          "id": "1"
        }
      },
      "parent": {
        "data": null
      },
      "children": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "2"
          }
        ]
      }
    }
  }
}
```

Locate the taxon that you're looking for via its `id`.

## Show Taxonomy of a Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/1/taxonomy"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_taxonomies",
    "attributes": {
      "name": "Category",
      "position": 1
    },
    "relationships": {
      "taxons": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "2"
          },
          {
            "type": "spree_taxons",
            "id": "1"
          }
        ]
      },
      "children": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "2"
          }
        ]
      }
    }
  }
}
```

Display the taxonomy that a taxon belongs.

## Show Parent of a Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/2/parent"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_taxons",
    "attributes": {
      "name": "Category",
      "permalink": "category",
      "position": 0,
      "description": null,
      "meta_title": null,
      "meta_description": null,
      "meta_keywords": null,
      "depth": 0,
      "classifications_count": 1
    },
    "relationships": {
      "taxonomy": {
        "data": {
          "type": "spree_taxonomies",
          "id": "1"
        }
      },
      "parent": {
        "data": null
      },
      "children": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "2"
          }
        ]
      }
    }
  }
}
```

Display the parent taxon that a taxon may belong to.

## List Children of a Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/1/children"
```

```json
{
  "data": [
    {
      "id": "2",
      "type": "spree_taxons",
      "attributes": {
        "name": "SLEEP",
        "permalink": "category/sleep",
        "position": 0,
        "description": null,
        "meta_title": null,
        "meta_description": null,
        "meta_keywords": null,
        "depth": 1,
        "classifications_count": null
      },
      "relationships": {
        "taxonomy": {
          "data": {
            "type": "spree_taxonomies",
            "id": "1"
          }
        },
        "parent": {
          "data": {
            "type": "spree_taxons",
            "id": "1"
          }
        },
        "children": {
          "data": [
            {
              "type": "spree_taxons",
              "id": "3"
            }
          ]
        }
      }
    }
  ]
}
```

List all the children that a taxon has.

## Show Child of a Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/1/children/2"
```

```json
{
  "data": {
    "id": "2",
    "type": "spree_taxons",
    "attributes": {
      "name": "SLEEP",
      "permalink": "category/sleep",
      "position": 0,
      "description": null,
      "meta_title": null,
      "meta_description": null,
      "meta_keywords": null,
      "depth": 1,
      "classifications_count": null
    },
    "relationships": {
      "taxonomy": {
        "data": {
          "type": "spree_taxonomies",
          "id": "1"
        }
      },
      "parent": {
        "data": {
          "type": "spree_taxons",
          "id": "1"
        }
      },
      "children": {
        "data": [
          {
            "type": "spree_taxons",
            "id": "3"
          }
        ]
      }
    }
  }
}
```

Find a child via its `id` and its owners (taxon) `id`.

## List Products of a Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/1/products"
```

```json
{
  "data": [
    {
      "id": "10",
      "type": "spree_products",
      "attributes": {
        "name": "Spree Ringer T-Shirt",
        "description": "Velit nemo odio ducimus nobis non doloremque beatae sunt. Totam quia voluptatum perferendis tempore sed voluptate consequuntur. Sit id corporis autem veritatis reprehenderit.",
        "slug": "spree-ringer-t-shirt",
        "meta_description": null,
        "meta_keywords": null,
        "store_name": "Whole New Home"
      },
      "relationships": {
        "master": {
          "data": {
            "type": "spree_variants",
            "id": "10"
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

List all of the products that taxon owns via the taxons `id`.

## Show Product of a Taxon

```shell
curl "https://kabuni.com/api/v2/taxons/1/products/10"
```

```json
{
  "data": {
    "id": "10",
    "type": "spree_products",
    "attributes": {
      "name": "Spree Ringer T-Shirt",
      "description": "Velit nemo odio ducimus nobis non doloremque beatae sunt. Totam quia voluptatum perferendis tempore sed voluptate consequuntur. Sit id corporis autem veritatis reprehenderit.",
      "slug": "spree-ringer-t-shirt",
      "meta_description": null,
      "meta_keywords": null,
      "store_name": "Whole New Home"
    },
    "relationships": {
      "master": {
        "data": {
          "type": "spree_variants",
          "id": "10"
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

Fetch a product of taxon via the taxon's `id` and the products `id`.
