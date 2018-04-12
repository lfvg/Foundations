func quick(pArray:[Int])->[Int]{
    var arr = pArray
    //ele para aqui [BUG] [CORRIGIR]
    var i = 1
    var j = arr.count-1
    
    print("O valor de i é \(i)\nO valor de j é \(j)")
    if (arr.endIndex == 2){
        print("Entrou no if")
        if(arr[0] < arr[1]){
            let temp = arr[0]
            arr[0] = arr[1]
            arr[1] = temp
        }
    }
    else if (arr.endIndex>2){
        print("Entrou no else")
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
        let temp = arr[0]
        arr[0] = arr[j]
        arr[j] = temp
    }
    
    var lefti:[Int] = []
    var righti:[Int] = []
    var retorno = arr
    
    
    //print("Esse é o arr \(arr)")
    
    
    //nao ta entrando aqui
    //erro quando o array eh todo a direita e maior que tamanho 1
    if i<=arr.endIndex && arr.endIndex>1{
        print("entrei lef")
        var left = arr[0 ..< j]
        print("Esse é o left \(left)")
        lefti = quick(pArray: Array(left))
        //print(lefti)
    }
    if j > 0{
        print("entrei right")
        //let t = arr.count
        // print(t)
        var right = arr[j ..< arr.endIndex]
        print("Esse é o right \(right)")
        righti = quick(pArray: Array(right))
        
    }
    if lefti.count>0 || righti.count>0{
        retorno = lefti + righti
        //retorno.insert(arr[j], at:j)
    }
    
    return retorno
}

var teste:[Int] = [11,  10, 30]
var a = teste[0..<0]
var b = Array(a)
print("Valores de a \(b)")
var ar = [11,  10, 30, 20, 54, 6]
print(quick(pArray: ar))
