//:# A playground for playing with optional chaining

/*:
 In this playground we talk about optional values and, more specifically, about optional
 chaining and the nil coalescing operator. We use the following function as a starting
 point. Function ``houseByCrest`` returns an optional value. This means that it may return
 something but it is also possible that it returns nothing (``nil``). That is the case if the
 crest (a ``String``) it receives as an argument is not one of the five that appear in the case clauses.
 */

func houseByCrest(_ crest: String) -> String? {
  switch crest {
  case "dragon": return "Targaryen"
  case "wolf": return "Stark"
  case "lion": return "Lannister"
  case "rose": return "Tyrell"
  case "stag": return "Baratheon"
  default: return nil
  }
}

/*:
 ## Forced unwrapping and optional binding

The most straightforward way of obtaining the value wrapped within an optional value is
to force-unwrap it, as follows:
*/
print("The house is \(houseByCrest("dragon")!)")

/*:
 The problem with forced unwrapping is that, if the optional value holds nil, it
 will cause your Swift program to crash: 
*/
//print("The house is \(houseByCrest("trout")!)")

/*:
 If you uncomment the source code line above, you will notice that it produces an 
 unrecoverable error:
 
 EXC_BAD_INSTRUCTION(...)
 
 In other words, forced unwrapping is only an option if your are absolutely sure that
 nothing bad will ever happen by using it. To be sure, some kind of check must be 
 performed beforehand. Swift supports this checking natively, by means of ``if-let``
 statements, such as the following:
 */
if let house2 = houseByCrest("dragon") as String? {
  print("The house is \(house2)")
} else {
  print("This is not the crest of a noble house.")
}


/*:
 In the example above variable, variable house will be bound to the value returned 
 by the houseByCrest function within the ``if-let`` block only if the returned value is
 non-``nil``. In case it is ``nil``, the body of the else clause is executed. This operation
 is called optinal binding because it binds a variable to a value wrapped within an
 optional value. Unlike forced unwrapping, it is safe to perform because it will not
 allow operations over ``nil`` values to be performed.
 */

/*:
 ## Optional Chaining
 
Optional binding is safer than
 forced unwrapping, but it is also more cumbersome to use when it is necessary to
 perform multiple levels of unwrapping. To show why, let's expand the example to
 include a simple struct named ``NobleHouse`` representing each noble house in terms of
 its name, crest, and head. Moreover, we'll define a new function. This function,
 named ``nobleHouseByCrest``, receives the name of a noble house crest and returns a
 value of optionl type ``NobleHouse?``. The returned valye may be ``nil`` if the
 supplied crest does not correspond to any house.
 */
struct NobleHouse {
  let crest : String
  let name : String
  let head : String?
}

func nobleHouseByCrest(_ crest: String) -> NobleHouse? {
  switch crest {
  case "dragon": return NobleHouse(crest: "dragon", name: "Targaryen", head: "Daenerys")
  case "wolf": return NobleHouse(crest: "wolf", name: "Stark", head: nil)
  case "lion": return NobleHouse(crest: "lion", name: "Lannister", head: "Cersei")
  case "rose": return NobleHouse(crest: "rose", name: "Tyrell", head: "Olena")
  case "stag": return NobleHouse(crest: "stag", name: "Baratheon", head: "Tommen")
  default: return nil
  }
}

/*:
 We can also use optional binding in this case:
 */
if let house3 = nobleHouseByCrest("lion") as NobleHouse? {
  print("The house is \(house3.name)")
} else {
  print("This is not the crest of a noble house.")
}

/*:
 A slight complication arises, though, if we are interesed in the head of a house.
 We have to use nested ``if-let`` blocks because the head of a house is represented by
 an optional value:
 */
if let house4 = nobleHouseByCrest("rose") as NobleHouse? {
  if let head = house4.head as String? {
    print("The head of house \(house4.name) is \(head)")
  } else {
    print("This house currently has no head.")
  }
} else {
  print("This is not the crest of a noble house.")
}

/*:
 It is easy to see that this can quickly escalate. If an optional value wraps
 another optional value, using optional binding requires nesting of ``if-let`` blocks,
 potentially with the accompanying else blocks. Using forced unwrapping may then
 sound tempting, since it requires less work. The problem is that, as we have seen
 previously, forced unwrapping is not safe. **Optional chaining** is a Swift feature designed precisely to address the undesirable scenario illustrated by the previous example. The code snippet below provides two examples:
 */
let house5 = nobleHouseByCrest("stag")
print("The head of house \(house5?.name) is \(house5?.head)")

/*:
The use of optional chaining is denoted by adding a question mark ("``?``") right after an
 expression that returns an optional value. In the example above, the result of
 method ``nobleHouseByCrest`` is of type ``NobleHouse?``, an optional value of type ``NobleHouse``.
 In the second line above, optional chaining is employed twice: 

 ``house5?.name``
 
 ``house5?.head``
 
 What the question mark does in each of these cases is to perform the unwrapping
 of the value only if it is non-``nil``. In case it is ``nil``, ``nil`` is returned as the
 result of the evaluation of the expression. This may be unsafe in some contexts,
 but at least does not lead to an unrecoverable error when the optional value 
 does not wrap an actual value. 
 
 Chains of arbitrary lengths can be built using optional chaining, where each 
 link in the chain unwraps an optional value. If any of the links unwraps ``nil``,
 the value of the whole chain is ``nil``. Assume that we want the name of the head
 of each house to be printed in uppercase letters because, well, they are 
 important people. The following piece of code wouldn't work (uncomment it to 
 see the error message):
*/
// print("The head of house \(house5?.name) is \(house5?.head.uppercased())")

/*:
 The reason why it wouldn't work is that head is also optional. In case it holds 
 a value, we must unwrap it prior to using it. With optional chaining, this is
 straightforward:
 */
print("The head of house \(house5?.name) is \(house5?.head?.uppercased())")

/*:
 The meaning of the expression ``house5?.head?.uppercased()`` is the following:
 unwrap variable ``house5`` and, in case it is non-``nil``, unwrap member ``head`` and,
 in case it is not ``nil``, it is the result of the evaluation of the
 
 ``house5?.head?``
 
 part of the expression. Then, obtain the uppercase string corresponding to
 the unwrapped value. If the unwrapping of any part of the expression is ``nil``,
 the value of the whole expression is ``nil``. This is a very important difference
 between optional chaining and forced unwrapping. For example, the following
 piece of code will run, even though it will print a message that does not make
 much sense:
 */
let house6 = nobleHouseByCrest("llama")
print("The head of house \(house6?.name) is \(house6?.head?.uppercased())")

/*:
 ``nil`` is printed twice in the example above because there's no house whose crest
 is a llama. Moreover, since ``house6?`` yields ``nil``, the expression
 ``house6?.head?.uppercased()`` will also be ``nil``. However, the following expression,
 which uses forced unwrapping, will result in a runtime error (and is thus commented):
 */
//print("The head of house \(house6!.name) is \(house6!.head!.uppercased())")

/*:
 Albeit safe, using optional chaining is not always desirable. The following
 example will print the name of the house correctly but, since that house has no 
 head, will also print nil. Moreover, notice in the printed ``String`` that instead of
 ``"Stark"``, we have ``"Optional("Stark")"``. The reason for this is that ``house7?.name``
 can still produce a ``nil`` value. This reveals the main weakness of optional chaining:
 one can chain multiple accesses to optional values, but there's no alternative
 value if any of them wraps a ``nil``.
 */
let house7 = nobleHouseByCrest("wolf")
print("The head of house \(house7?.name) is \(house7?.head?.uppercased())")

/*:
 ## The ``nil`` coalescing operator
 
 In summary, the two main limitations of optional chaining are:
 
 * the evalution of an expression that uses optional chaining must always produce
     a value of an optional type, since it may still return ``nil``
 
 * there's no way to produce an alternative result when the optional value
     wraps ``nil``, i.e., optional chaining eschews the need for ``if-let`` blocks,
     but has no replacement for the ``else`` part of these blocks.
 
 In cases where the limitations above can be a serious obstacle, Swift offers the 
 ``nil`` coalescing operator, "``??``", which circumvents both. This operator receives two
 operands, the first one an expression of an optional type and the second one
 an expression of the corresponding non-optional type, e.g., ``String?`` and ``String``.
 The following snippet presents an example of its usage:
 */
let house8 = nobleHouseByCrest("llama") ?? NobleHouse(crest: "llama", name: "Alpaca", head: "Guanaco")
print("The head of house \(house8.name) is \(house8.head?.uppercased())")

/*:
 In the example above, since it may be that there is no house whose crest is a 
 llama, we provide a default value of type ``NobleHouse`` as the second operand for the
 ``nil`` coalescing operator. It is interesting to note that the uses of ``house8`` in the
 second line above do not require the optional chaining operator because the 
 variable ``house8`` is of type ``NobleHouse`` (instead of ``NobleHouse?``). That operator
 is necessary, though, in the expression
 
 ``house8.head?.uppercased()``
 
 because head is of type ``String?``. We can also use the nil coalescing operator in
 this scenario:
 */
print("The head of house \(house8.name) is \((house8.head ?? "Vicuna").uppercased())")

/*:
 We can now easily address the problem of House Stark not having an (obvious) head.
 In the example below, we combine optional chaining and the nil coalescing operator. 
 We use the former to access the value wrapped within variable ``house7`` and the
 latter to return the name of a house head in case house Stark remains headless:
 */
print("The head of house \(house7?.name) is \((house7?.head ?? "Jon").uppercased())")

