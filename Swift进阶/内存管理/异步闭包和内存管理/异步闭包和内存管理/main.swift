//
//  main.swift
//  异步闭包和内存管理
//
//  Created by Enrica on 2018/11/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

import Foundation

// MARK: - 类的循环引用

example(of: "Weak Reference") {
    
    class Tutorial {
        let title: String
        
        // 一个Tutorial实例并不总是会拥有一个
        // Editor实例，所以我们这里使用弱引用
        weak var editor: Editor?
        
        init(title: String) {
            self.title = title
        }
        
        // Swift在自动调用析构器deinitializer之前，
        // 会从内存中释放对象，并且设置其引用计数器为0
        deinit {
            print("Goodbye Tutorial \(title)!")
        }
    }
    
    class Editor {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Editor \(name)!")
        }
    }
    
    // 我们使用一个do语句，将Tutorial和Editor实例
    // 放在它里面，一旦代码执行完毕，它们就会被释放
    do {
        let tutorial = Tutorial(title: "Memory management")
        let editor = Editor(name: "Ray")
        tutorial.editor = editor
        editor.tutorials.append(tutorial)
    }
}


example(of: "Unowned Reference") {
    
    class Tutorial {
        let title: String
        
        // Tutorial一定是有作者的，因此不能将其声明为
        // 弱引用，可以将其声明为无主引用
        unowned let author: Author
        weak var editor: Editor?
        
        init(title: String, author: Author) {
            self.title = title
            self.author = author
        }
        
        deinit {
            print("Goodbye Tutorial \(title)!")
        }
    }
    
    class Editor {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Editor \(name)!")
        }
    }
    
    class Author {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodby Author \(name)!")
        }
    }
    
    do {
        let editor = Editor(name: "Ray")
        let author = Author(name: "Cosmin")
        let tutorial = Tutorial(title: "Memory management",
                                author: author)
        author.tutorials.append(tutorial)
        tutorial.editor = editor
        editor.tutorials.append(tutorial)
    }
}


// MARK: - 闭包的循环引用

example(of: "Capture lists") {
    
    class Tutorial {
        let title: String
        unowned let author: Author
        weak var editor: Editor?
        
        init(title: String, author: Author) {
            self.title = title
            self.author = author
        }
        
        deinit {
            print("Goodbye Tutorial \(title)!")
        }
        
        // 在这个闭包中，我们使用self.author.name捕获了
        // Tutorial实例对象。也就是说，我们在Tutorial实
        // 例对象和闭包之间创建了一个循环引用，因此Tutorial
        // 的deinit方法不会被调用
        lazy var createDescription: () -> String = {
            
            return "\(self.title) by \(self.author.name)"
        }
    }
    
    class Editor {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Editor \(name)!")
        }
    }
    
    class Author {
        let name: String
        var tutorials: [Tutorial] = []
        
        init(name: String) {
            self.name = name
        }
        
        deinit {
            print("Goodbye Author \(name)!")
        }
    }
    
    do {
        let author = Author(name: "Cosmin")
        let tutorial = Tutorial(title: "Memory management", author: author)
        
        // 在这里调用了createDescription()方法
        print(tutorial.createDescription())
        
        let editor = Editor(name: "Ray")
        author.tutorials.append(tutorial)
        tutorial.editor = editor
        editor.tutorials.append(tutorial)
    }
}
