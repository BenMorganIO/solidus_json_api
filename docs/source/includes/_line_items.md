# Line Items

## Create Line Item

```shell
curl "https://kabuni.com/api/v2/line_items"
  -X POST
  -d token=abc123
  -d line_item[order_id]=1
  -d line_item[variant_id]=1
  -d line_item[quantity]=1
```

```json
{
  "data" : {
    "attributes" : {
      "additional_tax_total" : 0,
      "adjustment_total" : 0.0,
      "amount" : "10.0",
      "cost_price" : "17.0",
      "currency" : "CAD",
      "display_amount" : "$10.00 CAD",
      "display_price" : "$10.00 CAD",
      "display_total" : "$10.00 CAD",
      "order_id" : 1,
      "price" : "10.0",
      "quantity" : 1,
      "total" : "10.0",
      "variant_id" : 1
    },
    "relationships" : {
      "order" : {
        "data" : {
          "type" : "spree_orders"
        }
      },
      "variant" : {
        "data" : {
          "type" : "spree_variants"
        }
      }
    },
    "type" : "spree_line_items"
  }
}
```

This endpoint allows you add a variant to a users order by creating a line item.

### When Out of Range

> Quantity is out of range.

```shell
curl "https://kabuni.com/api/v2/line_items"
  -X POST
  -d token=abc123
  -d line_item[order_id]=1
  -d line_item[variant_id]=1
  -d line_item[quantity]=100000000000
```

```json
{
  "errors" : [
    {
      "detail" : "Quantity is too High",
      "meta" : {},
      "title" : "The quantity that you have submitted is astronomically high, please tone it down a bit."
    }
  ]
}
```

When requesting an insanely large amount of variants to be added to your order, this will result in an error.

### When a Variant or an Order Could Not be Found

> Order could not be found.

```shell
curl "https://kabuni.com/api/v2/line_items"
  -X POST
  -d token=abc123
  -d line_item[order_id]=0
  -d line_item[variant_id]=1
  -d line_item[quantity]=1
```

```json
{
  "errors" : [
    {
      "detail" : "Record Not Found",
      "meta" : {},
      "title" : "One of the records that you were looking for could not be found. Please check to see if the record exists or if you're permitted to read it"
    }
  ]
}
```

Sometimes, you'll submit a bad variant id or order id.
When this happens, you'll receive an error because of it.

### When the Product is Out of Stock

> Product is out of stock.

```shell
curl "https://kabuni.com/api/v2/line_items"
  -X POST
  -d token=abc123
  -d line_item[order_id]=1
  -d line_item[variant_id]=1
  -d line_item[quantity]=1
```

```json
{
  "errors" : [
    {
      "detail" : "Product is out of Stock",
      "meta" : {},
      "title" : "This product is out of stock for the selected quantity."
    }
  ]
}
```

Sometimes, there's just not going to be any left in stock.
This can happen for both two reasons:

1. The variant is tracking inventory and its stock items `count_on_hand`s have all reached 0.
2. The variant is not backorderable.

If both of these conditions are met, then you will reveice an out of stock error.
