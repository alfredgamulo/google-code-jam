--
-- User: ghost.core
--
--[[===============================
--  CODEJAM
--  ===============================
 ]]
 
--[[My Utils]]
local my_binary = require "my_util.binary"
local my_file = require "my_util.file"
local my_hash = require "my_util.hash"
local my_prime = require "my_util.prime"
local my_numbers = require "my_util.numbers"

--[[localize functions]]

local cjson = require "cjson"
local cjson_encode = cjson.encode
local cjson_decode = cjson.decode
local print = print
local pairs = pairs
local table = table
local tonumber = tonumber
local io_read = io.read

local function do_jam()
  str = io_read("*line")
  return str
end

cases = io_read("*number")
for i=1,cases do
    print("Case #" .. tostring(i) .. ": " .. tostring(do_jam()))
end
