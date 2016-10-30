--
-- Created by IntelliJ IDEA.
-- User: Alfred Gamulo
-- Date: 3/28/16
-- Time: 8:43 PM
--


--G = {
--    -- 1   2   3   4   5   6
--    {  0,  0, 13,  0, 16,  8 }, -- 1
--    {  0,  0,  0,  6,  0, 10 }, -- 2
--    { 13,  0,  0, 14,  0, 11 }, -- 3
--    {  0,  6, 14,  0,  5, 17 }, -- 4
--    { 16,  0,  0,  5,  0,  7 }, -- 5
--    {  8, 10, 11, 17,  7,  0 }  -- 6
--}


--$ lua -i dijkstra.lua 
--Lua 5.1 (beta)  Copyright (C) 1994-2005 Lua.org, PUC-Rio
--> d,p = dijkstra(G, 1)
--> table.foreach(d, print)
--1       0
--2       18
--3       13
--4       20
--5       15
--6       8
--> table.foreach(p, print)
--2       6
--3       1
--4       5
--5       6
--6       1
--> for i = 1, table.getn(G) do print(i, d[i], table.concat(path(p, i), ' -> ')) end
--1       0       1
--2       18      1 -> 6 -> 2
--3       13      1 -> 3
--4       20      1 -> 6 -> 5 -> 4
--5       15      1 -> 6 -> 5
--6       8       1 -> 6



local math_huge = math.huge
local pairs = pairs
local table_getn = table.getn
local table_insert = table.insert

local _M = {
    _VERSION = '0.01'
}

local extract_min = function(q, d)
    local m = math_huge
    local i = 0
    for k, v in pairs(q) do
        if d[v] < m then
            m = d[v]
            i = k
        end
    end
    q[i] = nil -- remove i
    return i
end

function _M.dijkstra (graph, start)
    local n = #graph --table_getn(graph) -- #vertices
    local d = {}
    local previous = {}
    for v = 1, n do d[v] = math_huge end
    d[start] = 0
    local S = {}
    local Q = {}
    for v = 1, n do Q[v] = v end -- fill Q
    local nQ = n -- # elements in Q
    while nQ > 0 do
        local u = extract_min(Q, d)
        nQ = nQ - 1
        table_insert(S, u)
        for v = 1, n do
            if graph[u][v] > 0 -- edge between u and v?
                    and d[v] > d[u] + graph[u][v] then -- relax
            d[v] = d[u] + graph[u][v]
            previous[v] = u
            end
        end
    end
    return d, previous
end

function _M.path (p, start)
    local i = start
    local t = { i }
    while p[i] do
        table_insert(t, 1, p[i])
        i = p[i]
    end
    return t
end

return _M