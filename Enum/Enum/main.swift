enum Arvore{
    case empty
    indirect case no(Int, Arvore, Arvore)
    
    
    func somarRotulos() -> Int{
        switch self {
        case .empty: return 0
         
        case let .no(v, left, rigth):
            return  v + left.somarRotulos() + rigth.somarRotulos()
        }
    }
    func profundidade() -> Int{
        switch self {
        case .empty: return 0
        
        case let .no(v, left, rigth):
            var l = left.profundidade()
            var r = rigth.profundidade()
            var temp:Int
            if(l>r){
                temp = l
            }
            else{
                temp = r
            }
            return 1 + temp
        }
    }
}


let arveres = Arvore.no(10, .no(6, .no(2, .empty, .empty), .no(7, .empty, .no(8, .empty, .empty))), .no(15, .no(11, .empty, .empty), .no(16, .empty, .empty)))

print(arveres.somarRotulos())
print(arveres.profundidade())
