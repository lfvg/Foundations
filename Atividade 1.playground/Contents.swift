let x = -5
let y = 6
let z = 3
let minimo:Int = min(x, y, z)
let maximo:Int = max(x, y, z)
print(maximo)
//o retorno de min e max eh um Comparable que pode ser comparado com >, <, >=, <=, e ==
//mas nao != (?)
if !(x==maximo) && !(x==minimo){
    print(x)
}
else if !(y==maximo) && !(y==minimo){
    print(y)
}
else {
    print(z)
}
print(minimo)
