//
//  DummyDataGenerator.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 21/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class DummyDataGenerator {
    
    func getEmployeeData() -> [EmployerHomeModel] {
        var employee: [EmployerHomeModel] = [EmployerHomeModel]()
       
        employee.append(EmployerHomeModel(name:"John Smith", desc: "Chef", image: UIImage(named: "waiter1")! ,location: "Wimbledon, London", salary: "17.50ph"))
        
        employee.append(EmployerHomeModel(name:"Sam Dickinson", desc: "Waiter", image: UIImage(named: "waiter3")!,location: "Hackney, London", salary: "£11.50ph"))
        
        employee.append(EmployerHomeModel(name:"Lara White", desc: "Waitress", image: UIImage(named: "waiter2")!,location: "Camden, London", salary: "£12.00ph"))
        
        employee.append(EmployerHomeModel(name:"Josefine Brown", desc: "Chef", image: UIImage(named: "chef1")!,location: "Richmond, London", salary: "£20.00ph"))
        
        employee.append(EmployerHomeModel(name:"Daniel Williams", desc: "Chef", image: UIImage(named: "chef2")!,location: "Kingston, London", salary: "£15.50ph"))
        
        employee.append(EmployerHomeModel(name:"Michael Williams", desc: "Barman", image: UIImage(named: "barman1")!,location: "Surbiton, London", salary: "£9.50ph"))
        
        employee.append(EmployerHomeModel(name:"Anna Dallas", desc: "Barista", image: UIImage(named: "barista1")!,location: "Bromley, London", salary: "£10.50ph"))
        
        employee.append(EmployerHomeModel(name:"Benjamin Stolls", desc: "Chef", image: UIImage(named: "chef")!,location: "Greenwich, London", salary: "£9.50ph"))

        return employee
    }
    
    func getEmployerData() -> [EmployerHomeModel] {
    var employer: [EmployerHomeModel] = [EmployerHomeModel]()
        
        employer.append(EmployerHomeModel(name:"Cote Brasserie", desc: "Chef", image: UIImage(named: "cotebrasserie")! ,location: "Wimbledon, London", salary: "17.50ph"))
        
        employer.append(EmployerHomeModel(name:"Pret A Manger", desc: "Waiter", image: UIImage(named: "pretamanger")!,location: "Hackney, London", salary: "£11.50ph"))
        
        employer.append(EmployerHomeModel(name:"Riverside Vegetaria", desc: "Waitress", image: UIImage(named: "riversidevegetaria")!,location: "Kingston, London", salary: "£12.00ph"))
        
        employer.append(EmployerHomeModel(name:"Al Forno", desc: "Chef", image: UIImage(named: "alforno")!,location: "Kingston, London", salary: "£20.00ph"))
        
        employer.append(EmployerHomeModel(name:"Naturally Chinese", desc: "Chef", image: UIImage(named: "naturallychinese")!,location: "Surbiton, London", salary: "£15.50ph"))
        
        employer.append(EmployerHomeModel(name:"The French Table", desc: "Barman", image: UIImage(named: "thefrenchtable")!,location: "Surbiton, London", salary: "£9.50ph"))
        
        employer.append(EmployerHomeModel(name:"Costa Coffee", desc: "Barista", image: UIImage(named: "costa")!,location: "Surbiton, London", salary: "£10.50ph"))
        
        employer.append(EmployerHomeModel(name:"Pink Garlic", desc: "Chef", image: UIImage(named: "pinkgarlic")!,location: "Norbiton, London", salary: "£9.50ph"))
    return employer
    
    }
    
    func getMyAdsData() -> [MyAdsModel] {
        var ad: [MyAdsModel] = [MyAdsModel]()
        // Make some adds
        
        
        ad.append(MyAdsModel(image: UIImage(named: "costa"), name: "Costa Coffee", position: "Chef", date: "10/05/2020", shift: "7:00 till 17:00", pay: "£10.50ph", applicants: [EmployerHomeModel(name: "Josefine Brown", desc: "Chef", image: UIImage(named: "chef1"), location: "Richmond, London", salary: "£20.00ph"), EmployerHomeModel(name: "John Smith", desc: "Chef", image: UIImage(named: "waiter1"), location: "Wimbledon, London", salary: "£17.50ph")]))
        
        ad.append(MyAdsModel(image: UIImage(named: "costa"), name: "Costa coffee", position: "Waiter", date: "23/05/2020", shift: "9:00 till 18:00", pay: "£11.00ph", applicants: [EmployerHomeModel(name:"Sam Dickinson", desc: "Waiter", image: UIImage(named: "waiter3")!,location: "Hackney, London", salary: "£11.50ph"), EmployerHomeModel(name:"Lara White", desc: "Waitress", image: UIImage(named: "waiter2")!,location: "Camden, London", salary: "£12.00ph"), EmployerHomeModel (name:"Michael Williams", desc: "Barman", image: UIImage(named: "barman1")!,location: "Surbiton, London", salary: "£9.50ph") ]))
        
        
        return ad
    }
    
    func getMyJobsData() -> [MyJobsModel] {
    var job: [MyJobsModel] = [MyJobsModel]()
        job.append(MyJobsModel(image: UIImage(named: "cotebrasserie")!,name:"Cote Brasserie", position: "Chef", location: "London", shift: "25/05/2020", status: "Hired", date: "9am till 6pm", pay: "£17.50ph"))
        
        job.append(MyJobsModel(image: UIImage(named: "costa")!,name:"Costa Coffee", position: "Chef", location: "London", shift: "25/05/2020", status: "Hired", date: "9am till 6pm", pay: "£17.50ph"))
        
        job.append(MyJobsModel(image: UIImage(named: "pretamanger")!,name:"Pret A Manger", position: "Chef", location: "London", shift: "25/05/2020", status: "Hired", date: "9am till 6pm", pay: "£17.50ph"))
        
        
        
        return job
    }
    
    func getApplicantsData()-> [EmployerHomeModel] {
    var applicant: [EmployerHomeModel] = [EmployerHomeModel]()
        
        applicant.append(EmployerHomeModel(name:"Cote Brasserie", desc: "Chef", image: UIImage(named: "cotebrasserie")! ,location: "Wimbledon, London", salary: "17.50ph"))
        
        return applicant

    
    }
        

}



