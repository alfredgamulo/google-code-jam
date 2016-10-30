--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local math_floor = math.floor

local _M = {
    _VERSION = '0.01'
}

function _M.binary_search(data, query)
    -- Set the left and right boundaries
    local left = 1
    local right = #data
    while left <= right do
        -- Get the middle value, between the left and right boundaries
        local middle = math_floor((left + right) / 2)
        if data[middle] == query then
            -- We found it, now we return it
            return middle
        elseif data[middle] > query then
            -- Change the right boundary
            right = middle - 1
        else
            -- Change the left boundary
            left = middle + 1
        end
    end
    -- The query wasn't found in the array
end

return _M