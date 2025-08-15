# Prairie Crafts E-Commerce Platform: Code Generation Plan

This document outlines the code generation plan for the Prairie Crafts e-commerce Rails application.

## 1. Models & Migrations
- User (with has_secure_password, validations, associations)
- Product (with associations, validations)
- Category (with associations, validations)
- Order (with associations, validations)
- OrderItem (with associations, validations)
- Review (with associations, validations)
- Admin (with has_secure_password, validations)

## 2. Controllers
- Admin::DashboardController (admin login, product CRUD)
- ProductsController (index, show, search)
- CategoriesController (index, show)
- OrdersController (checkout, order history)
- CartController (add/remove/view cart)
- SessionsController (login/logout for users and admins)
- ReviewsController (create, destroy)

## 3. Views
- Use ERB partials for product cards, forms, etc.
- Admin dashboard views for product management
- User-facing views for product browsing, cart, checkout

## 4. Features
- Admin authentication and dashboard
- Product management (CRUD)
- Product browsing, search, and filtering
- Shopping cart (session-based)
- Checkout process
- Product reviews
- Model validations

## 5. Git Workflow
- Use at least 3 branches (main, feature/admin, feature/cart, etc.)
- Make at least 32 commits

---

The next step is to generate Rails model and migration files for all entities.
