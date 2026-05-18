# Use Microsoft's official Playwright image that has Python 3.11 and all system libraries pre-baked
FROM mcr.microsoft.com/playwright/python:v1.45.0-jammy

WORKDIR /app

# Copy dependencies and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your backend code
COPY . .

# Expose Render's default port container space
EXPOSE 10000

# Run Uvicorn on startup
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]