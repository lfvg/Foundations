import Foundation
protocol Forma{
    func area()->Double
    func igual(a outra:Forma)->Bool
    mutating func mover(dx:Int, dy:Int)->Void
    func incluiPonto(_ ponto:Ponto)->Bool
}
struct Ponto:Forma{
    var x:Int
    var y:Int
    
    func igual(a outra: Forma) -> Bool {
        if outra is Ponto{
            let temp = outra as! Ponto
            return self.x == temp.x && self.y == temp.y
        }
        else{
            return false
        }
    }
    func area() -> Double {
        return 0.0
    }
    mutating func mover(dx: Int, dy: Int) {
        self.x += dx
        self.y += dy
    }
    func incluiPonto (_ ponto:Ponto)->Bool{
        return self.igual(a: ponto)
    }

}
struct Retangulo:Forma{
    var centro:Ponto
    var largura:Int
    var altura:Int
    
    func igual(a outra: Forma) -> Bool{
        if outra is Retangulo{
            let temp = outra as! Retangulo
            return self.largura == temp.largura && self.altura == temp.altura && self.centro.x == temp.centro.x && self.centro.y == temp.centro.y
        }
        else{
            return false
        }
    }
    
    func area()->Double{
        return Double(self.altura*self.largura)
    }
    mutating func mover(dx:Int, dy:Int){
        self.centro.x += dx
        self.centro.x += dx
    }
    func incluiPonto (_ ponto:Ponto)->Bool{
        let tempxma = Double(self.centro.x) + (Double(self.largura)/2)
        let tempxme = Double(self.centro.x) - (Double(self.largura)/2)
        let tempyma = Double(self.centro.y) + (Double(self.altura)/2)
        let tempyme = Double(self.centro.y) - (Double(self.altura)/2)
        return Double(ponto.x) >= tempxme && Double(ponto.x) <= tempxma && Double(ponto.y) >= tempyme && Double(ponto.y) <= tempyma
    }
}

struct Circulo:Forma{
    var raio:Double
    var centro:Ponto
    
    func igual(a outra: Forma) -> Bool {
        if outra is Circulo{
            let temp = outra as! Circulo
            return self.raio == temp.raio && self.centro.x == temp.centro.x && self.centro.y == temp.centro.y
        }
        else{
            return false
        }
        
    }
    func area() -> Double {
        return raio*raio*Double.pi
    }
    mutating func mover(dx:Int, dy:Int){
        self.centro.x += dx
        self.centro.x += dx
    }
    //[FALTA IMPLEMENTAR]
    func incluiPonto (_ ponto:Ponto)->Bool{
        //SABER SE A DISTANCIA DO CENTRO PRA O PONTO E MENOR QUE O RAIO
        return false
    }
}

var r = Retangulo(centro: Ponto(x:1, y:1), largura: 2, altura:2)
var q = Retangulo(centro: Ponto(x:1, y:1), largura: 2, altura:2)
//print(r.distancia(a: Ponto(x:1, y:2)))
print(r.igual(a: q))
print(r.area())


//[PARA A ULTIMA TAREFA, SE FOR UM PONTO CHAMA A FUNCAO QUE VERIFICA PONTO
//SE NAO FOR PONTO E FOR IGUAL
//SE NAO FOR PONTO E FOR DIFERENTE RETANGULO EM CIRCULO -> SABER SE O CENTRO DO RETENGULO TA DENTRO, SABER SE A AREA DO RETANGULO E MENOR, SABER DISTANCIA DO CENTRO PRA O CENTRO DO RETANGULO E MENOR QUE O RAIO SABER SE A DISTANCIA CENTRO A CENTRO MAIS O VALOR DE LARGURA/2 É MENOR QUE O RAIO
//SE NAO FOR PONTO CIRCULO DENTRO DE RETANGULO -> SABER SE A AREA DO CIRCULO E MENOR, SABER SE O CENTRO DO CIRCULO TA DENTRO DO RAIO, SABER SE A DISTANCIA DE CENTRO A CENTRO E MENOR QUE O A LARGURA/2 E A ALTURA/2, SABER SE A DISTANCIA DE CENTRO A CENTRO SOMADO AO RAIO E MENOR QUE ALTURA/2 E LARGURA/2

