let array = [10, 15, 5, 33, 99, 4, 8, 1]



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


print(buble(pArray: array))
