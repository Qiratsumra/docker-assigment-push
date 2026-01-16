FROM python:3.12-slim

WORKDIR /app

# Copy dependency definitions
COPY pyproject.toml ./
COPY uv.lock ./

# Install uv
RUN pip install --no-cache-dir uv

# Install dependencies into system Python (NO venv)
RUN uv pip install --system

# Copy application code
COPY main.py .

EXPOSE 8000

# Run uvicorn from system PATH
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]