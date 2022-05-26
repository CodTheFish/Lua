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
    return x
end
local operations = {
    [1] = add,
    [2] = subtract,
    [3] = multiply,
    [4] = divide
}
while true do
    while true do
        print("Select operation.")
        print("1.Add")
        print("2.Subtract")
        print("3.Multiply")
        print("4.Divide")
        io.write("Choose here:")
        local operation = io.read("n")
        io.write("First number please:")
        local x = io.read("n") or io.read("l")
        io.write("Second number please:")
        local y = io.read("n") or io.read("l")
        x = convert(x)
        y = convert(y)
        print(operations[operation](x, y))
    end
end
