# C.G.V

Contact / Gallery / Variety (game)를 한 번에!

---

![logo](https://github.com/siesdart/madcamp-week1/assets/91830035/2a2d5a39-f0b5-46af-9bff-50df9dd7ada5)

> C.G.V 는 Contact, Gallery, Variety의 약자로, 이용자에게 연락처, 갤러리, 게임 등의 기능을 통해 편리함과 즐거움을 제공하는 어플리케이션입니다.



## 👨‍💻 팀원
|이름|소속|Github|
|---|---|---|
|김선희|한양대학교 컴퓨터소프트웨어학부|https://github.com/sunnygeem|
|박현우|카이스트 전산학부|https://github.com/siesdart|


## 🖥️ 개발 환경
- Language: Dart
- Frontend: Flutter
- IDE: Android Studio, Visual Studio Code



## 📝 프로젝트 설명
이 어플은 Tab 단위로 구성되어 있습니다.
![tab bar](https://github.com/siesdart/madcamp-week1/assets/91830035/4ef75adc-337f-47f7-abaa-8f75d1286802)


### 📞 연락처
**[overview]**
![contact overview](https://github.com/siesdart/madcamp-week1/assets/91830035/bed17ec9-027b-4458-83bb-62ba60883297)

**[flow]**
<p align="center">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/b3a18445-2478-444b-a44a-669e123adc5d" width="30%">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/8fe53027-647b-43a6-bc3a-117bd4890894" width="30%">
</p>

**[기능]**
- 인터넷에서 가상의 샘플 json을 받아 화면에 연락처 목록을 보여줍니다.
- 상단의 검색 창을 통해 이름으로 연락처를 검색할 수 있습니다.
- 목록 클릭 시 연락처 상세 화면으로 이동합니다.
    - 버튼 클릭 시 전화번호와 이메일에 맞게 각각 전화, 문자, 메일 앱을 자동으로 실행합니다.


### 🖼️ 갤러리
**[overview]**
![gallery overview](https://github.com/siesdart/madcamp-week1/assets/91830035/70e82132-86e0-46f5-9ff2-7aa3879416c7)

**[flow]**
<p align="center">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/a1c16ea6-b513-49c5-88fc-e090da1d79be" width="30%">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/c0a9cd97-eacc-47fc-834c-4f3ef6e0a1d7" width="30%">
</p>
<p align="center">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/d63a54f1-b16f-49d0-ad68-5807f169c57e" width="30%">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/02e48d92-f529-4637-99e6-44af31cea4da" width="30%">
</p>

**[기능]**
- 전체 이미지와 함께 ‘Like’한 이미지를 따로 볼 수 있습니다.
  - 각 section 안에서 scroll view를 제공합니다.
- 이미지를 클릭하면 이미지 상세 화면을 볼 수 있습니다.
  - 이미지 상세 화면은 이미지 이름, 원본 비율의 사진, ‘Like’ 버튼으로 구성되어 있습니다.
  - ‘Like’ 버튼을 누르면, ‘Liked Image’ section에 곧바로 반영되는 것을 볼 수 있습니다.
  - 이미 ‘Like’한 이미지의 상세 화면에서는 ‘Unlike’ 버튼을 통해 ‘Liked Image’ section에서 해당 이미지를 제거할 수 있습니다.


### 🎮 게임
**[overview]**
![game overview](https://github.com/siesdart/madcamp-week1/assets/91830035/4fc5b6e6-14bc-4f88-88f5-df4758d6a726)

**[flow]**
<p align="center">
    <img src="https://github.com/siesdart/madcamp-week1/assets/91830035/e5699812-cf6b-4c6f-8259-75bc583fff45" width="30%">
</p>

**[기능]**
- 사칙 연산 게임을 제공합니다.
  - 상단 바를 통해 레벨과 레벨 내 현재 풀고 있는 문제 번호를 볼 수 있습니다.
  - ‘How to play’ 버튼을 눌러 게임 설명을 볼 수 있습니다.
  - ‘Enter your answer…’ 라는 hint 메시지가 적힌 text box 에 답을 입력할 수 있습니다.
    - 이용자가 입력한 답에 대한 팝업 메시지는 다음과 같습니다.
      ![game popup](https://github.com/siesdart/madcamp-week1/assets/91830035/ad8940ba-c435-4830-8c38-49592ff89cbd)
  - 레벨 3까지 모두 완료하거나, ‘Exit’ 버튼을 눌러 게임 결과 화면으로 이동할 수 있습니다.
    ![game result](https://github.com/siesdart/madcamp-week1/assets/91830035/b1f51d65-d230-49fc-b6be-047dbd85ed36)
    - 결과 화면에서는 (맞힌 문제 / 전체 문제) 비율, (문제 번호, 문제, 정답 여부, 이용자 입력 답, 실제 답) 바를 볼 수 있습니다.
    - 결과 화면에서 ‘Restart’ 버튼을 누르면, 게임을 다시 시작할 수 있습니다.



## apk 파일
https://github.com/siesdart/madcamp-week1/raw/main/app-release.apk
