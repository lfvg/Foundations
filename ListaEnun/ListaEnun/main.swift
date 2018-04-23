enum Lista{
    case empty
    indirect case no(Int, Lista)
    
    //FAZER COMO EM HASKELL
     func inserir(valor:Int)->Lista{
        switch self {
        case let .no(x , next):
            return Lista.no(x, next.inserir(valor:valor))
        case .empty:
            return Lista.no(valor, .empty)
        }
    }
    func imprimir (){
        switch self {
        case let .no(x, next):
            print("Nó: \(x)")
            next.imprimir()
        default:
            return
        }
    }
}

var teste:Lista = Lista.no(0, .empty)

teste.imprimir()

teste = teste.inserir(valor: 1)
teste = teste.inserir(valor: 2)
teste = teste.inserir(valor: 3)
teste = teste.inserir(valor: 4)
teste = teste.inserir(valor: 5)

teste.imprimir()
