local cursor = "0";
local list = {};
repeat
    local result = redis.call("SCAN", cursor, "MATCH", KEYS[1], "COUNT", 10);
    cursor = result[1];
	for _, v in ipairs(result[2]) do
	  --list[#list+1] = v
	    redis.call("EXPIRE", v, 1000)
	end
until cursor == "0";
return list;
