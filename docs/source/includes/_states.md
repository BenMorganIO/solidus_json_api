# States

## List States

```shell
curl "https://kabuni.com/api/v2/states"
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

This will list all of the states.

## Show State

```shell
curl "https://kabuni.com/api/v2/states/1"
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

Select a state via its `id`.

## Show Country of a States

```shell
curl "https://kabuni.com/api/v2/states/1/countries"
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

View the country that a state belongs to via the state's `id`.
