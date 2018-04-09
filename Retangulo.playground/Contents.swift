import Foundation

struct Ponto{
    var x:Int
    var y:Int
}
struct Retangulo{
    var centro:Ponto
    var largura:Int
    var altura:Int
    
    func igual(a segundoRetangulo: Retangulo) -> Bool{
        return self.largura == segundoRetangulo.largura && self.altura == segundoRetangulo.altura
    }
    func area()->Int{
        return self.altura*self.largura
    }
    func distancia (a ponto:Ponto)->Double{
        return sqrt((pow(Double(self.centro.x-ponto.x), 2))+pow(Double(self.centro.y-ponto.y), 2))
        
    }
}

var r = Retangulo(centro: Ponto(x:1, y:1), largura: 2, altura:2)
var q = Retangulo(centro: Ponto(x:1, y:1), largura: 2, altura:2)
print(r.distancia(a: Ponto(x:1, y:2)))
print(r.igual(a: q))
print(r.area())
