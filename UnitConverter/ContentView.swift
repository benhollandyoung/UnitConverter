//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ben Holland on 03/04/2022.
//

import SwiftUI


//TODO - add formatter for units
// add a done button to keyboard
// make an alternative version using units and measurement built in


struct UnitSet: Hashable {
    static func == (lhs: UnitSet, rhs: UnitSet) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    let name: String
    let units: [Unit]
    
}
struct Unit: Hashable, Equatable  {
    static func == (lhs: Unit, rhs: Unit) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    
    let name: String
    let writtenUnit: String
    let unit: Dimension
    
}


let massUnitSet = UnitSet(name: "Mass", units: mass)
let tempUnitSet = UnitSet(name: "Temp", units: temps)
let lengthUnitSet = UnitSet(name: "Length", units: lengths)

let unitTypes = [tempUnitSet, lengthUnitSet, massUnitSet]


let lengths = [
    Unit(name: "Meters", writtenUnit: "m", unit: UnitLength.meters),
    Unit(name: "Kilometers", writtenUnit: "km", unit: UnitLength.kilometers),
    Unit(name: "Feet", writtenUnit: "ft", unit: UnitLength.feet),
    Unit(name: "Yards", writtenUnit: "yd", unit: UnitLength.yards),
    Unit(name: "Miles", writtenUnit: "miles", unit: UnitLength.miles),
    Unit(name: "Inches", writtenUnit: "in", unit: UnitLength.inches)
   
]

let temps = [
    Unit(name: "Celsius", writtenUnit: "°C", unit: UnitTemperature.celsius),
    Unit(name: "Fahrenheit", writtenUnit: "°F", unit: UnitTemperature.fahrenheit),
    Unit(name: "Kelvin", writtenUnit: "K", unit: UnitTemperature.kelvin)

]

let mass = [
    Unit(name: "Kilogram", writtenUnit: "kg", unit: UnitMass.kilograms),
    Unit(name: "Pounds", writtenUnit: "lb", unit: UnitMass.pounds),
    Unit(name: "Stones", writtenUnit: "stone", unit: UnitMass.stones),
    Unit(name: "Short Tons", writtenUnit: "s. tons", unit: UnitMass.shortTons),
    Unit(name: "Metric Tons", writtenUnit: "m. tons", unit: UnitMass.metricTons),
    Unit(name: "Ounces", writtenUnit: "oz", unit: UnitMass.ounces)
    
]



struct ContentView: View {
    
    @State var currentUnitType: UnitSet = tempUnitSet
    @State var baseUnit: Unit = tempUnitSet.units[0]
    @State var newUnit: Unit = tempUnitSet.units[1]
    @State var baseValue: Double = 0.0
    
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                //Unit Type
                Section {
                    Picker("", selection: $currentUnitType) {
                        ForEach(unitTypes, id: \.self) {
                            Text($0.name)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Select your unit type")
                }
                
                //Base unit
                
                Section {
                    Picker("Base unit", selection: $baseUnit) {
                        ForEach(currentUnitType.units, id: \.self) {
                            Text($0.name)
                        }
                    }
                } header: {
                    Text("Select your base unit")
                }
                
                
                //New unit
                
                Section {
                    Picker("Base unit", selection: $newUnit) {
                        ForEach(currentUnitType.units, id: \.self) {
                            Text($0.name)
                        }
                    }
                } header: {
                    Text("Select your new unit")
                }
                
                //base value
                
                Section {
                    TextField("Initial value in \(baseUnit.unit)", value: $baseValue, format: .number)
                } header: {
                    Text("Base unit value")
                }
                
                
                //new value
                
                Section {
                    Text("\()")
                    
                    
                } header: {
                    Text("New unit value")
                }
                
                
                
            }
            .navigationTitle("Unit Converter")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
