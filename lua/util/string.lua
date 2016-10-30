--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local string_gsub = string.gsub
local string_gmatch = string.gmatch
local string_reverse = string.reverse
local string_len = string.len
local string_find = string.find
local string_sub = string.sub

local _M = {
    _VERSION = '0.01'
}

--finds the longest sequence of contiguous or disjoint elements common to the strings or lists a and b.
function _M.LCS( a, b )
    if #a == 0 or #b == 0 then
        return ""
    elseif string_sub( a, -1, -1 ) == string_sub( b, -1, -1 ) then
        return _M.LCS( string_sub( a, 1, -2 ), string_sub( b, 1, -2 ) ) .. string_sub( a, -1, -1 )
    else
        local a_sub = _M.LCS( a, string_sub( b, 1, -2 ) )
        local b_sub = _M.LCS( string_sub( a, 1, -2 ), b )

        if #a_sub > #b_sub then
            return a_sub
        else
            return b_sub
        end
    end
end


function _M.replaceCharAtIndex(str, i, r)
    return string_sub(str,1, i-1) .. r .. string_sub(str,i+1)
end

function _M.ispalindrome(s) 
  return s == string_reverse(s) 
end

-- remove leading whitespace from string.
-- http://en.wikipedia.org/wiki/Trim_(programming)
function ltrim(s)
  return (s:gsub("^%s*", ""))
end

-- remove trailing whitespace from string.
-- http://en.wikipedia.org/wiki/Trim_(programming)
function rtrim(s)
  local n = #s
  while n > 0 and s:find("^%s", n) do n = n - 1 end
  return s:sub(1, n)
end

--[[
LOOPS
for i = 1, #str do
    local c = str:sub(i,i)
    -- do something with c
end
for c in str:gmatch"." do
    -- do something with c
end
str:gsub(".", function(c)
    -- do something with c
end)
]]

function mysplit(inputstr, sep)
  if sep == nil then
          sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
          t[i] = str
          i = i + 1
  end
  return t
end

return _M



