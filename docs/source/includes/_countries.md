# Countries

## List Countries

```shell
curl "https://example.com/api/v2/countries"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_countries",
      "attributes": {
        "iso_name": "ANDORRA",
        "iso": "AD",
        "iso3": "AND",
        "name": "Andorra",
        "numcode": 20,
        "states_required": true
      },
      "relationships": {
        "states": {
          "data": [
            {
              "type": "spree_states",
              "id": "1"
            }
          ]
        }
      }
    }
  ]
}
```

List all of the ~200 countries in the DB.

## Show Country

```shell
curl "https://example.com/api/v2/countries/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_countries",
    "attributes": {
      "iso_name": "ANDORRA",
      "iso": "AD",
      "iso3": "AND",
      "name": "Andorra",
      "numcode": 20,
      "states_required": true
    },
    "relationships": {
      "states": {
        "data": [
          {
            "type": "spree_states",
            "id": "1"
          }
        ]
      }
    }
  }
}
```

Select a country via its `id`.

## List States of a Country

```shell
curl "https://example.com/api/v2/countries/1/states"
```

```json
{
  "data": [
    {
      "id": "1",
      "type": "spree_states",
      "attributes": {
        "name": "Canillo",
        "abbr": "02"
      },
      "relationships": {
        "country": {
          "data": {
            "type": "spree_countries",
            "id": "1"
          }
        }
      }
    }
  ]
}
```

See all of the states that a country owns via the country's `id`.

## Show State of a Country

```shell
curl "https://example.com/api/v2/countries/1/states/1"
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_states",
    "attributes": {
      "name": "Canillo",
      "abbr": "02"
    },
    "relationships": {
      "country": {
        "data": {
          "type": "spree_countries",
          "id": "1"
        }
      }
    }
  }
}
```

View one of the states that a country owns via the country's `id` and the state's `id`.
