FROM python:3.12-slim
WORKDIR /app
RUN apt-get update && apt-get install -y postgresql-client
COPY pyproject.toml .
COPY uv.lock .
RUN pip install uv
RUN uv sync
COPY . .
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]