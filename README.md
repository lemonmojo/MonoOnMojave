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
- I think this demo shows that the problem is at the foundation of the mono runtime as the actual UI is created and shown by a native framework which runs just fine when consumed by a native app but shows all of the mentioned symptoms when consumed from a mono-based app
- I cannot reproduce any of the issues in a 10.14 VM. I can only reproduce this on actual hardware.

# Digging deeper
I think the problem is somehow related to how launch services activates the app. I think so because most problems are not visible when run from VS or from the console.

- Run the app by executing `XamarinMacMojaveTest2/bin/Debug/XamarinMacMojaveTest2.app/Contents/MacOS/XamarinMacMojaveTest2` (Working directory must be the repo root dir)
- In this case, the app is not activated (launched in background) and after activating manually everything runs smoothly
- If however launched with `open XamarinMacMojaveTest2/bin/Debug/XamarinMacMojaveTest2.app` the app is activated automatically and all the mentioned issues occur.
- Now, the `open` command also supports a parameter to disable activating the app. From the man page: `-g  Do not bring the application to the foreground.`
- If you launch the app like so `open -g XamarinMacMojaveTest2/bin/Debug/XamarinMacMojaveTest2.app` none of the issues occur.

# Videos

Here's the C# app:

![](Videos/Mono%20Mojave%20Bug%20Xamarin.gif)

And here comes the native app:

![](Videos/Mono%20Mojave%20Bug%20Xcode.gif)
