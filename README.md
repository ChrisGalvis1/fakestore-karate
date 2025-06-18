# 🧪 Fakestore API Test Automation - Karate

Este proyecto contiene la automatización de pruebas para la API pública de [FakeStoreAPI](https://fakestoreapi.com), utilizando:

- ✅ Karate DSL
- ✅ Java 17
- ✅ Maven
- ✅ Validación con JSON Schema
- ✅ Archivos JSON externos para cuerpos de request

---

## 📁 Estructura del Proyecto

```
src
├── test
│   ├── java/
│   │   ├── features/
│   │   │   ├── products/        -> Features de Products API
│   │   │   ├── carts/           -> Features de Carts API
│   │   │   ├── users/           -> Features de Users API
│   │   │   └── auth/            -> Features de Auth API
│   │   └── runners/             -> Runners Karate para cada API
│   └── resources/
│       ├── json/
│       │   ├── products/        -> Archivos JSON para requests/responses de productos
│       │   ├── carts/           -> Archivos JSON para carritos
│       │   ├── users/           -> Archivos JSON para usuarios
│       │   └── auth/            -> Archivos JSON para autenticación
│       └── schema/              -> Archivos JSON Schema para validaciones
```

---

## ✅ Endpoints cubiertos

### 🔹 Products API

- `GET /products`
- `GET /products/{id}`
- `POST /products`
- `PUT /products/{id}`
- `DELETE /products/{id}`

### 🔹 Carts API

- `GET /carts`
- `GET /carts/{id}`
- `POST /carts`
- `PUT /carts/{id}`
- `DELETE /carts/{id}`

### 🔹 Users API

- `GET /users`
- `GET /users/{id}`
- `POST /users`
- `PUT /users/{id}`
- `DELETE /users/{id}`

### 🔹 Auth API

- `POST /auth/login`
- 🔁 Incluye escenario exitoso y fallido (credenciales incorrectas)

---

## 🚀 Ejecución del proyecto

### ▶️ Desde consola:

```bash
mvn clean test
```

Esto ejecuta todos los escenarios de prueba definidos en los features.

---

## 📊 Reporte de resultados

Karate genera automáticamente un reporte de pruebas en:

```
target/karate-reports/karate-summary.html
```

Este reporte incluye:

- Estado por escenario
- Tiempos de ejecución
- Logs y prints
- Evidencias del request/response

---

## 👨‍💻 Autor

- Christian Galvis
- Proyecto técnico de automatización REST APIs con Karate