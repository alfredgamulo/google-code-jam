--
-- User: ghost.core
--
--[[===============================
--  CODEJAM
--  ===============================
 ]]

--[[localize functions]]

--local cjson = require "cjson"
--local cjson_encode = cjson.encode
--local cjson_decode = cjson.decode
local print = print
local pairs = pairs
local table = table
local tonumber = tonumber
local io_read = io.read
local string_len = string.len

local mod = 1000000007

function rtrim(s)
  local n = #s
  while n > 0 and s:find("^%s", n) do n = n - 1 end
  return s:sub(1, n)
end

local function do_jam()
  str = rtrim(io_read())
  len = string_len(str)
  if (len == 1) then
    return 1
  end
  if (len == 2) then
    if (str:sub(1,1) == str:sub(2,2)) then
      return 1
    else
      return 4
    end
  end

  ans = 1

  if (str:sub(1,1)~=str:sub(2,2)) then
    ans=(ans*2)%mod
  end
  if (str:sub(-1,-1)~=str:sub(-2,-2)) then
    ans=(ans*2)%mod
  end

  for i=2, #str-1 do
    c = 1;
    if (str:sub(i,i) ~= str:sub(i-1,i-1)) then
      c=c+1
    end
    if ((str:sub(i+1,i+1) ~= str:sub(i-1,i-1)) and (str:sub(i,i) ~= str:sub(i+1,i+1))) then
      c=c+1
    end
    ans=(ans*c)%mod
  end
  return ans % mod
end

cases = tonumber(io_read())
for i=1,cases do
    print("Case #" .. tostring(i) .. ": " .. tostring(do_jam()))
end
