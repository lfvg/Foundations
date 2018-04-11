func quick(pArray:[Int])->[Int]{
    var arr = pArray
    let pivo = pArray[0]
    var i = 1
    var j = arr.count-1
    if (arr.endIndex == 2){
        if(arr[0] < arr[1]){
            arr[0] = arr[1]
            arr[1] = pivo
        }
    }
    else{
        while(i<j){
            //erro aqui quando o array so tem um elemento
            //esse erro foi corrigido (na verdade nao precisava do else if em cima, era so ter movido a comparacao de limimte pra antes da de valores dontro do array dos dois whiles)
            while(i<arr.count && arr[i]>=arr[0]){
                i+=1
            }
            while(j>0 && arr[j]<arr[0]){
                j-=1
            }
            if i<=j{
                var temp = arr[i]
                arr[i] =  arr[j]
                arr[j] = temp
            }
        }
        arr[0] = arr[j]
        arr[j] = pivo
    }
    
    var lefti:[Int] = []
    var righti:[Int] = []
    var retorno = arr
    
    print (i)
    //print("Esse é o arr \(arr)")
    
    
    //nao ta entrando aqui
    if i<=arr.endIndex && arr.endIndex>1{
        var left = arr[0 ..< j]
        //print("Esse é o left \(left)")
        lefti = quick(pArray: Array(left))
        //print(lefti)
    }
    if j > 0{
        //let t = arr.count
        // print(t)
        var right = arr[j ..< arr.endIndex]
        //print("Esse é o right \(right)")
        righti = quick(pArray: Array(right))
        
    }
    if lefti.count>0 || righti.count>0{
        retorno = lefti + righti
        //retorno.insert(arr[j], at:j)
    }
    
    return retorno
}


var ar = [11,  10, 30, 20, 54]
print (ar.endIndex)
print(quick(pArray: ar))
