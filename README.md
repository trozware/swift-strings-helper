# swift-strings-helper
A framework/library to make working with strings in Swift a bit easier. Because who can remember how to use `String.Index` and `Substring`?

### How to use as a framework:

* select the scheme you want: StringsHelper-iOS or StringsHelper-Mac.
* build the scheme.
* from Products, drag the required framework into the Embedded Binaries section of the General settings for your project, selecting selecting "Copy items if needed" and "Create groups".
* In your swift files, using `import StringsHelper_Mac` or  `import StringsHelper_iOS`
*  Check out the playground in the framework project for details of the included functions.

### How to use as plain Swift files:

* open this project folder in Finder.
* drag the Helpers folder into your own project, selecting "Copy items if needed" and "Create groups".
*  Check out the playground in the framework project for details of the included functions.



CocoaPODs and Carthage support may come, depending on the level of interest. Or I may be able to skip straight to supporting Swift Package Manager.

---

### Contributing to the project:

This is my first open-source project, so I am not totally confident of how it will go. But please star this repo, make comments, ask questions or make suggestions in the Issues tab and let me know if you see any problems.

* If you see a bug or can suggest an improvement but don't want to fix it yourself, please create an issue and I will look into it.

* If you want to contribute, please do so:

  * create your own fork
  * make your changes
  * add unit tests for your changes (testing is done against the Mac framework)
  * push
  * submit a pull request

* Don't be afraid that your suggestions will be flamed.

  