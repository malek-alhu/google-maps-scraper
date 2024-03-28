# Use the base image from chetan1111/botasaurus:latest
FROM chetan1111/botasaurus:latest

# Set environment variable
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Copy the backend code
COPY backend/ /app/backend/

# Copy the frontend code
COPY frontend/ /app/frontend/

# Change directory to frontend
WORKDIR /app/frontend

# Install Node.js dependencies
RUN npm install

# Build the frontend code
RUN npm run build

# Change directory back to app
WORKDIR /app

# Copy the built frontend assets into the final image
COPY --from=0 /app/frontend/build /app/frontend/build

# Expose the port for the frontend
EXPOSE 3000

# Command to run the frontend server
CMD ["npm", "start"]
