# Yoga demo app

<img src="https://github.com/user-attachments/assets/d666dd35-8d15-402a-8d8d-ad40c3a2a51e"  width="30%" height="30%">
<img src="https://github.com/user-attachments/assets/8e32d2e1-1d8e-45fd-81db-ecce762cb8c3"  width="30%" height="30%">
<img src="https://github.com/user-attachments/assets/e694a709-080f-4f8f-bc87-5b5a4cf8d2e7" width="30%" height="30%">

## Screen recording
https://github.com/user-attachments/assets/cc7c0621-78b2-49f7-94a2-caae0e3ac782



YogaDemoApp – Project Context

Overview  
This project was developed as part of a technical assignment for Fitness22. The goal was to create a SwiftUI iOS app that presents a plan of yoga sessions based on data from a local JSON file. The app includes a tab-based navigation system, dynamic UI elements, and a responsive carousel.

Architecture  
Although MVVM was considered, I ultimately used a clean MVC approach to ensure speed and clarity given the time constraints. Responsibilities are clearly separated across models, views, and data services.

- Model: SessionItem.swift, SessionResponse.swift, Difficulty enum, ChapterName enum
- View: MyPlanView.swift, SessionsScreen.swift, SessionCardView.swift, MainTabView.swift
- Controller / Logic: SessionsScreen and SessionDataService (lightweight logic for data handling)

Features Implemented  
- Custom TabBar with selected/unselected icons  
- Reading and decoding local sessions.json using Codable  
- Sessions carousel using TabView with dynamic selection and scaling  
- Horizontal session index bar (scrollable, tappable, animated)  
- Dynamic content binding based on selected session  
- Clear session structure with author, quote, duration, and difficulty  
- Modular and reusable SwiftUI components  
- Background styling and hierarchy based on design provided  

Technologies Used  
- Swift 5  
- SwiftUI  
- Codable  
- Git + GitHub  
- Xcode 15  
- Local asset management via Asset Catalog  

Task Prioritization  
I focused on delivering the most visual and functional aspects of the app first. My priorities were:  
1. Implementing TabBar and view navigation  
2. Loading and decoding session data  
3. Building the carousel with session cards  
4. Matching the UI to the given design  
5. Keeping codebase readable and maintainable  
6. Using best practices where possible within the time limit  

AI Tool Usage  
While tools like Codex and Cursor were suggested, I used ChatGPT (OpenAI) throughout development for:  
- Clarifying SwiftUI syntax and patterns  
- Breaking down architecture decisions  
- Validating Codable structures  
- Generating this documentation  

Next Steps (if time allowed)  
- Refactor to full MVVM (with ViewModels and state management)  
- Add UserDefaults to track last completed session  
- Add custom animations for transitions and card interactions  
- Add session detail screen  
- Add persistent progress tracking and completion state  
- Improve accessibility support (VoiceOver, dynamic text)  
- Unit testing for JSON decoding and logic separation  
- Better error handling for file access and decoding  

GitHub  
The full source code is available at: https://github.com/ShaniHalali/YogaDemoApp
