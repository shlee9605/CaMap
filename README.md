# Abstract

**This project is about public interest.**  
**This project started to seperate non-smokers from secondhand smoke.**  
This map displays Near Smoking Zone and Trash Can, thus, non-smokers can avoid certain area  
This app is made for koreans, using Naver Map API.  
But, I believe you can use it in foreign country, if you get used to using Google Map API instead.

I've got the area informaition from Seoul City hall,  
And I published this App via Google Play Store

# File Structure

```
.
├── android			    # android config
│   ├── .gradle		            # gradle config
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
├── ios
│   └── www                         # /bin/www: 앱 실행 파일
├── lib                             # DB를 사용하는 sequelize의 쿼리 함수용 폴더
│   ├── departmentDao.js
│   ├── deviceDao.js
│   └── userDao.js
├── linux                           # 자체 제작한 라이브러리 모음 폴더
│   ├── hashUtil.js                 # hash함수용 유틸
│   ├── logger.js                   # 로그처리용 유틸
│   ├── middleware.js               # 미들웨어 함수 모음
│   └── tokenUtil.js                # 토큰 처리용 함수 모음
├── macos                           # 로그 폴더
│   └── ...
├── test                            # DB를 모델링하는 sequelize의 모델 함수용 폴더
│   ├── connection.js               # DB연결 처리 함수
│   ├── department.js
│   ├── device.js
│   ├── index.js                    # sequelize를 이용한 DB설정 파일
│   └── user.js
├── web		                    # npm install후 생성되는 라이브러리 모음 폴더
│   └── ...
├── windows                         # express에서 생성한 정적파일 영역
│   ├── images
│   ├── javascripts
│   └── stylesheets
├── .dart_tool                          # Router 폴더
│   ├── auth.js
│   ├── department.js
│   ├── device.js
│   ├── index.js                    # Router 설정 인덱스 파일
│   └── user.js
├── .idea                         # 비즈니스 로직 폴더
│   ├── departmentService.js
│   ├── deviceService.js
│   └── userService.js
├── .vscode                           # express에서 생성한 프론트용 화면(사용하지 않음)
│   ├── error.ejs
│   └── index.ejs
├── assets                           # express에서 생성한 프론트용 화면(사용하지 않음)
│   ├── error.ejs
│   └── index.ejs
├── build                           # express에서 생성한 프론트용 화면(사용하지 않음)
│   ├── error.ejs
│   └── index.ejs
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
├── README.md
├── .env                            # (개발용)환경설정 파일(직접 생성)
├── .flutter-plugins                  # eslint 설정 파일
├── .flutter-plugins-dependencies     # eslint 설정 파일
├── .gitignore                      # eslint 설정 파일
└── camap.iml
```

# Develop Environment

개발환경 - 플랫폼 Android, IOS, Windows, Linux

환경설정

라이브러리 설치 -비밀번호 암호화, 토큰 관리

# Getting Started

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

# Used Concept

CRUD구조 같은 거

# Example

프로그램 예시
