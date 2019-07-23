# Bank API

REST API for bank operations such as money transfer and balance check.

## Requirements
* Rails
* Postgresql 

### Local Setup

1. In the```database.yml``` file, add the following lines to ```default:```
```
username: <%= Rails.application.credentials.db_username %>
password: <%= Rails.application.credentials.db_password %>
```  

2. Add database user info to rails credentials file

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

3. Create database ```bank_info```

4. Run ```rails db:migrate``` to create the schema
5. _Optional_: Run ```rails db:seed``` to populate the database
5. _Optional_: Run ```rake test``` to run tests


### Docker setup
The database used in Docker is currently without password to make the execution of this project easier. 
To add password info is necessary to create a .env file and set the variables in the docker-compose file.

1. Run ```docker-compose up --build```
2. _Optional:_ For tests run ```docker-compose run bank-api rake test``` after the build.

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
    "status": 200,
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
        "user_id": 1,
        "created_at": "2019-07-20T21:44:46.096Z",
        "updated_at": "2019-07-20T21:44:46.096Z"
    },
    {
        "id": 2,
        "branch": "0001",
        "number": "000002",
        "digit": "0",
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
    "user_id": 1,
    "created_at": "2019-07-20T21:44:46.096Z",
    "updated_at": "2019-07-20T21:44:46.096Z"
}
```

&nbsp;
#### ```GET /api/balance/:id```

**Response Example**
```
{
    "account_id": 1,
    "balance": "210.5"
}
```


&nbsp;
#### ```POST /api/account```

| Field    | Type    | Required | Description        |
|----------|---------|----------|--------------------|
| branch   | string  | true     | Agência            |
| number   | string  | true     | Número da Conta    |
| digit    | string  | true     | Digito Verificador |
| user_id  | string  | true     | Id do usuário      |
| deposit  | decimal | false    | Valor do depósito  |

**Request Example**
```
{
    "branch": "0001",
    "number": "000002",
    "digit": "0",
    "user_id" : "1",
    "password":"123456",
    "deposit": 100.00
}
```

**Response Example**
```
{
    "id": 2,
    "branch": "0001",
    "number": "000002",
    "digit": "0",
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
   	"digit": 1
}
```

**Response Example**
```
{
    "id": 2,
    "user_id": 1,
    "branch": "0001",
    "number": "000002",
    "digit": "1",
    "created_at": "2019-07-20T21:44:46.096Z",
    "updated_at": "2019-07-20T21:54:44.020Z"
}
```

&nbsp;
#### ```DELETE /api/account/:id```

**Response Example**
```
{
    "status": 200,
    "message": "Account deleted."
}
```

### Transfer

#### ```POST /api/transfer```

**Request Example**
```
{
	"source_account_id": 2,
	"destination_account_id": 1,
	"amount": 30.00
}
```

**Response Example**
```
{
    "status": 200,
    "message": "Transfer completed successfully."
}
```

#### ```DELETE /api/transfer/:transaction_id```
**Important:** The ```transaction_id``` is not the same as the primary key ```id```. 
The first is created to register the transactions necessary to complete a transfer and help to calculate the balance. 
The later is auto-generated by rails.

**Response Example**
```
{
    "status": 200,
    "message": "Transfer deleted successfully."
}
```