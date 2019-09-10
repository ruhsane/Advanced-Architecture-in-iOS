import UIKit

// Colleague protocol
protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

// Mediator protocol {
protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver
    
    var recipients: [ReceiverType] { get }
    
    func send(message: MessageType)
}

// Concrete base class implementation of Colleague protocol
class Peer: Receiver {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received: \(message)")
    }
}

// First Colleague class extending base Peer class
class Programmer: Peer {
    let expertise: String
    
    init(name: String, expertise: String) {
        
        //TODO: Complete init()
        self.expertise = expertise
        super.init(name: name)
    }
    
    override func receive(message: String) {
        print("\(name) received: \(message) for possible \(expertise) work")
    }
}

// Another Colleague class extending base Peer class
class Recruiter: Peer {
    
    //TODO: add custom property required
    let company: String
    
    init(name: String, company: String) {
        
        //TODO: Complete init()
        self.company = company
        super.init(name: name)
    }
    
    //TODO: Create and complete required function override
    override func receive(message: String) {
        print("\(name) received: \(message). I am a recruiter at \(company)")
    }
}

// Concrete implementation of Mediator protocol
final class MessageMediator: Sender {
    internal var recipients: [Peer] = []
    
    func add(recipient: Peer) {
        recipients.append(recipient)
    }
    
    func send(message: String) {
        for recipient in recipients {
            recipient.receive(message: message)
        }
    }
}

// Client
class SpamGenerator {
    func spamSpamSpamSpam(message: String, worker: MessageMediator) {
        worker.send(message: message)
    }
}

let messagesMediator = MessageMediator()
let spamGenerator = SpamGenerator()

let programmer0 = Programmer(name: "Hedy Lamar", expertise: "iOS Development")
let programmer1 = Programmer(name: "Michael Faraday", expertise: "Electrical Engineering")
let recruiter1 = Recruiter(name: "Queen Elizabeth I", company: "Apple")

messagesMediator.add(recipient: programmer0)
messagesMediator.add(recipient: programmer1)
messagesMediator.add(recipient: recruiter1)

spamGenerator.spamSpamSpamSpam(message: "I'd Like to Add you to my LinkedIn Network", worker: messagesMediator)

/* When successfully completed, the last line of the code will print:
 Hedy Lamar received: I'd Like to Add you to my LinkedIn Network for possible iOS Development work
 Michael Faraday received: I'd Like to Add you to my LinkedIn Network for possible Electrical Engineering work
 Queen Elizabeth I received: I'd Like to Add you to my LinkedIn Network. I am a recruiter at Apple
 */
