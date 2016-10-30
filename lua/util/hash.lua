--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local _M = {
    _VERSION = '0.01'
}

function _M.get_n_hash(n)
    local h = {}
    for i=0, n-1 do
        h[i] = i
    end
    return h
end

return _M






--[[
--

Other useful functions:
======================


remove seen numbers from hash:
==============================
while next(sheep_count) do
    local n = v*x
    local N= tostring(n)
    N:gsub(".", function (c)
        sheep_count[tonumber(c)] = nil
    end)
    x = x+1
end
--
 ]]