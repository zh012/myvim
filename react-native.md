## Install

    brew install watchman
    brew install nvm
    echo 'source $(brew --prefix nvm)/nvm.sh' >> ~/.zshrc
    nvm install node
    npm install -g react-native-cli

## iOS

Install XCode from app store, run

    xcode-select --install

## Android

Here is a high level overview for what you need to do to get most of an Android environment setup and maintained.

Prerequisites (for Homebrew at a minimum, lots of other tools need these too):
- XCode is installed (via the App Store)
- XCode command line tools are installed (`xcode-select --install` will prompt up a dialog)
- Java

Install Homebrew:

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Make sure the doctor is happy (do what it tells you):

    brew doctor

Use Homebrew to install Android dev tools:

    brew install ant
    brew install maven
    brew install gradle
    brew install android-sdk
    brew install android-ndk

Install all of the Android SDK components (you will be prompted to agree to license info and then this will take a while to run):

    android update sdk --no-ui

Install HAXM for blazing fast emulators.  Check out the "Configuring VM Acceleration on Mac" section here: http://developer.android.com/tools/devices/emulator.html

    brew cask install intel-haxm

Update your environment variables:

    export ANT_HOME=/usr/local/opt/ant
    export MAVEN_HOME=/usr/local/opt/maven
    export GRADLE_HOME=/usr/local/opt/gradle
    export ANDROID_HOME=/usr/local/opt/android-sdk
    export ANDROID_NDK_HOME=/usr/local/opt/android-ndk

Update your paths (bonus points to a better solution to the hardcoded build tools version):

    export PATH=$ANT_HOME/bin:$PATH
    export PATH=$MAVEN_HOME/bin:$PATH
    export PATH=$GRADLE_HOME/bin:$PATH
    export PATH=$ANDROID_HOME/tools:$PATH
    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH

Periodically run these commands again to ensure you're staying up to date:

    brew update
    android update sdk --no-ui

* Note: It looks like there might be an issue with `brew update` and the android-sdk formula.

Install Eclipse, IntelliJ, Android Studio, or your other favorite IDE.

If everything goes smoothly on a moderate network connection you can expect this process to take 2-4 hours.
