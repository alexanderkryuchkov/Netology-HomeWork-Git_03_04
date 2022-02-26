import UIKit

// ЗАДАЧА №1

enum ChannelTV {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    
    var label: String {
        switch self {
            case .one: return "Первый"
            case .two: return "Россия"
            case .three: return "НТВ"
            case .four: return "Рен ТВ"
            case .five: return "СТС"
            case .six: return "Пятница"
            case .seven: return "Матч ТВ"
        }
    }
}

class TV {
    private let modelTV: String
    private var isWork: Bool
    private var currentChannel: ChannelTV
    
    // метод включить телевизор
    func turnOn() {
        isWork = true
        print("Телевизор включен! Приятного просмотра.")
    }
    
    // метод выключить телевизор
    func turnOff() {
        isWork = false
        print("Телевизор выключается! До новых встреч!")
    }
    
    // метод проверки включен ли телевизор
    func isWorking() {
        if isWork {
            print("Телевизор включен!")
        } else {
            print("Телевизор выключен!")
        }
    }
    
    // метод проверки какой канал сейчас работает
    func whatCurrentChannel() {
        if isWork {
            print("Текущий канал - \(currentChannel.label)")
        }else {
            print("Телевизор выключен! Сначала включите телевизор!")
        }
    }
    
    // метод проверки модели телевизора
    func whatModelTV() {
        print("Модель телевизора - \(modelTV)")
    }
    
    // метод переключения каналов
    func changeChannelTV(nextChannel: ChannelTV) {
        if isWork {
            currentChannel = nextChannel
            print("Вы переключили канал на - \(nextChannel.label)")
        }else {
            print("Телевизор выключен! Сначала включите телевизор!")
        }
    }
    
    init(modelVT: String){
        self.modelTV = modelVT
        self.isWork = false
        self.currentChannel = ChannelTV.one
    }
}

var myTV = TV(modelVT: "Samsung QE55")

myTV.whatModelTV()
myTV.isWorking()
myTV.changeChannelTV(nextChannel: ChannelTV.two)
myTV.whatCurrentChannel()
myTV.turnOn()
myTV.isWorking()
myTV.whatCurrentChannel()
myTV.changeChannelTV(nextChannel: ChannelTV.two)
myTV.whatCurrentChannel()
