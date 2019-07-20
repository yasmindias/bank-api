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

2. Create database ```bank_info```

3. Run ```rails db:migrate``` to create the schema
4. _Optional_: Run ```rails db:seed``` to populate the database


### Docker setup


### Run tests

## Usage

### Users

#### ```GET /buyer```

**Response Example**
```
[
    {
        "id": 1,
        "name": "Jane Doe",
        "tax_document": "12345678901",
        "email": "janedoe@emailhost.com",
        "created_at": "2019-07-20T21:09:28.485Z",
        "updated_at": "2019-07-20T21:09:28.485Z"
    },
    {
        "id": 2,
        "name": "John Doe",
        "tax_document": "09876543210",
        "email": "john.doe@emailhost.com",
        "created_at": "2019-07-20T21:16:17.783Z",
        "updated_at": "2019-07-20T21:16:17.783Z"
    }
]
```

&nbsp;
#### ```GET /buyer/:id```

**Response Example**
```
{
    "id": 1,
    "name": "Jane Doe",
    "tax_document": "12345678901",
    "email": "janedoe@emailhost.com",
    "created_at": "2019-07-20T21:09:28.485Z",
    "updated_at": "2019-07-20T21:09:28.485Z"
}
```

&nbsp;
#### ```POST /buyer```

| Field       | Type   | Required |
|-------------|--------|----------|
| name        | string | true     |
| tax_document| string | true     |
| email       | string | true     |

**Request Example**
```
{
   	"name": "Jane Doe",
   	"tax_document": "12345678901",
   	"email": "janedoe@emailhost.com"
}
```

**Response Example**
```
{
    "id": 1,
    "name": "Jane Doe",
    "tax_document": "12345678901",
    "email": "janedoe@emailhost.com",
    "created_at": "2019-07-20T21:09:28.485Z",
    "updated_at": "2019-07-20T21:09:28.485Z"
}
```

&nbsp;
#### ```PUT /buyer/:id```

Only need to send the fields that will be updated. 

**Request Example**
```
{
   	"name": "Jane Marie Doe"
}
```

**Response Example**
```
{
    "id": 1,
    "name": "Jane Marie Doe",
    "tax_document": "12345678901",
    "email": "janedoe@emailhost.com",
    "created_at": "2019-07-20T21:09:28.485Z",
    "updated_at": "2019-07-20T21:09:28.485Z"
}
```

&nbsp;
#### ```DELETE /buyer/:id```

**Response Example**
```
{
    "message": "User deleted."
}
```