# Prairie Crafts E-Commerce Platform: Database Schema

This file documents the database schema for the Prairie Crafts e-commerce platform.

## Tables

### users
- id: integer (primary key)
- name: string
- email: string
- password_digest: string
- address: string
- phone: string
- created_at: datetime
- updated_at: datetime

### products
- id: integer (primary key)
- name: string
- description: text
- price: decimal
- stock_quantity: integer
- category_id: integer (foreign key)
- created_at: datetime
- updated_at: datetime

### categories
- id: integer (primary key)
- name: string
- created_at: datetime
- updated_at: datetime

### orders
- id: integer (primary key)
- user_id: integer (foreign key)
- total_price: decimal
- status: string
- created_at: datetime
- updated_at: datetime

### order_items
- id: integer (primary key)
- order_id: integer (foreign key)
- product_id: integer (foreign key)
- quantity: integer
- price_at_order: decimal
- created_at: datetime
- updated_at: datetime

### reviews
- id: integer (primary key)
- user_id: integer (foreign key)
- product_id: integer (foreign key)
- rating: integer
- comment: text
- created_at: datetime
- updated_at: datetime

### admins
- id: integer (primary key)
- name: string
- email: string
- password_digest: string
- created_at: datetime
- updated_at: datetime

## Associations
- User has many Orders, has many Reviews
- Product belongs to Category, has many Reviews
- Category has many Products
- Order has many OrderItems
- OrderItem belongs to Order and Product
- Admin manages backend system
