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
    
    // метод включить ТВ
    func turnOn() {
        isWork = true
        print("Телевизор включен! Приятного просмотра.")
    }
    
    // метод выключить ТВ
    func turnOff() {
        isWork = false
        print("Телевизор выключается! До новых встреч!")
    }
    
    // метод проверки включен ли ТВ
    func isWorking() {
        if isWork {
            print("Телевизор включен!")
        } else {
            print("Телевизор выключен!")
        }
    }
    
    // метод проверки какой текущий канал
    func whatCurrentChannel() {
        if isWork {
            print("Текущий канал - \(currentChannel.label)")
        }else {
            print("Телевизор выключен! Сначала включите телевизор!")
        }
    }
    
    // метод показа модели телевизора
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

// Тестовые вызовы
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
    var isVolume: Bool = true
}

class LedTV: TV {
    
    var colortTV: String = "цветной режим"
    var volumeTV: String = "звук включен"
    
    // Дописать функцию выключить/включить звук
    func volumeTurnOnOff() {
        if volumeTV == "звук включен"{
            volumeTV = "звук выключен"
        }else {
            volumeTV = "звук включен"
        }
        print(volumeTV)
    }
    
    // Дописать функцию поменять вывод ТВ цвет/черно-белый
    func colorTurnOnOff() {
        if colortTV == "цветной режим"{
            colortTV = "черно-белый режим"
        }else {
            colortTV = "цветной режим"
        }
        print("Телевизор переведен в \(colortTV)")
    }
    
    override func whatCurrentChannel() {
        super.whatCurrentChannel()
        print("Настройки телевизора:\(volumeTV), \(colortTV).")
    }
    
    init(modelDevice: String, settingsTV: SettingsTV) {
        
        if settingsTV.isColor {
            colortTV = "цветной режим"
        }else {
            colortTV = "черно-белый режим"
        }
        
        if settingsTV.isVolume {
            volumeTV = "звук включен"
        }else {
            volumeTV = "звук выключен"
        }
        
        super.init(modelDevice: modelDevice)
    }
}

let settingsNewTV = SettingsTV()
let newTV = LedTV(modelDevice: "Toshiba XC20", settingsTV: settingsNewTV)

// Тестовые вызовы
newTV.whatModelDevice()
newTV.turnOn()
newTV.whatCurrentChannel()
newTV.volumeTurnOnOff()
newTV.whatCurrentChannel()
newTV.colorTurnOnOff()
newTV.whatCurrentChannel()


// ЗАДАЧА №3
print("\nЗАДАЧА №3\n")

// К сожалению не придумал как сделать enum со связанными значениями не переписывая родительский класс где enum с телеканалами. Точнее придумал, но это придется половину методов в родительском классе TV переписывать. По-этому решил оставить так. Мне кажется так правильно, ведь в противном случае слишком много кода пришлось бы изменять, что в принципе не является верным путем.
//Перечисление вариантов подключения к телевизору
enum SettingsInputTV: Int {
    case tv
    case hdmi
    
    var label: String {
        switch self {
            case .tv: return "Телевидение"
            case .hdmi: return "HDMI"
        }
    }
}


class NewHDMITV: LedTV {
    
    private var typeInput: SettingsInputTV
    
    // метод переключения варианта выбора источника
    func changeInputTV() {
        if typeInput == SettingsInputTV.tv {
            typeInput = SettingsInputTV.hdmi
            print("Включен режим: \(SettingsInputTV.hdmi.label)")
        }else {
            typeInput = SettingsInputTV.tv
            print("Включен режим: \(SettingsInputTV.tv.label)")
        }
    }
    
    override func whatCurrentChannel() {
        if typeInput == SettingsInputTV.tv {
            super.whatCurrentChannel()
        }else {
            print("Включен режим HDMI. Переключитель на режим телевидения.")
        }
    }
    
    override init(modelDevice: String, settingsTV: SettingsTV) {
        self.typeInput = SettingsInputTV.tv
        super.init(modelDevice: modelDevice, settingsTV: settingsTV)
    }
}

let newHDMITV = NewHDMITV(modelDevice: "Sony E200", settingsTV: settingsNewTV)

// Тестовые вызовы
newHDMITV.whatModelDevice()
newHDMITV.turnOn()
newHDMITV.changeInputTV()
newHDMITV.whatCurrentChannel()
newHDMITV.changeInputTV()
newHDMITV.whatCurrentChannel()
