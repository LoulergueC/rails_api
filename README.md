# THP Blog rails-api

Petit projet de blog en créant une API avec Rails.
Features :

- CRUD articles
- User (création / connexion)
- CRUD commentaires d'articles

## Interfaces

### Articles

```typescript
interface Article = {
  title: string,
  comment: string,
  private?: boolean,
}
```

### Comment

```typescript
interface Comment = {
  title: string,
  comment: string,
}
```

### User

```typescript
interface User = {
  email: string,
  password: string,
}
```

## End points API

Toutes les requêtes doivent aboutir vers `https://rails-api.fly.dev/`

### Articles

<details>
  <summary><code>GET</code> <code>/articles</code> </summary>

#### No parameters

#### Response:

> | http code | content-type       | response      |
> | --------- | ------------------ | ------------- |
> | `200`     | `application/json` | `[{article}]` |

</details>
<details>
  <summary><code>POST</code> <code>/articles</code> </summary>

#### Parameters:

> | name      | required | type      | desc                     |
> | --------- | -------- | --------- | ------------------------ |
> | `title`   | `true`   | `String`  | `Title of the article`   |
> | `content` | `true`   | `String`  | `Content of the article` |
> | `private` | `false`  | `Boolean` | `Private article status` |

#### Response:

> | http code | content-type       | response                |
> | --------- | ------------------ | ----------------------- |
> | `201`     | `application/json` | `[{article}]`           |
> | `400`     | `application/json` | `not logged in`         |
> | `500`     | `application/json` | `Internal server error` |

</details>
<details>
  <summary><code>GET</code> <code>/articles</code> <code>/:id</code></summary>

#### No parameters

#### Response:

> | http code | content-type       | response      |
> | --------- | ------------------ | ------------- |
> | `200`     | `application/json` | `[{article}]` |
> | `400`     | `application/json` | `Is private`  |

</details>
<details>
  <summary><code>PUT | PATCH</code> <code>/articles</code> <code>/:id</code> </summary>

#### Parameters:

> | name      | required | type      | desc                     |
> | --------- | -------- | --------- | ------------------------ |
> | `title`   | `true`   | `String`  | `Title of the article`   |
> | `content` | `true`   | `String`  | `Content of the article` |
> | `private` | `false`  | `Boolean` | `Private article status` |

#### Response:

> | http code | content-type       | response                |
> | --------- | ------------------ | ----------------------- |
> | `201`     | `application/json` | `[{article}]`           |
> | `400`     | `application/json` | `not logged in`         |
> | `500`     | `application/json` | `Internal server error` |

</details>
<details>
  <summary><code>DELETE</code> <code>/articles</code> <code>/:id</code> </summary>

#### Parameters:

> | name      | required | type      | desc                     |
> | --------- | -------- | --------- | ------------------------ |
> | `title`   | `true`   | `String`  | `Title of the article`   |
> | `content` | `true`   | `String`  | `Content of the article` |
> | `private` | `false`  | `Boolean` | `Private article status` |

#### Response:

> | http code | content-type       | response                |
> | --------- | ------------------ | ----------------------- |
> | `201`     | `application/json` | `[{article}]`           |
> | `400`     | `application/json` | `not logged in`         |
> | `500`     | `application/json` | `Internal server error` |

</details>

### Comments

<details>
  <summary><code>GET</code> <code>/articles</code> <code>/:id</code> <code>/comments</code> </summary>

#### No parameters

#### Response:

> | http code | content-type       | response             |
> | --------- | ------------------ | -------------------- |
> | `200`     | `application/json` | `[{comment}]`        |
> | `400`     | `application/json` | `Article is private` |

</details>
<details>
  <summary><code>POST</code> <code>/articles</code> <code>/:id</code> <code>/comments</code> </summary>

#### Parameters:

> | name      | required | type     | desc                     |
> | --------- | -------- | -------- | ------------------------ |
> | `title`   | `true`   | `String` | `Title of the article`   |
> | `content` | `true`   | `String` | `Content of the article` |

#### Response:

> | http code | content-type       | response                |
> | --------- | ------------------ | ----------------------- |
> | `201`     | `application/json` | `[{comment}]`           |
> | `400`     | `application/json` | `not logged in`         |
> | `500`     | `application/json` | `Internal server error` |

</details>
<details>
  <summary><code>GET</code> <code>/articles</code> <code>/:id</code> <code>/comments</code> <code>/:commentNumber</code></summary>

#### No parameters

> Note: `commentNumber` is not the comment id but the number of the comment of this article (eg: first comment of the article has id 10, but commentNumber of 1)

#### Response:

> | http code | content-type       | response      |
> | --------- | ------------------ | ------------- |
> | `200`     | `application/json` | `[{comment}]` |
> | `400`     | `application/json` | `Is private`  |

</details>
<details>
  <summary><code>PUT | PATCH</code> <code>/articles</code> <code>/:id</code> <code>/comments</code> <code>/:commentNumber</code> </summary>

#### Parameters:

> Note: `commentNumber` is not the comment id but the number of the comment of this article (eg: first comment of the article has id 10, but commentNumber of 1)

> | name      | required | type     | desc                     |
> | --------- | -------- | -------- | ------------------------ |
> | `title`   | `true`   | `String` | `Title of the article`   |
> | `content` | `true`   | `String` | `Content of the article` |

#### Response:

> | http code | content-type       | response                |
> | --------- | ------------------ | ----------------------- |
> | `201`     | `application/json` | `[{comment}]`           |
> | `400`     | `application/json` | `not logged in`         |
> | `500`     | `application/json` | `Internal server error` |

</details>
<details>
  <summary><code>DELETE</code> <code>/articles</code> <code>/:id</code> <code>/comments</code> <code>/:commentNumber</code> </summary>

#### Parameters:

> Note: `commentNumber` is not the comment id but the number of the comment of this article (eg: first comment of the article has id 10, but commentNumber of 1)

> | name      | required | type      | desc                     |
> | --------- | -------- | --------- | ------------------------ |
> | `title`   | `true`   | `String`  | `Title of the article`   |
> | `content` | `true`   | `String`  | `Content of the article` |
> | `private` | `false`  | `Boolean` | `Private article status` |

#### Response:

> | http code | content-type       | response                |
> | --------- | ------------------ | ----------------------- |
> | `201`     | `application/json` | `[{comment}]`           |
> | `400`     | `application/json` | `not logged in`         |
> | `500`     | `application/json` | `Internal server error` |

</details>

### User

### Register

`POST /users`

Données attendues :

```json
{
	"user": {
		"email": string,
		"password": string
	}
}
```

Pour la tester :

```sh
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' https://rails-api.fly.dev/users
```

Réponse :

```sh
=> {"message":"Signed up successfully.","user":{"id":[id],"email":"test@example.com","created_at":[timestamp],"updated_at":[timestamp]}
```

### Login

`POST /users/sign_in`

Données attendues

```json
{
	"user": {
		"email": string,
		"password": string
	}
}
```

Pour la tester :

```sh
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' https://rails-api.fly.dev/users/sign_in
```

Réponse :

```sh
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 0
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
Vary: Accept, Origin
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDQiLCJzY3AiOiJ1c2VyIiwiYXVkIjpudWxsLCJpYXQiOjE2NDYyMTk4MTEsImV4cCI6MTY0NjIyMzQxMSwianRpIjoiZWMxNDk3NWItOTNkYS00YTE1LTg1YTQtZmQ0ODllOTI2MTIwIn0.ZxRTdqSQ-Ahh4To9qdheeMewFHmbZtvWa_gSYx5mD38
Set-Cookie: _interslice_session=vOm61TiX5r758FI7DXxo07gRo%2F1lB08%2BrjKnf5N2q5oIOA4P3CI943u%2FbLSS3lJCyu%2FrFmLF8%2FliLCxhQTZN4DqNGgGgjZh6koGGyCxdFwshloUmSByg0D8vRA21kEQcCguvQ8BwJ1alzn6N9fAjXussdx63iL87TSUGhuWgSv3Ze4BkD1WsRG%2FFlH%2BJ%2Ba4mraPkGZCiQmfBlRLDjZ7n4mmWaE1ASsAhXmhf%2BeC79ag%2BQgE3ZOHkTzRUmnQft4BGeVC51ITCfvW47Cbi8elBQsfs2IzROxe9qtDOklzDcA%3D%3D--U%2FLRbl1%2FWXHqxKhR--lcsdl17IGM7jOT14NN8qZg%3D%3D; path=/; HttpOnly; SameSite=Lax
ETag: W/"3f408df0bede3cd5797e2190eefd79d9"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f1e51158-e4c6-42f2-bb94-535869cdccb5
X-Runtime: 0.256978
Server-Timing: start_processing.action_controller;dur=0.2275390625, sql.active_record;dur=1.86376953125, instantiation.active_record;dur=0.0888671875, process_action.action_controller;dur=234.275390625
Transfer-Encoding: chunked

{"message":"You are logged in.","user":{"id":204,"email":"test@example.com","created_at":"2022-03-01T19:50:54.482Z","updated_at":"2022-03-01T19:50:54.482Z"}}
```
