#!/usr/bin/env bash
# Exit on error
set -o errexit

echo "--- Installing Python dependencies ---"
pip install -r requirements.txt

echo "--- Collecting static files ---"
python manage.py collectstatic --no-input

echo "--- Running database migrations ---"
python manage.py migrate

echo "--- Seeding default demo data (safe get_or_create) ---"
python seed_data.py

echo "--- Backend build complete ---"
