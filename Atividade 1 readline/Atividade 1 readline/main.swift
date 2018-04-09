func unpack(v:Optional<String>) -> Int{
    
    if let k = v {
        if let w =  Int(k){
            return w
        }
    }
    return 0
}

print ("Digite o primeiro valor:")
let x = readLine()
print ("Digite o segundo valor:")
let y = readLine()
print ("Digite o terceiro valor:")
let z = readLine()


let a = unpack(v: x)
let b = unpack(v: y)
let c = unpack(v: z)

let minimo = min(a, b, c)
let maximo = max(a, b, c)

print("Maior valor: \(maximo)")
if !(a==maximo) && !(a==minimo){
    print("Valor do meio: \(a)")
}
else if !(b==maximo) && !(b==minimo){
    print("Valor do meio: \(b)")
}
else {
    print("Valor do meio: \(c)")
}
print("Menor valor: \(minimo)")
