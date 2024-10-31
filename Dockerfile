# Use an official Python runtime as a parent image 
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip to avoid compatibility issues
RUN python -m pip install --upgrade pip

# Install Flask explicitly to avoid any issues
RUN pip install Flask

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Set environment variables to tell Flask to run the app in production
ENV FLASK_APP=chatbotapp.py
ENV FLASK_ENV=production

# Run app.py when the container launches
CMD ["python", "chatbotapp.py"]
