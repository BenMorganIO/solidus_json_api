# Pagination

```shell
curl "https://kabuni.com/api/v2/kitten?page[number]2&page[size]=20"
```

This projects supports the [JSON API's `page` keyword](http://jsonapi.org/format/#fetching-pagination).
To specify the page number, set a `page[number]` value.
To specify the page size (the amount of records returned), set a `page[size]` value; the default is 24.
If you would like the links to the `self`, `next`, `prev`, `first`, and `last` it is not yet supported.
