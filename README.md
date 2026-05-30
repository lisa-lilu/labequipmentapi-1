# Lab Equipment API

## Project Description

The Lab Equipment API is a comprehensive Rails API designed to manage laboratory equipment inventory and maintenance tracking. It solves the chaos of tracking scattered equipment across a department by providing a centralized system to:

- Track every piece of equipment with unique identification and categorization
- Monitor the current status of each item (available, in use, or under maintenance)
- Maintain complete maintenance history for all equipment
- Enforce strict business rules to ensure data integrity and trustworthiness
- Provide RESTful API endpoints for seamless integration with frontend applications

## Setup Instructions

Follow these steps to get the project running from scratch:

```bash
# Clone the repository
git clone <repo-url>
cd labequipmentapi-1

# Install dependencies
bundle install

# Set up the database with migrations and seed data
bin/rails db:create db:migrate db:seed

# Start the Rails server
bin/rails server
The API will be available at http://localhost:3000# README
# Lab Equipment 
A Rails API for tracking lab equipment, categories, and maintenance records.

## Endpoints

### Categories
- GET /categories — List all categories ordered by name
- GET /categories/:id — Show one category with equipment count
- POST /categories — Create a category
- PATCH /categories/:id — Update a category
- DELETE /categories/:id — Delete a category (409 if equipment exists)

### Equipment
- GET /equipment — List all equipment, supports ?status= filter
- GET /equipment/:id — Show one equipment item with category and maintenance records
- POST /equipment — Create equipment
- PATCH /equipment/:id — Update equipment
- DELETE /equipment/:id — Delete equipment (cascades maintenance records)

### Maintenance Records
- GET /maintenance_records — List all, supports ?equipment_id= filter
- GET /maintenance_records/:id — Show one record
- POST /maintenance_records — Create a record
- PATCH /maintenance_records/:id — Update a record
- DELETE /maintenance_records/:id — Delete a record

## Task Assignment

| Task | Owner | Branch | Status |
|------|-------|--------|--------|
| 1 - Data model | @Rahel-ag | task-1-model | Done |
| 2 - Seeds | @lisa-lilu | task-2-seeds | Done |
| 3 - Category CRUD | @Rahel-ag | task-3-categories | Done |
| 4 - Equipment CRUD | @jose-90 | task-4-equipment |  |
| 5 - MaintenanceRecord CRUD | @essete7 | task-5-maintenance | not started |
| 6 - Business rules | @lisa-lilu | task-6-rules | Done |
| 7 - Edge cases | @lisa-lilu | task-7-edge-cases | Done |
