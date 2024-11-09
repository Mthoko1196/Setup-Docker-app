# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Copy the HTML file from the App directory to the Nginx default directory
COPY App/index.html /usr/share/nginx/html/index.html
