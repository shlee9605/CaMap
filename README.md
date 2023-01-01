# 0. Abstract
**Notion : [Flutter Naver Map](https://www.notion.so/shlee9605/Flutter-NaverMap-8b85ea7e488349e295868b07d104180e)**  
**This project is about public interest.**  
**This project started to seperate non-smokers from secondhand smoke.**  
This map displays Near Smoking Zone and Trash Can, thus, non-smokers can avoid certain area  
This app is made for koreans, using Naver Map API.  
But, I believe you can use it in foreign country, if you get used to using Google Map API instead.

I've got the area informaition from Seoul City hall,  
And I published this App via Google Play Store

## Index  

[**1. File Structure**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#1-file-structure)  
[**2. Develop Environment**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#2-Develop-Environment)  
[**3. Getting Packages**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#3-Getting-Packages)  
[**4. Setting Configuration**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#4-Setting-Configuration)  
[**5. Used Concept**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#5-Used-Concept)  
[**6. Usage Example**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#6-Usage-Example)  

## Undone Document
  
[**System Link with your DB(database)**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#system-link-with-your-dbdatabase)  
[**etc packages**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#etc)  
[**Used Concept**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#5-Used-Concept)  
  
# 1. File Structure

```
.
├── android			    # android config
│   ├── .gradle		            # gradle config
│   │   └── ...etc
│   ├── app
│   │   ├── src
│   │   │   ├── debug		    # debug manifest
│   │   │   ├── main		    # main manifest
│   │   │   │   ├── java
│   │   │   │   ├── kotlin
│   │   │   │   └── res		    # resources
│   │   │   │   │   ├── drawable
│   │   │   │   │   ├── mipmap	    # app icons
│   │   │   │   │   └── values
│   │   │   └── profile		    # profile manifest
│   │   ├── build.gradle	    # app/build.gradle
│   │   └── ...etc
│   ├── gradle
│   │   └── wrapper		    # gradle wrapper
│   ├── build.gradle
│   ├── key.properties		    # key properties
│   ├── local.properties	    # local properties
│   └── ...etc
├── ios				    # ios config
│   ├── Flutter			    # flutter ios config
│   │   └── ...etc
│   ├── Runner
│   │   ├── Assets.xcassets	    # app icons
│   │   ├── Base.lproj		    
│   │   ├── AppDelegate.swift
│   │   ├── Info.plist		    # ios runner config
│   │   └── ...etc
│   └── ...etc
├── lib                             # main function library
│   ├── custom_class		    # custom location classes
│   ├── services		    # minor services classes
│   └── main.dart		    # main
├── linux                           # linux cconfig
│   ├── flutter 	            # flutter linux config
│   │   └── ...etc
│   ├── CMakeLists.txt              # cmake config
│   ├── main.cc		            # main linux
│   ├── my_application.cc	    # main config
│   └── my_application.h            # my_application library
├── macos                           # 로그 폴더
│   ├── Flutter		   	    # flutter ios config
│   │   └── ...etc
│   ├── Runner
│   │   ├── Assets.xcassets	    # app icons
│   │   ├── Base.lproj		    
│   │   ├── AppDelegate.swift
│   │   ├── Info.plist		    # ios runner config
│   │   └── ...etc
│   └── ...etc
├── test                            # Unit, Function, Class, Widget, Total test
├── web		                    # Web config
│   ├── icons
│   ├── favicon.png
│   ├── index.html
│   └── ...etc
├── windows                         # Windows config
│   ├── flutter			    # flutter windows config
│   │   └── ...etc
│   ├── runner			    # runner in windows
│   │   └── ...etc
│   ├── CMakeLists.txt
│   └── ...etc
├── .dart_tool                      #  pub package folder
│   └── ...etc
├── .idea                           # IDE config
│   └── ...etc
├── .vscode                         # VS Code config
│   └── ...etc
├── assets                          # assets for program
│   ├── areas			    # location data in csv
│   └── markers			    # marker image icon in png
├── build                           # build outputs
│   └── ...etc
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml		    # pub library declare
├── README.md
├── .env                            # development config
├── .flutter-plugins
├── .flutter-plugins-dependencies
├── .gitignore                      # main config
└── camap.iml
```

# 2. Develop Environment

For : Android(current), IOS, Windows, Linux(not done)  
Used : Google Cloud, Firebase, Naver Cloud, Play Store, Google Admob  
**You Must Refer [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e) Together for Plugin Packages Description of This Project**  

## Setup
For Development OS, I used `Windows10`.  
Then, set your working space for flutter  
```console
> cd C:\Workspace
```
  
## Installation
You need to set up both Android Studio and Flutter  
Checkout [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e) for Installation in Windows  
You can also refer to [Google flutter documents](https://docs.flutter.dev/),  
which includes [Installation](https://docs.flutter.dev/get-started/install), [Lab](https://docs.flutter.dev/get-started/codelab), and [Cookbook](https://docs.flutter.dev/cookbook).
  
## Create Project
Create Your Project
```console
> flutter create "Project Name"
```
  
## Running Project
You can run your project via commands below

### default(release)
```console
> flutter run
> flutter run --release
```
  
If null safety error occurs,
```console
> flutter run --no-sound-null-safety
> flutter run --release --no-sound-null-safety
```
  
### Debug
In debugging mode,  

```console
> flutter run --debug
```
  
If null safety error occurs,
```console
> flutter run --debug --no-sound-null-safety
```

### Build
To publish your project, You need to build your project first.  
You can build your project through commands below.  
You can find your appbundle here : **`C:\Workspace\build\app\outputs\bundle\release`**  
*(Running flutter build defaults to a release build.)*

```console
> flutter build appbundle
> flutter build appbundle --release
> flutter build appbundle --debug
```  
  
If null safety error occurs,
```console
> flutter build appbundle --no-sound-null-safety
> flutter build appbundle --release --no-sound-null-safety
> flutter build appbundle --debug --no-sound-null-safety
```  
  
## System Link with your DB(database)
will be updated in ver 2.0  
  
# 3. Getting Packages
In `C:\Workspace\pubspec.yaml`,  

**Packages**
```RAML
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  flutter_config: ^1.0.8					#for dotenv
  naver_map_plugin: ^0.9.6 					#for naver map
    # git: https://github.com/LBSTECH/naver_map_plugin.git	#for latest version of naver map
  csv: ^5.0.0 							#for reading csv
  google_mobile_ads: ^2.3.0 					#for google ad
  geolocator: ^8.2.1  
```
  
## cupertino_icons

### Installation
The following adds the Cupertino Icons font to your application.  
Use with the CupertinoIcons class for iOS style icons.  

```console
> flutter flutter pub add cupertino_icons  
```  
  
## flutter_config

### Installation
This allows you to use `.env` files. 

```console
> flutter flutter pub add flutter_config  
```  
  
### Configuration
For this project, You need to setup variables below in your `C:\Workspace\.env`.  
Create `.env` file in your `C:\Workspace`, then setup like below.  
*You must get your ID's from cloud platform first.*  
```
YOUR_CLIENT_ID_HERE = "Naver Client ID"
YOUR_APPLICATION_ID_HERE = "Google Admob Application ID"
```
  
### Usage
After setting up your `.env`, we will use them in `C:\Workspace\android\app\src\main\AndroidManifest.xml`  
```xml
...
 <application
        android:label="CaMap"
        android:name="${applicationName}"
        android:icon="@mipmap/camap_icon">
        <meta-data
            android:name="com.naver.maps.map.CLIENT_ID" 
            android:value="@string/YOUR_CLIENT_ID_HERE" />
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="@string/YOUR_APPLICATION_ID_HERE" />
        <activity
...
```
  
## naver_map_plugin

### Installation
This allows you to use Naver API via naver_map_plugin.  

```console
> flutter flutter pub add naver_map_plugin  
```  
  
Because this plugin requires lots of information about naver cloud platform,  
I wrote detailed manual about this plugin in [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e#1f80ba301cd74cc6b3f46a7a1b1fffa3).  
  
## csv

### Installation
This allows you to read csv files in flutter.  

```console
> flutter flutter pub add csv  
```  
  
### Configuration
For this project, You need to setup csv files in your asset folders `C:\Workspace\assets\areas`.  
Move your `csv` files which contains location coordinate data.  
csv file must include information of location name(id), latitude, and longitude.  

Below shows you some of examples of csv contents.  
```
1-1,37.50375605,127.0241095
1-2,37.48276664,127.0349496
1-3,37.48124455,127.0361898
...
```
  
### Usage
Below code shows example how I applied in this project
```dart
class SmokingAreaData {
  //for smoking area
  static List<List<dynamic>>? csvData;

  //read csv data from assets/areas
  static Future<List<List<dynamic>>> processCsv() async {
    var result = await rootBundle.loadString(
      "assets/areas/Seocho_SmokingArea.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  //return as list of custom marker, using csv data
  static Future<List<AreaType>> markers() async {
    List<AreaType> areas = [];
    csvData = await processCsv();

    //add in area list using which gives you areatype
    for (List<dynamic> lt in csvData!) {
      areas.add(SmokingArea(aid: lt[0], location: LatLng(lt[1], lt[2])));
    }
    
    return areas;
  }
}
```
  
## google_mobile_ads

### Installation
This allows you to use google mobile ad banner in organized form/widget.  

```console
> flutter flutter pub add google_mobile_ads  
```  
  
I also had to write manual in [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e#1f80ba301cd74cc6b3f46a7a1b1fffa3),  
since this plugin also requires lots of information about google cloud platform, firebase, and Admob  
  
  
## geolocator

### Installation
This gives you exact coordinates about your location  
  
```console
> flutter flutter pub add geolocator  
```  
  
### Configuration
  Will be updated in Ver 1.0
  
### Usage
  Will be updated in Ver 1.0
  
## etc
라이브러리 설치 -비밀번호 암호화, 토큰 관리
  
  
# 4. Setting Configuration
Create your `.gitignore` file in `C:\Workspace`, then setup like below.  
In `C:\Workspace\.gitignore`,  
  
```
.env
assets/
/android/key.properties
/android/app/camap.jks
/android/app/proguard-rules.pro
...       # default .gitignore for flutter  
```
  
## dotenv configuration
  
We have already discuss about using dotenv configuration above.  
Please note [flutter_config](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#flutter_config)
  
## assets configuration
  
In `C:\Workspace\pubspec.yaml`,  

**Assets**
```RAML
flutter:
  uses-material-design: true

  assets:
  - assets/markers/ 	#for marker location in csv
  - assets/areas/ 	  #for marker image icon in png
```
  
Then, make assets/markers & assets/areas folder in `C:\Workspace`.  
  
## keystore configuration
  
keystore configuration requires basic knowledge about key signing.
Check out [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e#a575498637cf4011b617deda1e9cfd72)  
  
## proguard configuration
  
proguard configuration requires basic knowledge about multidex support.  
Check out either [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e#8a23338df33c40a9b3aa377f048ca3b8) or [Google flutter documents](https://docs.flutter.dev/deployment/android#enabling-multidex-support).  
  
  
# 5. Used Concept
  
CRUD구조 같은 거
  
# 6. Usage Example
  
![KakaoTalk_20221231_201128037](https://user-images.githubusercontent.com/40204622/210134636-5f8ae4ad-62cf-491f-9c65-34100bd690d7.jpg)  
  
![KakaoTalk_20221231_201232764](https://user-images.githubusercontent.com/40204622/210134637-baa8027a-05a8-447c-99b7-4afb3cb607fa.jpg)  
  
  
