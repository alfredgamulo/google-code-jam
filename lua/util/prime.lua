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

function _M.prime_factor(num)
    local i = 2;
    local factors = {};

    if not num or num < 1 then
        print('your input must be postive!')
    end

    if num and num == 1 then
        factors[1] = 1
        return factors
    end

    while num and num > 1 do
        while num % i == 0 do
            factors[#factors + 1] = i
            num = num / i
        end
        i = i + 1
    end

    return factors
end

return _M