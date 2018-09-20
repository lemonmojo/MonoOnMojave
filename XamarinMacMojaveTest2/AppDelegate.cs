using AppKit;
using Foundation;

using OutlineViewTestBinding;

namespace XamarinMacMojaveTest2
{
	[Register("AppDelegate")]
	public class AppDelegate : NSApplicationDelegate
	{
		LMOutlineViewTest outlineViewTest;

		public override void DidFinishLaunching(NSNotification notification)
		{
			outlineViewTest = new LMOutlineViewTest();
		}
	}
}