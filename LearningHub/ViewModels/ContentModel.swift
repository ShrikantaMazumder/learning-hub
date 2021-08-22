//
//  ContentModel.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 21/8/21.
//

import Foundation

class ContentModel: ObservableObject {
    // all module list
    @Published var modules = [Module]()
    // find current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Find current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    // Current lesson explanation
    @Published var lessonExplanation = NSAttributedString()
    
    @Published var currentContentSelected: Int?
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: - Get local data
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // Log error
            print("Couldn't parse style data")
        }
        
    }
    
    // MARK: - Module Navigation method
    func beginModule(_ moduleId: Int) {
        // Find the index for the module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    
    // MARK: - Current Lesson
    func beginLesson(_ lessonId: Int) {
        if lessonId < currentModule!.content.lessons.count {
            currentLessonIndex = lessonId
        } else {
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonExplanation = addStyle(htmlString: currentLesson!.explanation)
    }
    
    // MARK: - Has next lesson
    var hasNextLesson: Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    // MARK: - Next lesson
    func nextLesson() {
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
            // set next lesson
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonExplanation = addStyle(htmlString: currentLesson!.explanation)
        } else {
            // reset current lesson
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    // MARK: - Add style
    private func addStyle(htmlString:String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        // add the styling data
        if let style = styleData {
            data.append(style)
        }
        // add html data
        data.append(Data(htmlString.utf8))
        
        //convwer to attributed string
        
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                
                resultString = attributedString
            }
        
        
        
        return resultString
    }
    
}
