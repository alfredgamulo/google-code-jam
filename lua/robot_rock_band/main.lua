--
-- User: ghost.core
--
--[[===============================
--  CODEJAM
--  ===============================
 ]]
 
--[[localize functions]]

local cjson = require "cjson"
local cjson_encode = cjson.encode
local cjson_decode = cjson.decode
local print = print
local pairs = pairs
local table = table
local tonumber = tonumber
local io_read = io.read
local string_len = string.len

local mod = 1000000007

function bin_xor(x, y)
  local z = 0
  for i = 0, 31 do
    if (x % 2 == 0) then                      -- x had a '0' in bit i
       if ( y % 2 == 1) then                  -- y had a '1' in bit i
          y = y - 1 
          z = z + 2 ^ i                       -- set bit i of z to '1' 
       end
    else                                      -- x had a '1' in bit i
       x = x - 1
       if (y % 2 == 0) then                  -- y had a '0' in bit i
          z = z + 2 ^ i                       -- set bit i of z to '1' 
       else
          y = y - 1 
       end
    end
    y = y / 2
    x = x / 2
  end
  return z
end

function mysplit(inputstr, sep)
  if sep == nil then
          sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          t[i] = str
          i = i + 1
  end
  return t
end

local function do_jam()
  local n, k = io_read("*n","*n")
  io_read() -- consume newline
  
  local one = mysplit(io_read())
  local two = mysplit(io_read())
  local three = mysplit(io_read())
  local four = mysplit(io_read())
  
  local counter = 0
  local memoization = {}
  for _,i in ipairs(one) do
    for _,j in ipairs(two) do
      local store = bin_xor(tonumber(i), tonumber(j))
      memoization[store] = (memoization[store] and memoization[store] > 0 and memoization[store] + 1) or 1
    end
  end
  
  for _,l in ipairs(three) do
    for _,m in ipairs(four) do
      local lookup = bin_xor(k, bin_xor(tonumber(l), tonumber(m)))
      if (memoization[lookup]) then
        counter = counter + memoization[lookup]
      end
    end
  end

  return counter
end

cases = tonumber(io_read())
for i=1,cases do
    print("Case #" .. tostring(i) .. ": " .. tostring(do_jam()))
end
