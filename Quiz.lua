local questions = {
[1] = "Which of the following ingredients is not normally used to brew beer?",
[2] = "Which location is further east?",
[3] = "Substances that have a definite size and shape, and vibrating particles that are close together are:",
[4] = "What is the most densely populated U.S. state?"
}
local multipleChoice = {
[1] = "A) Hops B) Yeast C) Malt D) Vinegar",
[2] = "A) New York, USA B) Santiago, Chile",
[3] = "A) Liquids B) Gases C) Solids", 
[4] = "A) Connecticut B) New Jersey C) Rhode Island D) Maryland"
}
local correctAnswers = {
[1] = "d",
[2] = "b",
[3] = "c",
[4] = "a"
}
local usedQuestions = {}
local points = 0
local function tableContains(tbl, element)  --Denne tar in hvilken liste og hva vi leter etter og sjekker om den er der og gir true hvis den er der
    for _, value in pairs(tbl) do
      if value == element then
        return true
      end
    end
    return false
end
local function checkAnswer(question, answer) --Denne sjekker om svaret er korrekt bassert på hvilken spørsmål den tilsvarer i correctAnswers
    if correctAnswers[question] == answer then
        print("Correct!")
        points = points + 1
        if points == #questions then
            io.write("You got them all, good job!")
            return
        elseif #usedQuestions == #questions then
            io.write("You got ", points, " out of ", #questions, " points!")
        end
    else
        io.write("Incorrect!")
    end
end
local function questionChoice()
    if #usedQuestions == #questions then
        io.write("You finished the quiz!")
        return
    end
    local random = math.random(1, 4)
    if tableContains(usedQuestions, random) == true then
        return questionChoice()
    end
    table.insert(usedQuestions, 1, random)
    print(questions[random])
    print(multipleChoice[random])
    io.write("Answer here:")
    local answer = io.read("l")
    answer = answer:lower()
    checkAnswer(random, answer)
    return questionChoice()
end
questionChoice()

