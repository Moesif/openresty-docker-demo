-- jwt_verification.lua
local _M = {}
local cjson = require "cjson"
local jwt = require "resty.jwt"

function _M.verify()

  ngx.log(ngx.INFO, "Checking JWT")

  -- Get the JWT token from the Authorization header
  local token = ngx.req.get_headers()["Authorization"]
  
  -- Remove "Bearer " prefix (case-insensitive)
  token = token:gsub("^Bearer%s+", "")

  -- Remove leading/trailing whitespace
  token = token:match("^%s*(.-)%s*$") 

  if not token then
    ngx.exit(ngx.HTTP_UNAUTHORIZED)
  end

  -- Verify the JWT token using the public key
  local jwt_obj, err = jwt:verify(jwt_secret, token)
 
  -- Verify the JWT token
  if not jwt_obj or jwt_obj.verified ~= true then
    ngx.log(ngx.ERR, "JWT verification failed")
    ngx.exit(ngx.HTTP_UNAUTHORIZED)
    return
  end

  -- The JWT token is valid, you can now access the claims
  ngx.log(ngx.INFO, "JWT valid")

  -- Extract the sub and customer_id claims from the verified JWT token
  if jwt_obj.payload then
    local sub = jwt_obj.payload.sub
    ngx.var.moesif_user_id = sub
    
    local customer_id = jwt_obj.payload.customer_id
    ngx.var.moesif_company_id = customer_id
  end 

  ngx.log(ngx.INFO, "Load JWT Verification")

end
_M.verify()

return _M
