--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local math_floor = math.floor
local table_insert = table.insert

local _M = {
    _VERSION = '0.01'
}

function _M.generate_binary_table(n_bits)
    local arr = {}
    for i=0, 2^n_bits-1 do
        local current_number = ""
        for j=0, n_bits-1 do
        current_number = (math_floor(i/(2^j))%2)..current_number
        end
        table_insert(arr, current_number)
    end
    return arr;
end

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

return _M

