# Use the official OpenResty image
FROM openresty/openresty:alpine

# Install lua-resty-http
RUN apk add --no-cache git perl curl \
    && opm get ledgetech/lua-resty-http

# Copy the OpenResty configuration file
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# Copy the Lua script for token validation
COPY validate_token.lua /usr/local/openresty/nginx/lua/validate_token.lua

# Expose port 80
EXPOSE 80

# Start OpenResty
CMD ["openresty", "-g", "daemon off;"]
