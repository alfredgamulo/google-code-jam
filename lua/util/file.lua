--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--

local io_open = io.open
local pairs = pairs
local table_insert = table.insert

local _M = {
    _VERSION = '0.01'
}

function _M.read_file(input_filename)
    local file = assert(io_open(input_filename, "r"))
    local input_table = {}
    for line in file:lines(input_filename) do
        table_insert(input_table, line)
    end
    file:close()
    return input_table
end

function _M.write_file(output_data, output_filename)
    local file = io_open(output_filename, "w+")
    --file:write("Output")
    for k,v in pairs(output_data) do
        file:write("Case #"..k..": "..v)
        if k < #output_data then
            file:write("\n")
        end
    end
    io.close(file)
end

return _M