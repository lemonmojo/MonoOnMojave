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

# Notes
- Both sample apps are minimal in that they contain only a MainMenu.xib (which is even shared by both, the Xamarin and the native projects!)
- The MainMenu.xib doesn't contain a window; all UI elements except for the main menu are provided by the shared .framework
- The AppDelegate only instantiate the `LMOutlineViewTest` class from the shared framework which then does everything else that happens in the app (create the window, the outline view, setup the data model, etc.)

# Videos

Here's the C# app:

![](Videos/Mono%20Mojave%20Bug%20Xamarin.gif)

And here comes the native app:

![](Videos/Mono%20Mojave%20Bug%20Xcode.gif)
