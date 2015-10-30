# Authentication

```shell
# Specifying the token as a header.
curl "https://example.com/api/v1/endpoint"
  -H "X-Spree-Token: abc123"

# Specifying the token as a param.
curl "/api/v1/endpoint"
  -d token=abc123
```

> Make sure to replace `abc123` with your API key.

Spree uses API keys to allow access to the API.
To obtain a token, you must either create a new user, or, via token authentication, "log" the user in.

Spree does not expect every request to require an API key (such as reading public product data).

## Authenticate a User (Login)

```shell
curl "https://example.com/api/v1/account/signin"
  -X POST
  -d user[email]=spree@example.com
  -d user[password]=spree123
```

```json
{
  "data": {
    "id": "1",
    "type": "spree_users",
    "attributes": {
      "email": "spree@example.com",
      "first_name": "John",
      "last_name": "Doe",
      "job_title": null,
      "based_city": null,
      "experience": null,
      "avatar": "default/avatar-placeholder.jpg",
      "role": "user",
      "biography": null,
      "client_budget": null,
      "license_number": null,
      "certification_authority": null,
      "is_newsletter_subscribed": null,
      "is_designer_available": true
    },
    "relationships": {
      "store": {
        "data": null
      }
    }
  }
}
```

To login users, you will need to supply the `email` and `password`.
The response will be a user data object with the token in the body.
The response's headers will include a `X-Spree-Token` which is what you will use as the token.
