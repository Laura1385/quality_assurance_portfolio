# Technical Investigation – Wishlist Session Issue

## Context
During the implementation of the Wishlist Happy Path, the following behaviour was observed in the local OpenCart environment:

```text 
Warning: Invalid token session. Please login again.
```

The issue occurred immediately after removing a product from the wishlist.

## Initial hypothesis
At first, the issue was suspected to be related to the Robot Framework automation.
However, the same behaviour was reproduced manually using the browser, demonstrating that the problem was not caused by the automated test.

## Investigation process
The investigation included the following steps:

1. Verified that the issue also occurred without Robot Framework.
2. Reproduced the issue using two different Docker environments:
    - `ghcr.io/aam-git/docker-opencart`
    - Official OpenCart Docker environment
3. Verified that both environments were running OpenCart 4.1.0.3.
4. Inspected the application controllers and templates.
5. Analysed the PHP controllers responsible for:
    - Login
    - Wishlist
6. Analysed the JavaScript responsible for refreshing the wishlist after removing a product.

## Root cause
The `Remove` request correctly included the `customer_token`.

However, after a successful removal, the wishlist was refreshed using:
```bash
$('#wishlist').load(
    'index.php?route=account/wishlist.list&language={{ language }}'
);
```

The AJAX request did not preserve the current `customer_token`.

As a consequence, the following request reached OpenCart without the authentication token, causing the application to invalidate the session and redirect the user to the login page.

## Validation
To validate the hypothesis, a local patch was applied.

The wishlist refresh was modified to preserve the current `customer_token`:

```bash
const customerToken = new URLSearchParams(window.location.search).get("customer_token");

$("#wishlist").load(
    "index.php?route=account/wishlist.list&language={{ language }}&customer_token="
    + encodeURIComponent(customerToken)
); 
```

After applying the patch:
- manual execution completed successfully;
- the Robot Framework Happy Path completed successfully without changes to the test.

## Notes
The investigation was carried out with the support of an AI assistant for code inspection and hypothesis generation.
Every hypothesis was validated experimentally through manual testing, application inspection and local verification before applying the final fix.