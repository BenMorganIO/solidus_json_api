# Orders

## List Orders

```shell
curl "https://example.com/api/v2/orders"
  -d token=abc123
```

```json
{
  "data" : [
    {
      "attributes" : {
        "additional_tax_total" : "0.0",
        "adjustment_total" : "0.0",
        "approved_at" : null,
        "canceled_at" : null,
        "channel" : "spree",
        "completed_at" : "2015-09-08T04:04:01.162Z",
        "confirmation_delivered" : false,
        "currency" : "CAD",
        "display_additional_tax_total" : "$0.00 CAD",
        "display_adjustment_total" : "$0.00 CAD",
        "display_included_tax_total" : "$0.00 CAD",
        "display_item_total" : "$10.00 CAD",
        "display_promo_total" : "$0.00 CAD",
        "display_shipment_total" : "$100.00 CAD",
        "display_total" : "$110.00 CAD",
        "email" : "spree@example.com",
        "included_tax_total" : "0.0",
        "item_count" : 0,
        "item_total" : "10.0",
        "number" : "#R123456789",
        "payment_state" : null,
        "payment_total" : "0.0",
        "promo_total" : "0.0",
        "shipment_state" : null,
        "shipment_total" : "100.0",
        "special_instructions" : null,
        "state" : "complete",
        "store_name" : "Example Store",
        "total" : "110.0"
      },
      "relationships" : {
        "bill_address" : {
          "data" : {
            "type" : "spree_addresses"
          }
        },
        "line_items" : {
          "data" : [
            {
              "type" : "spree_line_items"
            }
          ]
        },
        "ship_address" : {
          "data" : {
            "type" : "spree_addresses"
          }
        },
        "user" : {
          "data" : {
            "type" : "spree_users"
          }
        }
      },
      "type" : "spree_orders"
    }
  ]
}
```

## Show Order

```shell
curl "https://example.com/api/v2/orders/:id"
  -d token=abc123
```

```json
{
  "data" : {
    "attributes" : {
      "additional_tax_total" : "0.0",
      "adjustment_total" : "0.0",
      "approved_at" : null,
      "canceled_at" : null,
      "channel" : "spree",
      "completed_at" : "2015-09-08T04:04:01.162Z",
      "confirmation_delivered" : false,
      "currency" : "CAD",
      "display_additional_tax_total" : "$0.00 CAD",
      "display_adjustment_total" : "$0.00 CAD",
      "display_included_tax_total" : "$0.00 CAD",
      "display_item_total" : "$10.00 CAD",
      "display_promo_total" : "$0.00 CAD",
      "display_shipment_total" : "$100.00 CAD",
      "display_total" : "$110.00 CAD",
      "email" : "spree@example.com",
      "included_tax_total" : "0.0",
      "item_count" : 0,
      "item_total" : "10.0",
      "number" : "#R123456789",
      "payment_state" : null,
      "payment_total" : "0.0",
      "promo_total" : "0.0",
      "shipment_state" : null,
      "shipment_total" : "100.0",
      "special_instructions" : null,
      "state" : "complete",
      "store_name" : "Example Store",
      "total" : "110.0"
    },
    "relationships" : {
      "bill_address" : {
        "data" : {
          "type" : "spree_addresses"
        }
      },
      "line_items" : {
        "data" : [
          {
            "type" : "spree_line_items"
          }
        ]
      },
      "ship_address" : {
        "data" : {
          "type" : "spree_addresses"
        }
      },
      "user" : {
        "data" : {
          "type" : "spree_users"
        }
      }
    },
    "type" : "spree_orders"
  }
}
```

This will get an order via the id supplied.
Please note that you can ony access the orders that you own.
If you are an admin, you can view any order.
