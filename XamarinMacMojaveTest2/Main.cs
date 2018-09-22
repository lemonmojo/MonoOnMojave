using System.Runtime.InteropServices;

using AppKit;

namespace XamarinMacMojaveTest2
{
	static class MainClass
	{
		[DllImport("/System/Library/Frameworks/Cocoa.framework/Cocoa", EntryPoint = "NSApplicationLoad")]
		private static extern bool NSApplicationLoad();

		static void Main(string[] args)
		{
			NSApplicationLoad();

			NSApplication.Init();
			NSApplication.Main(args);
		}
	}
}