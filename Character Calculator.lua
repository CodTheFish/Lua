local function add (x, y)
    return x + y
end
local function subtract (x, y)
    return x - y
end
local function multiply (x, y)
    return x * y
end
local function divide (x, y)
    return x / y
end
local function convert (x)
    if type(x) == "string" then
        local index = 0
        x = x:lower()
        for char in x:gmatch(".") do
            index = char:byte() -96 + index
        end
        x = index
        return x
    end
end
while true do
    while true do
        print("Select operation.")
        print("1.Add")
        print("2.Subtract")
        print("3.Multiply")
        print("4.Divide")
        local operation = io.read("n")
        print("First number please")
        local x = io.read("n") or io.read("l")
        print ("Second number please")
        local y = io.read("n") or io.read("l")
        x = convert(x)
        y = convert(y)
        if operation > 4 or operation < 1 then
            print("Please choose something between 1 and 4")
            break
        elseif operation == 1 then
            print(x, "+", y, "=", add(x, y))
        elseif operation == 2 then
            print(x, "-", y, "=", subtract(x, y))
        elseif operation == 3 then
            print(x, "*", y, "=", multiply(x, y))
        elseif operation == 4 then
            print(x, "/", y, "=", divide(x, y))
        end
    end
end