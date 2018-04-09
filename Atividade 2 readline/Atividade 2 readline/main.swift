func buble(pArray: [Int]) -> [Int]{
    var tempArray = pArray
    let tamanho = tempArray.count
    var indice = 0
    while(indice<tamanho){
        var posMaior = indice
        var restoArray = indice+1
        while(restoArray<tamanho){
            if(tempArray[restoArray]>tempArray[posMaior]){
                posMaior = restoArray
            }
            restoArray+=1
        }
        if(posMaior != indice){
            let tpp = tempArray[indice]
            tempArray[indice] = tempArray[posMaior]
            tempArray[posMaior] = tpp
        }
        indice+=1
    }
    
    return tempArray
}

func astrToAint(pArray: [String.SubSequence]) -> [Int]{
    //Atencao o array r nao foi inicializado, logo na linha 33 nao da pra usar r[indice] = v (idiosincrasias das linguagens de programacao modernas)
    //Obs: segundo testes se a insercao nao for em ordem, i.e. na posicao 0, depois 1, etc, o programa quebra
    var r:[Int] = []
    let tamanho = pArray.count
    var indice = 0
    while(indice<tamanho){
        let tp = Int(pArray[indice])
        if let v =  tp{
            r.insert(v, at: indice)
        }
        indice += 1
    }
    return r
}


print("Digite a sequencia de numeros que você quer ordenar separado por espacos:")
let entrada = readLine()
var str:String = ""
if let s = entrada{
    str = s
}

let strArray = str.split(separator: " ", omittingEmptySubsequences: true)

print(buble(pArray : astrToAint(pArray: strArray)))

//print(buble(pArray: array))

