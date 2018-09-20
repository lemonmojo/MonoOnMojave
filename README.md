# MonoOnMojave
Demonstrates various issues with Mono on macOS 10.14 Mojave

# Reproducing the issue
- Clone the repo
- Open `XcodeMacMojaveTest2.xcodeproj` in Xcode
- Build both targets (`XcodeMacMojaveTest2` and `OutlineViewTest`)
- The former is a sample application written in Objective-C while the latter is a framework that contains a small sample window with an `NSOutlineView`
- Open`XamarinMacMojaveTest2.sln` in Visual Studio for Mac
- The solution contains a binding project for the Objective-C framework and basically the same sample application written in C#
- Build and run the app
- Drag the app's icon to the macOS dock
- Quit the app
- Now run the app from the dock
- Try expanding the outline view nodes: Doesn't work
- Try entering full screen: Animation is incorrect/missing
- Sometimes you might also see strange artifacts when resizing the window
- Now try the same with the native app (drag to dock and run)
- The native app runs perfectly fine
