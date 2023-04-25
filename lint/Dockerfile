FROM python:3.9

# Add a new user
RUN useradd --create-home code

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN pip install isort black flake8 pylint

# Copy the application files
COPY . .

# Set the PYTHONPATH environment variable
ENV PYTHONPATH=/app/src:$PYTHONPATH

# Set the user to run the container as
USER code

# Start the shell
CMD ["/bin/bash"]
