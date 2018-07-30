//
//  Configuration.swift
//  PensamentosApp
//
//  Created by Caio Cardozo on 30/06/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String{
    case timeInterval = "timerInterval"
    case colorScheme = "colorScheme"
    case autoRefresh = "autoRefresh"
}

class Configuration {
    let defaults = UserDefaults.standard
    //criando o singeton da classe configuration
    static var shared : Configuration = Configuration()
    
    
    var timeInterval: Double{
        get{
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int{
        get{
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool{
        get{
            return defaults.bool(forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
    }
    
    
    //colocar o construtor como privado para nao correr o risco de instanciar
    private init(){
        //como pega o valor gravado pode retornar 0 e o defaut e 8. Entao se for a prmeira execucao e o valor e 0
        //seta o padrao que e 8 o minimo
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0 , forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        
    }
}
