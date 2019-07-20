# Bank API

REST API for bank operations such as money transfer and balance check.

## Requirements
* Rails
* Postgresql 

### Local Setup

1. Add database user info to rails credentials file

__Credentials Format__

```
# aws:
   #   access_key_id: 123
   #   secret_access_key: 345
   
   # Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
   secret_key_base: [HASH]
   
db_username: [db_username]
db_password: [db_password]
```

* Create database "bank_info"

2. Run ```rails db:migrate``` to create the schema
3. _Optional_: Run ```rails db:seed``` to populate the database


### Docker setup

Things you may want to cover:


* How to run the test suite
