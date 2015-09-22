# Taxonomies

## List Taxonomies

```shell
curl "https://kabuni.com/api/v2/taxonomies"
```

```json
{
  "data": [
    {
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
  ]
}
```

List of the taxonomies in the database.

## Show Taxonomy

```shell
curl "https://kabuni.com/api/v2/taxonomies/1"
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

Select a taxonomy via the `id`.

## List Taxons of a Taxonomy

```shell
curl "https://kabuni.com/api/v2/taxonomies/1/taxons"
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
    },
    {
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
  ]
}
```

List all of the taxons that a taxonomy has a reference to.

## Show Taxon of a Taxonomy

```shell
curl "https://kabuni.com/api/v2/taxonomies/1/taxons/1"
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

Find a taxon that the taxonomy owns via the taxonomy's `id` and the taxon's `id`.

## List Children of a Taxonomy

```shell
curl "https://kabuni.com/api/v2/taxonomies/1/children"
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

List all of the children of a taxonomy.
This does _not_ include the root taxon that would be included when listing all of the taxons of this taxonomy.

## Show Child of a Taxonomy

```shell
curl "https://kabuni.com/api/v2/taxonomies/1/children/2"
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

Fetch a child of the taxnomy via the taxonomy's `id` and the child's `id`.
