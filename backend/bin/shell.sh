#!/bin/bash
docker compose exec backend bash -lc 'cd /usr/src/app/src && python manage.py shell'