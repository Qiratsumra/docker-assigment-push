FROM python:3.12-slim

WORKDIR /app

# Copy project files
COPY pyproject.toml ./
COPY main.py ./

# Install uv
RUN pip install uv

# Sync dependencies
RUN uv sync

# Expose port
EXPOSE 8000

# Run uvicorn directly in the virtual environment
CMD [".venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]