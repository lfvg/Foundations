import Foundation
class Forma{
    
    func area()->Double{
        return 0.0
    }
    func igual(a outra:Forma)->Bool{
        return true
    }
    func mover(dx:Int, dy:Int)->Void{
        
    }
    func incluiPonto(_ ponto:Ponto)->Bool{
        return true
    }
}

class Ponto:Forma{
    var x:Int
    var y:Int
    
    init(xn:Int, yn:Int) {
        self.x = xn
        self.y = yn
    }
    
    override func igual(a outra: Forma) -> Bool {
        if outra is Ponto{
            let temp = outra as! Ponto
            return self.x == temp.x && self.y == temp.y
        }
        else{
            return false
        }
    }
    override func area() -> Double {
        return 0.0
    }
    override func mover(dx: Int, dy: Int) {
        self.x += dx
        self.y += dy
    }
    override func incluiPonto (_ ponto:Ponto)->Bool{
        return self.igual(a: ponto)
    }
    
}
class Retangulo:Forma{
    var centro:Ponto
    private var largura:Int
    var altura:Int
    
    init(novoPonto:Ponto, novaLargura:Int, novaAltura:Int) {
        self.centro = novoPonto
        self.altura = novaAltura
        self.largura = novaLargura
    }
    
    override func igual(a outra: Forma) -> Bool{
        if outra is Retangulo{
            let temp = outra as! Retangulo
            return self.largura == temp.largura && self.altura == temp.altura && self.centro.x == temp.centro.x && self.centro.y == temp.centro.y
        }
        else{
            return false
        }
    }
    
    override func area()->Double{
        return Double(self.altura*self.largura)
    }
    override func mover(dx:Int, dy:Int){
        self.centro.x += dx
        self.centro.x += dx
    }
    override func incluiPonto (_ ponto:Ponto)->Bool{
        let tempxma = Double(self.centro.x) + (Double(self.largura)/2)
        let tempxme = Double(self.centro.x) - (Double(self.largura)/2)
        let tempyma = Double(self.centro.y) + (Double(self.altura)/2)
        let tempyme = Double(self.centro.y) - (Double(self.altura)/2)
        return Double(ponto.x) >= tempxme && Double(ponto.x) <= tempxma && Double(ponto.y) >= tempyme && Double(ponto.y) <= tempyma
    }
}

class Circulo:Forma{
    var raio:Double
    var centro:Ponto
    
    init(raio:Double, centro:Ponto) {
        self.raio = raio
        self.centro = centro
    }
    
    override func igual(a outra: Forma) -> Bool {
        if outra is Circulo{
            let temp = outra as! Circulo
            return self.raio == temp.raio && self.centro.x == temp.centro.x && self.centro.y == temp.centro.y
        }
        else{
            return false
        }
        
    }
    override func area() -> Double {
        return raio*raio*Double.pi
    }
    override func mover(dx:Int, dy:Int){
        self.centro.x += dx
        self.centro.x += dx
    }
    //[FALTA IMPLEMENTAR]
    override func incluiPonto (_ ponto:Ponto)->Bool{
        //SABER SE A DISTANCIA DO CENTRO PRA O PONTO E MENOR QUE O RAIO
        return false
    }
}

var r = Retangulo(novoPonto: Ponto(xn:1, yn:1), novaLargura: 2, novaAltura:2)
//var q = Retangulo(centro: Ponto(x:1, y:1), largura: 2, altura:2)
//print(r.distancia(a: Ponto(x:1, y:2)))
//print(r.igual(a: q))
//print(r.area())
print(r.altura)

//[PARA A ULTIMA TAREFA, SE FOR UM PONTO CHAMA A FUNCAO QUE VERIFICA PONTO
//SE NAO FOR PONTO E FOR IGUAL
//SE NAO FOR PONTO E FOR DIFERENTE RETANGULO EM CIRCULO -> SABER SE O CENTRO DO RETENGULO TA DENTRO, SABER SE A AREA DO RETANGULO E MENOR, SABER DISTANCIA DO CENTRO PRA O CENTRO DO RETANGULO E MENOR QUE O RAIO SABER SE A DISTANCIA CENTRO A CENTRO MAIS O VALOR DE LARGURA/2 É MENOR QUE O RAIO
//SE NAO FOR PONTO CIRCULO DENTRO DE RETANGULO -> SABER SE A AREA DO CIRCULO E MENOR, SABER SE O CENTRO DO CIRCULO TA DENTRO DO RAIO, SABER SE A DISTANCIA DE CENTRO A CENTRO E MENOR QUE O A LARGURA/2 E A ALTURA/2, SABER SE A DISTANCIA DE CENTRO A CENTRO SOMADO AO RAIO E MENOR QUE ALTURA/2 E LARGURA/2
