class Ponto{
    private var x:Double
    private var y:Double
    
    init(x:Double, y:Double){
        self.x = x
        self.y = y
    }
    func valores()->String{
        return "(x: \(self.x), y: \(self.y))"
    }
}
class FormaGeometrica{
    private var altura:Double
    private var largura:Double
    private var centro:Ponto
    
    init(altura:Double, largura:Double, centro:Ponto){
        self.altura = altura
        self.largura = largura
        self.centro = centro
    }
    func imprimir(){
        print("Centro: \(self.centro.valores())\nAltura: \(self.altura)\nLargura: \(self.largura)")
    }
}

class Forma3D:FormaGeometrica{
    private var comprimento:Double
    
    init(altura:Double, largura:Double, centro:Ponto, comprimento:Double){
        self.comprimento = comprimento
        super.init(altura: altura, largura: largura, centro:centro)
    }
    
    override func imprimir() {
        super.imprimir()
        print("Comprimento: \(self.comprimento)")
    }
}

class Esfera:Forma3D{
    private var raio:Double
    
    init(raio:Double, centro:Ponto) {
        self.raio = raio
        super.init(altura: raio*2, largura: raio*2, centro:centro, comprimento: raio*2)
    }
    
    override func imprimir() {
        super.imprimir()
        print("Raio: \(self.raio)")
    }
}

class Cubo:Forma3D{
    init(lado:Double, centro:Ponto){
        super.init(altura: lado, largura: lado, centro:centro, comprimento: lado)
    }
}

class Paralelepipedo:Forma3D{
    
}




var c = Esfera(raio: 2.0, centro:Ponto(x:0.0, y:0.0))

print(c.imprimir())
