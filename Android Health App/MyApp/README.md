# Android App

This is my android app deliverable, which is designed as an informational health app.

## Running the interface

You will need to ensure you have the following:\
[Node.js (14.15.1 or later)](https://nodejs.org/en/)\
[Gradle (latest version)](https://gradle.org/)\
[JDK 1.8](https://www.oracle.com/uk/java/technologies/javase/javase-jdk8-downloads.html) as android studio requires it\
[Android Studio](https://developer.android.com/studio)
 (make sure you install the android SDK and an emulator when prompted during first time setup, and create a default project if necessary)

You will then need to set system environment variables for **JAVA_HOME** using your *JDK 1.8*, and **ANDROID_SDK_ROOT** pointing to your *Android SDK*. You should also add the **gradle binary** to your *path variable*. Once these are set, you will need to restart any open terminals for the changes to be reflected. For further guidance on how to set these, please refer to the cordova's official guide at the bottom of this section.

Once you have set these, run ```cd %ANDROID_HOME%/tools/bin``` and then ```./sdkmanager.bat --licenses``` and accept the licenses. These licenses are needed for cordova to run using the Android SDK binary.

Once this is all set up, run ```npm i``` in the 'MyApp' folder (within the 'Android Health App' folder) to install the necessary cordova files. All further cordova commands should be run from this folder.

You can then run ```npx cordova platform add android``` to install the necessary platform and plugin files.

Open the emulator in Android Studio using **Tools --> AVD manager**, and run ```npx cordova run android```, which will deploy the app to it. If any of the above steps have not been successfully completed, you will be told in the terminal which one caused the deployment to fail.

For further support or issues with any steps, please visit [cordova's official guide](https://cordova.apache.org/docs/en/10.x/guide/platforms/android/index.html). You should not have to perform any additional tasks other than those listed in this readme, even if they are listed in the official guide.

## Usage

You will start on the introduction page on the site. You can use the carousel at the bottom of this page, and use either button to go to the post list when ready. You can use any of the buttons on a post preview to view the contents of the post, and the button at the bottom of each page to go back to the post list. At any time, you can use toggle the navbar to navigate to another page.

Make sure to fully explore each page and the content it has to offer!

## Testing

After performing setup as above, you should already have the puppeteer files and node.js installed, and while in the 'MyApp' folder you can use ```npm run test``` to run the test script.

## Author and Support

This interface was designed and developed by Thomas Hesketh\
You can contact me at <ZFAC146@live.rhul.ac.uk>
