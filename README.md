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

### Authentication
 
In the header of every request must be sent the "auth_token". This token is valid for 1 day, after this period another token must be generated.  
 
```POST /api/auth```

**Request Example**
```
{
	"branch": "0001",
	"number": "000001",
	"password": "123456"
}
```

**Response Example**
```
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X2lkIjoxLCJleHAiOjE1NjM3NjkxOTF9.9HyNOsIXxAbsZr0jmotqCAxSbXDhW-Dj57um-pSBuJA"
}
```

### Users

#### ```GET /api/user```

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
#### ```GET /api/user/:id```

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
#### ```POST /api/user```

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
#### ```PUT /api/user/:id```

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
#### ```DELETE /api/user/:id```

**Response Example**
```
{
    "message": "User deleted."
}
```


### Accounts

#### ```GET /api/account```

**Response Example**
```
[
    {
        "id": 1,
        "branch": "0001",
        "number": "000001",
        "digit": "0",
        "balance": "2500.55",
        "user_id": 1,
        "created_at": "2019-07-20T21:44:46.096Z",
        "updated_at": "2019-07-20T21:44:46.096Z"
    },
    {
        "id": 2,
        "branch": "0001",
        "number": "000002",
        "digit": "0",
        "balance": "15000.0",
        "user_id": 2,
        "created_at": "2019-07-20T21:44:46.096Z",
        "updated_at": "2019-07-20T21:44:46.096Z"
    }
]
```

&nbsp;
#### ```GET /api/account/:id```

**Response Example**
```
{
    "id": 1,
    "branch": "0001",
    "number": "000001",
    "digit": "0",
    "balance": "2500.55",
    "user_id": 1,
    "created_at": "2019-07-20T21:44:46.096Z",
    "updated_at": "2019-07-20T21:44:46.096Z"
}
```

&nbsp;
#### ```POST /api/account```

| Field    | Type   | Required | Description        |
|----------|--------|----------|--------------------|
| branch   | string | true     | Agência            |
| number   | string | true     | Número da Conta    |
| digit    | string | true     | Digito Verificador |
| balance  | string | true     | Saldo da conta     |
| user_id  | string | true     | Id do usuário      |

**Request Example**
```
{
    "branch": "0001",
    "number": "000002",
    "digit": "0",
    "user_id" : "1",
    "balance": 150.50
}
```

**Response Example**
```
{
    "id": 2,
    "branch": "0001",
    "number": "000002",
    "digit": "0",
    "balance": "150.5",
    "user_id": 1,
    "created_at": "2019-07-20T21:44:46.096Z",
    "updated_at": "2019-07-20T21:44:46.096Z"
}
```

&nbsp;
#### ```PUT /api/account/:id```

Only need to send the fields that will be updated. 

**Request Example**
```
{
   	"amount": 1190.50
}
```

**Response Example**
```
"user": {
    "id": 2,
    "balance": "1190.5",
    "user_id": 1,
    "branch": "0001",
    "number": "000002",
    "digit": "0",
    "created_at": "2019-07-20T21:44:46.096Z",
    "updated_at": "2019-07-20T21:54:44.020Z"
}
```

&nbsp;
#### ```DELETE /api/account/:id```

**Response Example**
```
{
    "message": "Account deleted."
}
```