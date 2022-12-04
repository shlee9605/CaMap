# 0. Abstract

**This project is about public interest.**  
**This project started to seperate non-smokers from secondhand smoke.**  
This map displays Near Smoking Zone and Trash Can, thus, non-smokers can avoid certain area  
This app is made for koreans, using Naver Map API.  
But, I believe you can use it in foreign country, if you get used to using Google Map API instead.

I've got the area informaition from Seoul City hall,  
And I published this App via Google Play Store

## - Index  

[**1. File Structure**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#1-file-structure)  
[**2. Develop Environment**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#2-Develop-Environment)  
[**3. Getting Started**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#3-Getting-Started)  
[**4. Used Concept**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#4-Used-Concept)  
[**5. Usage Example**](https://github.com/shlee9605/CaMap/blob/Ver0.6/README.md#5-Usage-Example)  

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

## Platform
For : Android(current), IOS, Windows, Linux(not done)  
Used : Google Cloud, Firebase, Naver Cloud, Play Store, Google Admob  
**You Must Refer [My Notion(in Kor)](https://www.notion.so/shlee9605/959ac634936b4a96be20363bc153f53e) Together for Plugin Packages Description of This Project**  

## Configuration

### Setup
For Development OS, I used `Windows10`.  
Then, set your working space for flutter  
```console
> cd C:\Workspace
```

디렉토리 이동  
플러터 설치  
플러터 폴더 생성  

플러터 코드 실행  
no-sound-null-safety

## Package Management

```RAML
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  flutter_config: ^1.0.8 #for dotenv
  naver_map_plugin: ^0.9.6 #for naver map
    # git: https://github.com/LBSTECH/naver_map_plugin.git
  csv: ^5.0.0 #for reading csv
  google_mobile_ads: ^2.3.0 #for google ad
  geolocator: ^8.2.1  
```

### cupertino_icons
*****
flutter pub add cupertino_icons
*****
### flutter_config

### naver_map_plugin

### csv

### google_mobile_ads

### geolocator

### etc
라이브러리 설치 -비밀번호 암호화, 토큰 관리

flutter pub get 할 때 받는 파일들(명령어
내가 어떻게 썼는지(사용), 어떻게 쓰는지(설정)

# 3. Getting Started

	This project is a starting point for a Flutter application.
	
	A few resources to get you started if this is your first Flutter project:
	
	- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
	- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
	
	For help getting started with Flutter development, view the
	[online documentation](https://docs.flutter.dev/), which offers tutorials,
	samples, guidance on mobile development, and a full API reference.


run 명령어 등 시작하기
노션 참고하라고 써주고, 플러터 프로젝트 자체를 만드는 명령어나 구글 참고하는하는 내용만 적어주기
DB연동

최초 생성시 바꿔줘야할 내용?

# 4. Used Concept

CRUD구조 같은 거

# 5. Usage Example

프로그램 예시
