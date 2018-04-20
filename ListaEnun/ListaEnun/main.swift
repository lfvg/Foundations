enum Lista{
    case empty
    indirect case no(Int, Lista)
    
    //FAZER COMO EM HASKELL
     func inserir(valor:Int)->Lista{
        switch self {
        case let .no(x, next):
            return (x, next.inserir(valor:valor))
        case .empty:
            var a:Lista = (valor, .empty)
            return
        }
    }
    
    
    
}


