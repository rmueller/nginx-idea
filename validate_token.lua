local http = require "resty.http"

local function validate_token(token)
    local httpc = http.new()
    local res, err = httpc:request_uri("http://overseer:8888", {
        method = "GET",
        headers = {
            ["Authorization"] = "Bearer " .. token,
        },
    })

    if not res then
        ngx.log(ngx.ERR, "failed to request: ", err)
        return false
    end

    if res.status ~= 200 then
        ngx.log(ngx.ERR, "invalid token: ", res.body)
        return false
    end

    return true
end

local token = ngx.req.get_headers()["Token"]

if not token or not validate_token(token) then
    ngx.status = ngx.HTTP_UNAUTHORIZED
    ngx.say("Unauthorized")
    return ngx.exit(ngx.HTTP_UNAUTHORIZED)
end
