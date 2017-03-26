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

local function table_sum(t, i, j)
  sum = 0
  for index = i, j do
    sum = sum + t[index]
  end
  return sum
end

local function powerset(s)
  local t = {}
  for i = 1, #s do
    for j = i, #s do
      table.insert(t,table_sum(s,i,j))
    end
  end
  table.sort(t)
  return t
end

function mysplit(inputstr, sep)
  if sep == nil then
          sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          t[i] = tonumber(str)
          i = i + 1
  end
  return t
end

local function do_jam()
  local n, q = io_read("*n", "*n")
  io_read("*line")
  
  local arr = mysplit(io_read())
  local ps = powerset(arr)
  
  --print(cjson_encode(ps))
  for i=1, q do
    local l,r = io_read("*n","*n")
    io_read("*line")
    local sum = 0
    for j=l, r do
      sum=ps[j] and sum+ps[j] or 0
    end
    print(sum)
  end
  
  return n
end

cases = io_read("*number")
for i=1,cases do
    print("Case #" .. tostring(i) .. ":")
    do_jam()
end