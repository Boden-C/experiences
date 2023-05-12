class LSystem {
    var axiom:String; var rules:[Character:String]; var alphabet:Set<Character>    
    var term:Set<Character>; var nonTerm:Set<Character>

    init(axiom:String, rules:[Character:String], alphabet:Set<Character>) {
        var newRules = rules; var term:Set<Character> = []; var nonTerm:Set<Character> = []

        for element in alphabet {
            if (newRules[element] == nil) { //rules for this does not exist; terminal
                newRules[element] = String(element)
                term.insert(element)
                continue;
            }
            nonTerm.insert(element) //rules does exist; non terminal
        }

        self.axiom = axiom; self.rules = newRules; self.alphabet = alphabet
        self.term = term; self.nonTerm = nonTerm
    }

    func generate(_ count:Int) -> String {
        generateFrom(axiom:self.axiom, count:count)
    }

    func generateFrom(axiom:String, count:Int) -> String {
        guard (count > 0) else { print("generation[\(count)]:\(axiom)"); return axiom; }
        let new = generateFrom(axiom:axiom, count:count-1).map{
            precondition(self.rules[$0] != nil, "Generation \(count) contains character \($0) that does not exist in alphabet")
            return self.rules[$0]!
        }.joined()
        print("generation[\(count)]:\(new)")
        return new;
    }

    func getTerminals() -> [Character] {
        return Array(self.term).sorted()
    }

    func getNonTerminals() -> [Character] {
        return Array(self.nonTerm).sorted()
    }
}

/*
var alphabet:Set<Character> = []
var productionRule:[Character:String] = [:]
var axiom:String = ""
var generationCount:Int = 0

while let input = readLine() {
    let inputArray = input.split(separator:":", maxSplits:1) //split on ":"
    let type = String(inputArray[0]) //Gets text before ":"
    let value = String(inputArray[1]) //Gets text after ":"
    
    switch type {
    case "alphabet":
        alphabet = Set(value); break;
    case "productionRule":
        let preAndPost = value.split(separator: " ", maxSplits: 2) //Splits on " " into ["pre","->","post"]
        productionRule[Character(String(preAndPost[0]))] = String(preAndPost[2]) //Puts in pre and post values
        continue;
    case "axiom":
        axiom = value; continue;
    case "generationCount":
        generationCount = Int(value)!; continue;
    default:
        break;
    }
}

let givenSystem = LSystem(axiom:axiom, rules:productionRule, alphabet:alphabet)

print("terminals:\(givenSystem.getTerminals())")
print("nonTerminals:\(givenSystem.getNonTerminals())")
_ = givenSystem.generate(generationCount)
 */
