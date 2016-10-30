--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local tonumber = tonumber
local tostring = tostring
local math_fmod = math.fmod
local pairs = pairs
local print = print
local string_gmatch = string.gmatch
local table_insert = table.insert
local table_concat = table.concat
local table_remove = table.remove
local unpack = unpack
--local cjson = require "cjson"
--local cjson_encode = cjson.encode
local ipairs = ipairs


local _M = {
    _VERSION = '0.01'
}

--[[
--  pointless to make into a function, but jotting down to remember that it's useful
 ]]
function _M.n_to_base_x(n,x)
    return tonumber(n,x)
end


function _M.n_base_x_to_string(number, base)
    local digits = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z' }
    local s = ""
    repeat
        local remainder = math_fmod(number,base)
        s = digits[remainder+1]..s
        number = (number-remainder)/base
    until number==0
    return s
end

--[[
--  totals the digits of a string
--  i think it also takes numbers as well as strings
 ]]
function _M.sum_of(p)
    local total = 0
    for digit in string_gmatch(p, ".") do
        total = total + digit
    end
    return total
end

function _M.powerset(s)
    local t = {{}}
    for i = 1, #s do
        for j = 1, #t do
            t[#t+1] = {s[i],unpack(t[j])}
        end
    end
    return t
end

function _M.moving_average(arr)
    local t = {}
    local function f(a, b, ...) if b then return f(a+b, ...) else return a end end
    local function average(n)
        if #t == 10 then table_remove(t, 1) end
        t[#t + 1] = n
        return f(unpack(t)) / #t
    end
    for _,v in pairs(arr) do
        print(average(v))
    end
end

function _M.combinations(m,n)
    local function map(f, a, ...) if a then return f(a), map(f, ...) end end
    local function incr(k) return function(a) return k > a and a or a+1 end end

    if m * n == 0 then return {{}} end
    local ret, old = {}, _M.combinations(m-1, n-1)
    for i = 1, n do
        for k, v in ipairs(old) do ret[#ret+1] = {i, map(incr(i), unpack(v))} end
    end
    return ret
end

function _M.permutations(ttable, n)
    -- permutations
    local ret = {}

    local function f (ttable,n)
        if n == 0 then
            table_insert(ret,table_concat(ttable))
        else
            for i = 1, n do
                -- put i-th element as the last one
                ttable[n], ttable[i] = ttable[i], ttable[n]

                -- generate all permutations of the other elements
                f(ttable, n - 1)

                -- restore i-th element
                ttable[n], ttable[i] = ttable[i], ttable[n]
            end
        end
    end

    f(ttable,n)

    return ret;
end

return _M

