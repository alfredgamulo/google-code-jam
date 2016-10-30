--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local math_floor = math.floor
local math_huge = math.huge

local _M = {
    _VERSION = '0.01'
}

-- merge an array split from p-q, q-r
local function merge(A, p, q, r)
    local n1 = q-p+1
    local n2 = r-q
    local left = {}
    local right = {}

    for i=1, n1 do
        left[i] = A[p+i-1]
    end
    for i=1, n2 do
        right[i] = A[q+i]
    end

    left[n1+1] = math_huge
    right[n2+1] = math_huge

    local i=1
    local j=1

    for k=p, r do
        if left[i]<=right[j] then
            A[k] = left[i]
            i=i+1
        else
            A[k] = right[j]
            j=j+1
        end
    end
end

-- main mergesort algorithm
function _M.mergeSort(A, p, r)
    -- return if only 1 element
    if p < r then
        local q = math_floor((p + r)/2)
        _M.mergeSort(A, p, q)
        _M.mergeSort(A, q+1, r)
        merge(A, p, q, r)
    end
end

--[[
--local sorted_data = {13,27,11,20 }
my_sort.mergeSort(sorted_data, 1, #sorted_data)
print(cjson_encode(sorted_data))
 ]]
return _M

