--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

--[[
local head = nil

head = {next = head, value = "d"}
head = {next = head, value = "c"}
head = {next = head, value = "b"}
head = {next = head, value = "a"}

local entry = head

while entry do
  print(entry.value)

  entry = entry.next
end
 ]]
