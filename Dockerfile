# Step 1: Use official Apache image
FROM httpd:2.4

# Step 2: Remove default Apache files
RUN rm -rf /usr/local/apache2/htdocs/*

# Step 3: Set ServerName to avoid AH00558 warning
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# Step 4: Set working directory
WORKDIR /usr/local/apache2/htdocs/

# Step 5: Copy website files
COPY . .

# Step 6: Fix file permissions
RUN chmod -R 755 /usr/local/apache2/htdocs/

# Step 7: Expose port 80
EXPOSE 80

# Step 8: Start Apache properly
CMD ["httpd-foreground"]
