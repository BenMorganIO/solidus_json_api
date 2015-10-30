# Filtering

```shell
curl "https://example.com/api/v2/kittens?filter[id]=1"
curl "https://example.com/api/v2/kittens?filter[id]=2,3,4"
curl "https://example.com/api/v2/kittens?filter[breed]=Persian,British%20Shorthair,Bengal"
```

This project supports the [JSON API's `filter` keyword](http://jsonapi.org/format/#fetching-filtering) with only the root object, not any of its relationships yet.
You can filter any of the attributes that is inside of the data object.
Please see the example requests to the side on how you my filter a kitten object.
