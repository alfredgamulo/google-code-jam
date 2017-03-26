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

local bit = require "bit"
local bor = bit.bor
local band = bit.band
local bxor = bit.bxor



local function do_jam()
  local n, x, k, a, b, c = io_read("*n","*n","*n","*n","*n","*n")
  io_read("*line") -- consume newline
  
  
  return n
end

cases = tonumber(io_read())
for i=1,cases do
    print("Case #" .. tostring(i) .. ": " .. tostring(do_jam()))
end
