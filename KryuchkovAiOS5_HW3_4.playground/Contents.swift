import UIKit


// ЗАДАЧА №1
print("ЗАДАЧА №1\n")

// Общий протокол на все электронные устройства
protocol ElectronicDevices {
    // Модель
    var modelDevice: String {get set}
    // Свойство: включен выключен
    var isWork: Bool {get set}
    
    // метод проверки включен ли
    func isWorking()
    // Метод включения устройства
    func turnOn()
    // Метод выключения устройства
    func turnOff()
    // Метод вывода в консоль модели устройства
    func whatModelDevice()
}

enum ChannelTV: Int {
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

class TV: ElectronicDevices {
    var modelDevice: String
    var isWork: Bool
    private var currentChannel: ChannelTV
    
    func turnOn() {
        isWork = true
        print("Телевизор включен! Приятного просмотра.")
    }
    
    func turnOff() {
        isWork = false
        print("Телевизор выключается! До новых встреч!")
    }
    
    func isWorking() {
        if isWork {
            print("Телевизор включен!")
        } else {
            print("Телевизор выключен!")
        }
    }
    
    func whatCurrentChannel() {
        if isWork {
            print("Текущий канал - \(currentChannel.label)")
        }else {
            print("Телевизор выключен! Сначала включите телевизор!")
        }
    }
    
    func whatModelDevice() {
        print("Модель телевизора - \(modelDevice)")
    }
    
    // метод переключения каналов
    func changeChannelTV(newChannel: ChannelTV) {
        if isWork {
            currentChannel = newChannel
            print("Вы переключили канал на - \(newChannel.label)")
        }else {
            print("Телевизор выключен! Сначала включите телевизор!")
        }
    }
    
    init(modelDevice: String){
        self.modelDevice = modelDevice
        self.isWork = false
        self.currentChannel = ChannelTV.one
    }
}

var myTV = TV(modelDevice: "Samsung QE55")

myTV.whatModelDevice()
myTV.isWorking()
myTV.changeChannelTV(newChannel: ChannelTV.one)
myTV.whatCurrentChannel()
myTV.turnOn()
myTV.isWorking()
myTV.whatCurrentChannel()
myTV.changeChannelTV(newChannel: ChannelTV.two)
myTV.whatCurrentChannel()


// ЗАДАЧА №2
print("\nЗАДАЧА №2\n")

// Структура настроек ТВ
struct SettingsTV {
    // Свойство цветной/черно-белый
    var isColor: Bool = true
    // Свойство включена ли громкость или нет
    var isVolumel: Bool = true
}

class LedTV: TV {
    
    var isColor: Bool
    var isVolumel: Bool
    
    init(modelDevice: String, settingsTV: SettingsTV) {
        self.isColor = settingsTV.isColor
        self.isVolumel = settingsTV.isVolumel
        
        super.init(modelDevice: modelDevice)
    }
    
    // Дописать функцию выключить/включить звук
    func volumeTurnOnOff() {
        
    }
    
    // Дописать функцию поменять вывод ТВ цвет/черно-белый
    func colorTurnOnOff() {
        
    }
    
    // ПЕРЕПИСАТЬ МЕТОД, что показывается учитывая настройки громкости и цвета
    override func whatCurrentChannel() {
        
    }
}

let settingsNewTV = SettingsTV()
let newTV = LedTV(modelDevice: "Toshiba XC20", settingsTV: settingsNewTV)
newTV.whatModelDevice()
