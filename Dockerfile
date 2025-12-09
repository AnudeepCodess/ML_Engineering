# Use official Python image
FROM python:3.9

# Set working directory inside container
WORKDIR /app

# Copy requirements.txt from Docker folder and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the app folder
COPY app ./app

# Expose port 80
EXPOSE 80

# Run FastAPI app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
