--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local math_sqrt = math.sqrt

local _M = {
    _VERSION = '0.01'
}

--[[
--  Returns
--      true if prime,
--      false AND factor if not prime
 ]]
function _M.isPrime(number)
    for i = 2, math_sqrt(number) do
        if number % i == 0 then
            return false, i
        end
    end
    return true
end

return _M