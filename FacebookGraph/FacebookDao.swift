//
//  FacebookDao.swift
//  FacebookGraph
//
//  Created by Rafael Ferreira on 3/16/16.
//  Copyright © 2016 Swift Yah. All rights reserved.
//

import Alamofire
import AlamofireImage
import AlamofireObjectMapper

class FacebookDao {
    
    static let sharedInstance = FacebookDao()
    
    let peopleToEvaluate: [Person] = [
        Person(name: "Abdiel Freire Moreira Neto", email: "abdielfr@gmail.com"),
        Person(name: "ADRIANA RODRIGUES DOS SANTOS", email: "adriana@maduenho.com"),
        Person(name: "Afonso Soares Leite Neto", email: "afonsoleite07@hotmail.com"),
        Person(name: "Aline Feltrin Foguel", email: "alineffoguel@hotmail.com"),
        Person(name: "Allana Naves Santos Ribeiro", email: "allana_naves@hotmail.com"),
        Person(name: "Alline Agustino", email: "alline_agustino@yahoo.com.br"),
        Person(name: "Amanda Regina Celli", email: "amandareginacelli@gmail.com"),
        Person(name: "Ana Carolina de Paula Silva", email: "anacdps@gmail.com"),
        Person(name: "André Barbosa Takimoto Appolinario", email: "dedetaki2@gmail.com"),
        Person(name: "Andrea Zorub Pasquini", email: "andrea.pasquini@nokia.com"),
        Person(name: "Annie Gabrielle Campos Galvão de Souza", email: "annie.gabi@hotmail.com"),
        Person(name: "Arthur Pereira dos Anjos Bertini", email: "arthurbertini@hotmail.com"),
        Person(name: "Benjamim  G. Mateus", email: "benjamimateus@hotmail.com"),
        Person(name: "Brayan Nicollas Moussa Miranda", email: "bnicollas.miranda@gmail.com"),
        Person(name: "Bruna Felicio", email: "bruna_felicio@yahoo.com.br"),
        Person(name: "Caio Villa Silva Tsubake", email: "caiotsubake@hotmail.com"),
        Person(name: "Caleb Matheus Ribeiro de Miranda", email: "caleb.miranda@gmail.com"),
        Person(name: "Camila Dorazzio de Souza", email: "camiladorazzio@gmail.com"),
        Person(name: "Carla Regina Santos Pereira", email: "carlareg11@hotmail.com"),
        Person(name: "Carlos Eduardo Teixeira", email: "ceteixeira7774@gmail.com"),
        Person(name: "Carlos Roberto Anastacio", email: "cra.45@ig.com.br"),
        Person(name: "Christian Arlindo Diehl Diel", email: "christian.diel@gmail.com"),
        Person(name: "Cinthya de Oliveira Hildinger", email: "ciihildinger@gmail.com"),
        Person(name: "Cintia Ferreira de Souza", email: "cintia.odonto@outlook.com"),
        Person(name: "Cláudio Santos", email: "claudionegraox@gmail.com"),
        Person(name: "Clayton Dantas Barbosa", email: "claytonrehder@hotmail.com"),
        Person(name: "Cleusa Alves de Almeida", email: "alvescleusa@yahoo.com.br"),
        Person(name: "Dalva Corrêa Galvão", email: "coachdalva@uol.com.br"),
        Person(name: "Danielly da Silva Barbosa", email: "daniellyb97@gmail.com"),
        Person(name: "David da Cunha Soares", email: "dcunhasoares@gmail.com"),
        Person(name: "Dayane Rufino de Lima", email: "daylima@hotmail.com"),
        Person(name: "DEBORA PEREIRA DOS ANJOS SOUSA", email: "debora.anjos@gmail.com"),
        Person(name: "Deborah de Faria Camargo", email: "deborah_camargo02@msn.com"),
        Person(name: "Denise  Cavalieri", email: "dcaval@ig.com.br"),
        Person(name: "Diego Castro Cruz", email: "diegocastrocruz@hotmail.com"),
        Person(name: "Edmilson Araújo Cunha Jr.", email: "ed_jxr@hotmail.com"),
        Person(name: "Elisa Silva Bomfim Boni", email: "elisabomfim@gmail.com"),
        Person(name: "ERLI DIAS ANDRADE", email: "erlidandrade@hotmail.com"),
        Person(name: "Evelyn de Oliveira Hildinger", email: "evelyn.hildinger95@gmail.com"),
        Person(name: "Ewerton Rodrigo de Miranda", email: "ewerton1979@gmail.com"),
        Person(name: "Ewerton Rodrigo de Miranda", email: "ewerton1979@gmail.com"),
        Person(name: "Fabio Schirmer de Campos", email: "fa_schirmer@yahoo.com.br"),
        Person(name: "Fernanda Kowalski Duraes Santos", email: "fekdsantos@hotmail.com"),
        Person(name: "Fernanda Souza Cardoso", email: "fefe.scardoso@gmail.com"),
        Person(name: "Gabriel Gnutzmans Cardinali", email: "gabrielcardinali94@gmail.com"),
        Person(name: "Gabriela Formigari Abdalla", email: "gabfabdalla@gmail.com"),
        Person(name: "Gilmar de Oliveira Dornelas Junior", email: "gilmar_dornelas@yahoo.com.br"),
        Person(name: "Giovana Marques do Nascimento", email: "gmarquesdonascimento@gmail.com"),
        Person(name: "Gisele Gonçalves Maciel Cabrobó", email: "gigmaciel@yahoo.com.br"),
        Person(name: "Giuliana Gnutzmans Cardinali", email: "giulianacardinai48@gmail.com"),
        Person(name: "Glaucia Cristina dos Santos Ribeiro", email: "glauciacristina021014@gmail.com"),
        Person(name: "Greice Heredia Moura", email: "greicemoura@gmail.com"),
        Person(name: "Hellen Almeida Cabrobó", email: "hellen.ac@gmail.com"),
        Person(name: "Jamile Nunes", email: "jamicoach@hotmail.com"),
        Person(name: "Jeane Eisenhut", email: "jeaneeisen@hotmail.com"),
        Person(name: "Jefferson Willians Moreira Santiago", email: "jeffersonwm.santiago@hotmail.com"),
        Person(name: "Jessica Santiago da Silva", email: "jeufisio@gmail.com"),
        Person(name: "Joe Alcantara", email: "joe_chavs@hotmail.com"),
        Person(name: "josilene rodrigues rocha", email: "josy.rocha.enf@hotmail.com"),
        Person(name: "Joyce Cavalieri", email: "joycavalieri@hotmail.com"),
        Person(name: "Joyli Gerodo", email: "joyligerodo@gmail.com"),
        Person(name: "Júlia Lemos G Silva", email: "julialgsilva21@gmail.com"),
        Person(name: "Júlia Mendes Lima", email: "julia_lima98@hotmail.com"),
        Person(name: "Juliana Martinez Praxedes", email: "liapraxedes@gmail.com"),
        Person(name: "Juliana Ribeiro de Matos", email: "juribeiromatos@yahoo.com.br"),
        Person(name: "Juliane Eisenhut", email: "jueisenhut@hotmail.com"),
        Person(name: "Karyn de Oliveira Hildinger", email: "karyn.hildinger@gmail.com"),
        Person(name: "KETLEY DIAS ANDRADE", email: "ketley.andrade@hotmail.com"),
        Person(name: "Lais Toporovicz Cajé Maciel", email: "dentalblf@hotmail.com"),
        Person(name: "Laura Beatrice Poll", email: "laurapoll@hotmail.com"),
        Person(name: "Leandro de Amorim Cavalcanti", email: "deamorim.cavalcanti@gmail.com"),
        Person(name: "Lúbia Carvalho da Silva", email: "lubinha_c@yahoo.com.br"),
        Person(name: "Luis Felipe Boschilia", email: "lufebos@gmail.com"),
        Person(name: "MARCO AURÉLIO TRIGUEIRO DE ANDRADE", email: "marcoaurelioandrade@yahoo.com.br"),
        Person(name: "Maria Juliana Ariboni Losso", email: "majuariboni@hotmail.com"),
        Person(name: "Maria Marta Ariboni", email: "martariboni@gmail.com"),
        Person(name: "Mariane Pereira de Morais", email: "marianemorais28@hotmail.com"),
        Person(name: "Michele Freitas Aranha Cunha", email: "michelearan@gmail.com"),
        Person(name: "Michele Freitas Aranha Cunha", email: "michelearan@gmail.com"),
        Person(name: "Nasser marcussi", email: "marcussi1@hotmail.com"),
        Person(name: "Nathan Arthuro Guimarães de Campos", email: "nathanarthuro@hotmail.com"),
        Person(name: "Nayani Cristiny Guimarães de Campos", email: "nayani_cristiny_campos@hotmail.com"),
        Person(name: "Nicolle Miranda", email: "nicollesmm@gmail.com"),
        Person(name: "Osvaldo Frederico Inlamea", email: "osvaldosdc@gmail.com"),
        Person(name: "Panays Constantino Neto", email: "panays.neto@gmail.com"),
        Person(name: "Paolo Munhoes Marchetti", email: "paolo.mch@gmail.com"),
        Person(name: "Patrícia Motta de Meo", email: "patymmeo@gmail.com"),
        Person(name: "Paulo Henrique Ruffo", email: "paulo_ruffo@ig.com.br"),
        Person(name: "Priscila Daniele de Oliveira", email: "pridanioliveira@hotmail.com"),
        Person(name: "Priscilla Galvino Pereira", email: "pgalvino@hotmail.com"),
        Person(name: "Rafael da Silva Ferreira", email: "rafael_yami@hotmail.com"),
        Person(name: "Renata Ferreira Krofke", email: "re.krofke@gmail.com"),
        Person(name: "Renata Oliveira Zambelli", email: "renata.zambelli@gmail.com"),
        Person(name: "RICARDO AUGUSTO MIDEI", email: "ricardomidei@gmail.com"),
        Person(name: "Robson Eutério dos Santos", email: "robsoneuterio@gmail.com"),
        Person(name: "Thiago Barrizzelli Murino", email: "thibarriz@hotmail.com"),
        Person(name: "Thiago Machado Lhobrigat", email: "thiagotml.91@gmail.com"),
        Person(name: "Thiele Padulla Gerodo", email: "thiele.padulla@gmail.com"),
        Person(name: "Thomás Henrique Ribeiro de Miranda", email: "thomasrmiranda@gmail.com"),
        Person(name: "Valdir De Oliveira", email: "v.d.o@uol.com.br"),
        Person(name: "Vívian de Souza", email: "viviandorazzio@gmail.com"),
        Person(name: "Vívian de Souza", email: "viviandorazzio@gmail.com"),
        Person(name: "Viviane Regina Celli", email: "vivikacelli@hotmail.com"),
        Person(name: "WILMA WALLAUER MATTOS", email: "wilmawmattos@gmail.com"),
        Person(name: "Zulmira dos Santos Anastácio", email: "zuzubalandya@ig.com.br"),
    ]
    
    init() {
        // Lazy initialization
    }
    
    // MARK: Public methods
    
    func findFacebookId(person: Person, var numberOfInterations: Int = 0) {
        
        guard numberOfInterations <= FacebookApi.limitOfInterations else { return }
        
        let endPoint = FacebookEndPoint.Search(person)
        let index = peopleToEvaluate.indexOf({ $0 == person })!
        
        request(endPoint.getRequestMethod(), endPoint.getUrl(), parameters: endPoint.getParameters(numberOfInterations))
            .validate()
            .responseObject { (response: Response<SearchResponse, NSError>) -> Void in
                
                guard let result = response.result.value, let users = result.users else { return }
                
                guard !users.isEmpty else {
                    numberOfInterations += 1
                    self.findFacebookId(person, numberOfInterations: numberOfInterations)
                    
                    return
                }
                
                let user = users[0]
                
                self.peopleToEvaluate[index].facebookId = user.id!
        }
    }
    
}
