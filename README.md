#App model v2.0 preview: Microsoft Azure Active Directory Native Client for iOS (iPhone)


This sample shows how to build an iOS application that calls a web API that requires a Work Account for authentication. This sample uses the Active Directory authentication library for iOS to do the interactive OAuth 2.0 authorization code flow with public client.


## Quick Start

Getting started with the sample is easy. It is configured to run out of the box with minimal setup. If you'd like a more detailed walkthrough including how to setup the REST API and register an Azure AD Directory follow the walk-through here.

### Step 1:Register an app

First, create an app in the [App Registration Portal](https://apps.dev.microsoft.com)

Make sure to:

- Add the **Mobile Application* platform for your app.
- Enter the correct **Redirect URI**. The default for this sample is `urn:ietf:wg:oauth:2.0:oob`.
- Leave the **Allow Implicit Flow** checkbox enabled. 

Copy down the **Application ID** that is assigned to your app, you'll need it shortly. 

### Step 2: Download the iOS v2 Native Client Sample code

* `$ git clone https://github.com/AzureADQuickStarts/AppModelv2-WebAPI-nodejs.git`

### Step 3: Download Cocoapods (if you don't already have it)

CocoaPods is the dependency manager for Swift and Objective-C Cocoa projects. It has thousands of libraries and can help you scale your projects elegantly. To install on OS X 10.9 and greater simply run the following command in your terminal:

`$ sudo gem install cocoapods`

### Step 4: Build the sample and pull down ADAL for iOS automatically

Run the following command in your terminal:

`$ pod install`

This will download and build ADAL for iOS for you and configure your Microsoft Tasks B2C.xcodeproj to use the correct dependencies.

You should see the following output:

```
$ pod install
Analyzing dependencies

Pre-downloading: `ADALiOS` from `https://github.com/AzureAD/azure-activedirectory-library-for-objc.git`, branch `convergence`
Downloading dependencies
Installing ADALiOS (3.0.0-pre.2)
Generating Pods project
Integrating client project

[!] Please close any current Xcode sessions and use `Microsoft Tasks.xcworkspace` for this project from now on.
```
### Step 5: Run the application in Xcode

Launch XCode and load the `Microsoft Tasks.xcworkspace` file. The application will run in an emulator as soon as it is loaded.


### Step 6. Determine what your Redirect URI will be for iOS

In order to securely launch your applications in certain SSO scenarios we require that you create a **Redirect URI** in a particular format. A Redirect URI is used to ensure that the tokens return to the correct application that asked for them.

The iOS format for a Redirect URI is:

```
<app-scheme>://<bundle-id>
```

- 	**aap-scheme** - This is registered in your XCode project. It is how other applications can call you. You can find this under Info.plist -> URL types -> URL Identifier. You should create one if you don't already have one or more configured.
- 	**bundle-id** - This is the Bundle Identifier found under "identity" un your project settings in XCode.

An example would be: ***mstodo://com.microsoft.windowsazure.activedirectory.samples.microsofttasks***

### Step 7: Configure the settings.plist file with your Web API information

You will need to configure your application to work with the Azure AD tenant you've created. Under "Supporting Files"you will find a `settings.plist` file. It contains the following information:

```XML

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>authority</key>
	<string>https://login.microsoftonline.com/common/oauth2/v2.0</string>
	<key>clientId</key>
	<string>*your client ID*</string>
	<key>scopes</key>
	<array>
		<string>https://graph.microsoft.com/mail.read</string>
	</array>
	<key>additionalScopes</key>
	<array/>
	<key>redirectUri</key>
	<string>urn:ietf:wg:oauth:2.0:oob</string>
	<key>response_mode</key>
	<string>form_post</string>
	<key>prompt</key>
	<string></string>
	<key>login_hint</key>
	<string></string>
	<key>taskWebAPI</key>
	<string>*your web API you wish to access*</string>
	<key>fullScreen</key>
	<false/>
	<key>showClaims</key>
	<true/>
</dict>
</plist>
```

Replace the information in the plist file with your Web API settings.

##### NOTE

The current defaults are set up to work with our [Azure Active Directory Sample REST API Service for Node.js v2](https://github.com/AzureADQuickStarts/AppModelv2-WebAPI-nodejss). You will need to specify the clientID of your Web API, however. If you are running your own API, you will need to update the endpoints as required.
