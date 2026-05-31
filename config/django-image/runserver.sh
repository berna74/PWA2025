#!/usr/bin/env bash
set -euo pipefail

APP_DIR=/usr/src/app/src
PROJECT_NAME=${DJANGO_PROJECT_NAME:-app}

mkdir -p "$APP_DIR"

cd "$APP_DIR"

if [[ ! -f "manage.py" ]]; then
    echo "No existe proyecto Django, creando uno nuevo en src (${PROJECT_NAME})..."
  django-admin startproject "$PROJECT_NAME" .
fi

SETTINGS_MODULE=$(python - <<'PY'
import pathlib
import re

text = pathlib.Path("manage.py").read_text(encoding="utf-8")
match = re.search(r"DJANGO_SETTINGS_MODULE',\s*'([^']+)'", text)
print(match.group(1) if match else "")
PY
)

if [[ -n "$SETTINGS_MODULE" ]]; then
    SETTINGS_FILE="${APP_DIR}/${SETTINGS_MODULE//./\/}.py"
    if [[ -f "$SETTINGS_FILE" ]] && ! grep -q "COPILOT_DOCKER_POSTGRES" "$SETTINGS_FILE"; then
        cat >> "$SETTINGS_FILE" <<'PY'

# COPILOT_DOCKER_POSTGRES
# Fuerza uso de PostgreSQL cuando el proyecto corre dentro de Docker.
import os

DATABASES = {
        "default": {
                "ENGINE": "django.db.backends.postgresql",
        "NAME": os.environ["POSTGRES_DB"],
        "USER": os.environ["POSTGRES_USER"],
        "PASSWORD": os.environ["POSTGRES_PASSWORD"],
                "HOST": os.getenv("DB_HOST", "postgres"),
                "PORT": os.getenv("DB_PORT", "5432"),
        }
}
PY
    fi
fi

DB_HOST=${DB_HOST:-postgres}
DB_PORT=${DB_PORT:-5432}

python - <<'PY'
import os
import socket
import time

host = os.getenv("DB_HOST", "postgres")
port = int(os.getenv("DB_PORT", "5432"))

for _ in range(60):
    try:
        with socket.create_connection((host, port), timeout=2):
            print(f"Base de datos disponible en {host}:{port}")
            break
    except OSError:
        time.sleep(1)
else:
    print("No se pudo conectar a la base de datos; sigo con el arranque igualmente.")
PY

python manage.py makemigrations || true
python manage.py migrate || true

python manage.py shell <<'PY'
import os
from django.contrib.auth import get_user_model

username = os.getenv("DJANGO_SU_NAME")
email = os.getenv("DJANGO_SU_EMAIL")
password = os.getenv("DJANGO_SU_PASSWD")

if username and email and password:
    User = get_user_model()
    if not User.objects.filter(username=username).exists():
        User.objects.create_superuser(username=username, email=email, password=password)
        print(f"Superusuario '{username}' creado.")
    else:
        print(f"El superusuario '{username}' ya existe.")
else:
    print("Faltan variables DJANGO_SU_NAME/DJANGO_SU_EMAIL/DJANGO_SU_PASSWD; no se crea superusuario.")
PY

python manage.py runserver 0.0.0.0:8000
