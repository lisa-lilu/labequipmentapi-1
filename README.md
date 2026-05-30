# README
# Lab Equipment 
A Rails API for tracking lab equipment, categories, and maintenance records.

## Setup Instructions

```bash
git clone https://github.com/lisa-lilu/labequipmentapi-1.git
cd labequipmentapi-1
bundle install
rails db:create db:migrate db:seed
rails server
```
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
| 4 - Equipment CRUD | @ | task-4-equipment | Not Started |
| 5 - MaintenanceRecord CRUD | @ | task-5-maintenance | Not Started |
| 6 - Business rules | @lisa-lilu | task-6-rules | Not Started |
| 7 - Edge cases | @ | task-7-edge-cases | Not Started |
