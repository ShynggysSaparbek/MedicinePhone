import UIKit
import CoreData

protocol MemoryAccess{
    static func getContext()->NSManagedObjectContext
    static func fetch<T: NSManagedObject>(_ type: T.Type, completion: (NSManagedObjectContext, [T]) -> ())
    static func create<T: NSManagedObject>(type: T.Type, setValue: (T)->Void)
}


final class MemoryManager: MemoryAccess{
    static func getContext()->NSManagedObjectContext{
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        return appDelegate.persistentContainer.viewContext
    }
    
    static func fetch<T: NSManagedObject>(_ type: T.Type,
                                          completion: (NSManagedObjectContext, [T]) -> ()){
        let context = getContext()
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        do {
            let result = try context.fetch(fetchRequest)
            completion(context, result)
        } catch {
            print("Error: Fetching of \(T.self) failed" )
        }
    }
    
    static func create<T: NSManagedObject>(type: T.Type,
                                           setValue: (T)->Void)
                                           {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "\(T.self)", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context) as! T
        
        //Setting value of object
        setValue(object)
        
        //Saving value
        do {
            try context.save()
        }catch{
            print("Failed to save object: \(object)")
        }
    }
}

/* extension MemoryManager{
    class phone {
        
        private static func create(number: String, completion: (NSManagedObjectContext, Phone)->()){
            MemoryManager.create(type: Phone.self,completion: completion) { (phone) in
                phone.setValue(number, forKey: "number")
            }
        }
        
        static func get() -> Phone? {
            var phoneNumber: Phone?
            fetch(Phone.self) { (context, result) in
                for object in result {
                    phoneNumber = object
                    return
                }
            }
            return phoneNumber
        }
        
        static func delete(){
            fetch(Phone.self) { (context, result) in
                for object in result {
                        context.delete(object)
                }
            }
        }
        
        static func set(number: String, verification: ((String)->Bool)?){
            if let verification = verification{
                guard verification(number) else { return }
            }
            
            self.delete()
            
            create(number: number) { (context, phone) in
                do {
                    try context.save()
                }catch{
                    print("Failed to Save Number")
                }
            }
            
        }
        static func isRegistred() -> Bool{
            var isRegistred = false
            fetch(Phone.self) { (context, result) in
                if result.count == 0 {
                    isRegistred = false
                }else{
                    isRegistred = true
                }
            }
            return isRegistred
        }
    }
}

extension MemoryManager{
    class location {
        
        private static func create(name: String,
                                   longitude: Double,
                                   latitude: Double,
                                   completion: (NSManagedObjectContext, Location)->()){
            MemoryManager.create(type: Location.self,completion: completion) { (location) in
                
                location.setValue(name, forKey: "name")
                location.setValue(longitude, forKey: "longitude")
                location.setValue(latitude, forKey: "latitude")
            }
        }
        
        static func get(by name: String) -> Location? {
            var location: Location?
            fetch(Location.self) { (context, result) in
                for object in result {
                    if object.name == name {
                        location = object
                        return
                    }
                }
            }
            return location
        }
        
        static func getAll()->[Location]{
            var locations: [Location] = []
            fetch(Location.self) { (context, result) in
                locations = result
            }
            return locations
        }
        
        static func deleteAll(){
            fetch(Location.self) { (context, result) in
                for object in result {
                    context.delete(object)
                }
            }
        }
        
        static func delete(by name: String){
            fetch(Location.self) { (context, result) in
                for object in result {
                    if object.name == name{
                        context.delete(object)
                        print("Location with name \(object.name!) was deleted")
                    }
                }
            }
        }

        
        static func add(name: String,
                        longitude: Double,
                        latitude: Double){
            //guard verification(name: name, latitude: latitude, longitude: longitude) else { return }
            create(name: name, longitude: longitude, latitude: latitude) { (context, location) in
                do {
                    try context.save()
                }catch{
                    print("Failed to Save Number")
                }
            }
        }
        
        static func isRegistred(by name: String) -> Bool{
            var isRegistred = false
            fetch(Location.self) { (context, result) in
                for object in result {
                    if object.name == name {
                        isRegistred = true
                        return
                    }
                }
            }
            return isRegistred
        }
        
        static func verification(name: String, latitude: Double, longitude: Double) -> Bool{
            guard let _ =  get(by: name) else {return false}
            
            if longitude > 180.0 || longitude < -180.0 {
                return false
            }
            
            if latitude > 90.0 || latitude < -90.0 {
                return false
            }
            
            return true
        }
        
        static func count()->Int{
            var sum = 0
            fetch(Location.self) { (context, result) in
                sum = result.count
            }
            return sum
        }
    }
}
*/
/*extension MemoryManager{
    class gender{
        private static func create(status: String, completion: (NSManagedObjectContext, Gender)->()){
            MemoryManager.create(type: Gender.self, completion: completion) { (gender) in
                gender.setValue(status, forKey: "status")
            }
        }
        
        static func get() -> Gender? {
            var gender: Gender? = nil
            fetch(Gender.self) { (context, result) in
                for object in result {
                    gender = object
                    return
                }
            }
            return gender
        }
        
        static func delete(){
            fetch(Gender.self) { (context, result) in
                for object in result {
                    context.delete(object)
                }
            }
        }
        
        static func set(status: String, verification: ((String)->Bool)?){
            if let verification = verification{
                guard verification(status) else { return }
            }
            
            self.delete()
            
            create(status: status) { (context, status) in
                do {
                    try context.save()
                }catch{
                    print("Failed to Save your gender")
                }
            }
        }
        
        static func isRegistred() -> Bool{
            var isRegistred = false
            fetch(Gender.self) { (context, result) in
                if result.count == 0 {
                    isRegistred = false
                }else{
                    isRegistred = true
                }
            }
            return isRegistred
        }
    }
}*/

/*extension MemoryManager{
    class profileImage{
        private static func create(data: Data, completion: (NSManagedObjectContext, ProfileImage)->()){
            
            MemoryManager.create(type: ProfileImage.self, completion: completion) { (profileImage) in
                let data = data as NSData
                profileImage.setValue(data, forKey: "data")
            }
        }
        
        static func get() -> ProfileImage? {
            var image: ProfileImage? = nil
            fetch(ProfileImage.self) { (context, result) in
                for object in result {
                    image = object
                    return
                }
            }
            return image
        }
        
        static func delete(){
            fetch(ProfileImage.self) { (context, result) in
                for object in result {
                    context.delete(object)
                }
            }
        }
        
        static func set(data: Data){
            self.delete()
            create(data: data) { (context, image) in
                do {
                    try context.save()
                }catch{
                    print("Failed to Save your image")
                }
            }
        }
        
        static func isRegistred() -> Bool{
            var isRegistred = false
            fetch(ProfileImage.self) { (context, result) in
                if result.count == 0 {
                    isRegistred = false
                }else{
                    isRegistred = true
                }
            }
            return isRegistred
        }
    }
}*/
