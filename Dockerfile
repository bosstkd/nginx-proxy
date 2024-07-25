# Use Ubuntu as base image
FROM ubuntu/nginx:latest

# Remove default Nginx configuration (if necessary)
RUN unlink /etc/nginx/sites-enabled/default

# Copy custom Nginx configurations and SSL certificates
COPY nginx.conf /etc/nginx/conf.d/nginx_ssl.conf
COPY mnk-erp.org_certificate.crt /etc/ssl/mnk-erp.org_certificate.crt
COPY mnk-erp.org_private_key.key /etc/ssl/mnk-erp.org_private_key.key

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Nginx when container starts
CMD ["nginx", "-g", "daemon off;"]
