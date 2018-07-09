//: Playground - noun: a place where people can play

import Cocoa


struct Student {
    var name: String?
    var age: Int?
    
    func study() {
        print("Student's name of \(self.name ?? "No Student Name"): Studying")
    }
    
    mutating func changeMyName(newName: String?) {
        self.name = newName
    }
    
    init(_ name: String?,_ age: Int?) {
        self.name = name
        self.age = age
    }
}

var std0 = Student("Mary", 32)
std0.study()
std0.name = "Bob"
std0.study()

var std1 = std0
std1.name = "Jenny"
std0.study()
std1.study()


class Teacher {
    var name: String?
    var age: Int?
    
    init(name: String?, age: Int?) {
        self.name = name
        self.age = age
    }
    
    func teach() {
        print("Teacher's name of \(self.name ?? "No Student Name"): Studying")
    }
    
    var isSuitable: Bool {
        if let age = self.age {
            return (age > 35 && age < 50)
        }
        return false
    }
}

var teacher0 = Teacher(name: "Flame", age: 32)
print("is suitable: \(teacher0.isSuitable)")

class Chinese {
    var name: String?
}

class English {
    var age: Int?
}


var myName: String?
do {
    try myName!.description
} catch Pattern {
    print
}
