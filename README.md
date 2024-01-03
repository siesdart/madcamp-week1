---
layout: post
title: "C.G.V"
subtilte: "Contact / Gallery / Variety (game)를 한 번에!"
date: 
background:
---

![logo.png](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/logo.png)

> C.G.V 는 Contact, Gallery, Variety의 약자로, 이용자에게 연락처, 갤러리, 게임 등의 기능을 통해 편리함과 즐거움을 제공하는 어플리케이션입니다.
> 

## 팀원

- 김선희

[sunnygeem](https://github.com/sunnygeem)

- 박현우

[siesdart](https://github.com/siesdart)

## 개발 환경

- Language: Dart
- Frontend: Flutter
- IDE: Android Studio, Visual Studio Code

## 프로젝트 설명

이 어플은 Tab 단위로 구성되어 있습니다.

![Untitled](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/Untitled.png)

### C: 연락처

![overview](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/Untitled%201.png)

overview

- 인터넷에서 가상의 샘플 json을 받아 화면에 연락처 목록을 보여줍니다.
- 상단의 검색 창을 통해 이름으로 연락처를 검색할 수 있습니다.
    
    ![flow: search contact](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/contact_search.gif)
    
    flow: search contact
    
- 목록 클릭 시 연락처 상세 화면으로 이동합니다.
    - 버튼 클릭 시 전화번호와 이메일에 맞게 각각 전화, 문자, 메일 앱을 자동으로 실행합니다.
        
        ![flow: navigate to another app](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/contact_detail_navigate.gif)
        
        flow: navigate to another app
        

### G: 갤러리

![overview](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/Untitled%202.png)

overview

- 전체 이미지와 함께 ‘Like’한 이미지를 따로 볼 수 있습니다.
    - 각 section 안에서 scroll view를 제공합니다.
        
        ![flow: scroll in each section](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/image_scroll.gif)
        
        flow: scroll in each section
        
- 이미지를 클릭하면 이미지 상세 화면을 볼 수 있습니다.
    
    ![flow: show image details](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/popup_image_detail.gif)
    
    flow: show image details
    
    - 이미지 상세 화면은 이미지 이름, 원본 비율의 사진, ‘Like’ 버튼으로 구성되어 있습니다.
    - ‘Like’ 버튼을 누르면, ‘Liked Image’ section에 곧바로 반영되는 것을 볼 수 있습니다.
        
        ![flow: press Like button](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/press_like.gif)
        
        flow: press Like button
        
    - 이미 ‘Like’한 이미지의 상세 화면에서는 ‘Unlike’ 버튼을 통해 ‘Liked Image’ section에서 해당 이미지를 제거할 수 있습니다.
        
        ![flow: press Unlike button](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/unlike_image.gif)
        
        flow: press Unlike button
        

### V: 게임

![overview](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/Untitled%203.png)

overview

![flow: play game](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/game_play.gif)

flow: play game

- 사칙 연산 게임을 제공합니다.
    - 상단 바를 통해 레벨과 레벨 내 현재 풀고 있는 문제 번호를 볼 수 있습니다.
    - ‘How to play’ 버튼을 눌러 게임 설명을 볼 수 있습니다.
    - ‘Enter your answer…’ 라는 hint 메시지가 적힌 text box 에 답을 입력할 수 있습니다.
        - 이용자가 입력한 답에 대한 팝업 메시지는 다음과 같습니다.
            
            ![Untitled](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/Untitled%204.png)
            
    - 레벨 3까지 모두 완료하거나, ‘Exit’ 버튼을 눌러 게임 결과 화면으로 이동할 수 있습니다.
        
        ![Untitled](C%20G%20V%2021ebab2b48cf426a80c4049e5fb2d366/Untitled%205.png)
        
        - 결과 화면에서는 (맞힌 문제 / 전체 문제) 비율, (문제 번호, 문제, 정답 여부, 이용자 입력 답, 실제 답) 바를 볼 수 있습니다.
        - 결과 화면에서 ‘Restart’ 버튼을 누르면, 게임을 다시 시작할 수 있습니다.

## .apk link
