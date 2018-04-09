func quick(pArray:[Int])->[Int]{
    var arr = pArray
    let pivo = pArray[0]
    var i = 1
    var j = arr.count-1
    
    while(i<j){
        while(arr[i]>=arr[0] && i<arr.count){
            i+=1
        }
        while(arr[j]<arr[0] && j>0){
                    j-=1
        }
        if i<=j{
            var temp = arr[i]
            arr[i] =  arr[j]
            arr[j] = temp
        }
    }
    var lefti:[Int] = []
    var righti:[Int] = []
    var retorno = arr
    
    if i<arr.count-1{
        var left = arr[0 ..< j]
        lefti = quick(pArray: Array(left))
    }
    if j > 0{
        var right = arr[j+1 ..< arr.endIndex]
        righti = quick(pArray: Array(right))
        
    }
    if lefti.count>0 || righti.count>0{
        retorno = lefti + righti
        retorno.insert(arr[j], at:j)
    }
    
    return retorno
}


var ar = [11, 10, 30, 20, 54, 6]
print(quick(pArray: ar))
