# Nand2Tetris Study

- [From Nand to Tetris][nand2tetris_official_website]
- [밑바닥부터 만드는 컴퓨팅 시스템][nand2tetris_korean_book]

## 개발 환경

- 자바가 필요하다
- [Nand2Tetris > Software](https://www.nand2tetris.org/software)에서 **`Download the Nand2tetris Software Suite`** 를 다운로드한다.
  - `tools`: 시뮬레이터 등등
  - `projects`: 각 장을 실습하는데 필요한 파일들

> **NOTE** 참고로 이 저장소에서는 `projects` 파일 밑에 있는 파일들만 사용하고 툴은 따로 포함하지 않는다.

## 하드웨어 테스트

Nand2tetirs Software Suite에 포함된 하드웨어 시뮬레이터로 HDL로 작성한 칩을 테스트 할 수 있다.

### 필요한 소프트웨어

- HardwareSimulator.sh

### 테스트 방법

1. `HardwareSimulator.sh` 실행 (자바가 필요함)
2. `File > Load Chip` 를 선택하고, 로드할 칩의 `.hdl` 파일을 연다.
   - 참고로 시뮬레이터에서는 `.hdl` 파일을 편집할 수 없으므로 코드를 작성할 때는 별도의 텍스트 에디터를 사용해야 한다.
   - Visual Studio Code 사용 시, Extension으로 Nand2Tetris(hdl syntax highlighter)를 설치할 수 있다.
3. `File > Load Script` 를 선택하고, 테스트 스크립트 `.tst` 파일을 연다.
4. `Run > Run` 실행

   - 이 때, `.hdl` 파일과 `.cmp` 파일이 같은 폴더에 있어야 한다.
   - `Comparision ended successfully`가 표시되면 칩 테스트에 성공한 것
   - 참고: 맥 터미널에서 `.out` 파일과 `.cmp` 파일을 직접 비교하고 싶은 경우, diff 에서 다음 옵션을 사용하라.

     ```sh
     diff --strip-trailing-cr 01/Not.out 01/Not.cmp
     ```

## 1장: 불 논리

### 목표

이 장에서 소개된 모든 논리 게이트를 구현해 보자.

### 기본 논리 게이트

- [x] Not
- [x] And
- [x] Or
- [x] Xor
- [x] Mux
- [x] DMux

### 기본 게이트의 멀티비트 버전

- [x] Not16
- [x] And16
- [x] Or16
- [x] Mux16

### 기본 게이트의 다입력 버전

- [x] Or8Way
- [x] Mux4Way16
- [x] Mux8Way16
- [x] DMux4Way
- [x] DMux8Way

## 2장 불 연산

### 목표

이 장에서 소개된 모든 칩을 구현해 보자. 앞 장에서 설명했거나 만들어 보았던 칩들만 사용하자.

### 칩 목록

- [x] 반가산기: HalfAdder
- [x] 전가산기: FullAdder
- [x] 가산기: Add16
- [x] 증분기: Inc16
- [x] 산술 논리 연산 장치: ALU

## 3장 순차 논리

### 목표

이 장에서 설명한 칩들을 모두 만들어보자. 구성 블록으로 사용할 수 있는 것은 기초 DFF 게이트와, 그 칩에서 파생된 칩들, 그리고 앞 장에서 나온 칩들 뿐이다.

### 칩 목록

- [x] 1비트 레지스터: Bit
- [x] 레지스터: Register
- [x] 8-레지스터 메모리: RAM8
- [x] n-레지스터 메모리: RAM64, RAM512, RAM4K, RAM16K
- [x] 계수기: PC

## 4장 기계어

4장에서는 아래 두 가지 툴을 사용한다.

- `Assembler.sh`: Hack 어셈블리 프로그램을 2진 코드로 번역하는 어셈블러
- `CPUEmulator.sh`: Hack 플랫폼 상에서 2진 프로그램을 구동하는 CPU 에뮬레이터

### 과제

- [x] 곱셈 프로그램(Mult.asm)
- [x] I/O 조작 프로그램(Fill.asm)

## 5장 컴퓨터 아키텍쳐

프로젝트 목표: 최종 컴퓨터 칩을 만들어서 핵 컴퓨터 플랫폼을 완성한다.

### 과제

이 프로젝트에서 만들 컴퓨터 플랫폼은 4장의 핵 기계어로 작성된 프로그램을 실행할 수 있어야 한다. 여기에 나온 세 가지 프로그램을 컴퓨터 칩에서 활용해보자.

다음과 같은 순서로 컴퓨터를 구성한다.

- [x] 메모리 (Memory.hdl)
  - RAM16K (내장칩 사용)
  - 스크린 (내장칩 사용)
  - 키보드 (내장칩 사용)
- [x] CPU (CPU.hdl)
  - ALU와 레지스터를 이용하여 구현
- [x] 컴퓨터 칩 (Computer.hdl)
  - 앞에서 만든 메모리, CPU, 명령어 메모리(내장 `ROM32K`칩을 사용)으로 구성

## 6장 어셈블러

### 목표

> 핵 어셈블리 언어로 작성된 프로그램을 핵 하드웨어 플랫폼이 이해 가능한 2진 코드로 번역하는 어셈블러를 개발한다. 이 어셈블러는 6.2절에서 제시한 명세서대로 구현되어야 한다.

### 프로젝트

> ... 이 프로젝트는 6장 이후로 나오는 7개의 소프트웨어 개발 프로젝트 중 첫번째다. 하드웨어 프로젝트 때는 구현을 HDL로 했지만, 번역기(어셈블러, 가상머신, 컴파일러) 소프트웨어 프로젝트들은 다른 프로그래밍 언어를 이용해서 구현해도 된다.

그래서 이참에 한번 써보았다... [Rust](https://www.rust-lang.org/)

어셈블러는 [별도 저장소](https://github.com/soharu/hack_assembler)에서 개발하고, 이 저장소에 서브모듈로 추가했다.

#### 초기 설정

* [Rust 설치](https://www.rust-lang.org/tools/install)
* Git Submodule 설정
  * 초기 설정
   ```sh
   $ git submodule update --init
   ```
  * 업데이트
   ```sh
   $ git submodule update --remote
   ```

#### 테스트

테스트는 [사이트](https://www.nand2tetris.org/project06)에서 제공되는 입출력 파일(`.asm`, `.hack`)과 자체 구현한 핵 어셈블러의 결과가 동일한지 비교한다.

6장 프로젝트 디렉토리에는 이 작업을 편리하게 해주는 테스트 스크립트를 포함하고 있다.

```txt
06
├── test_all.bash
├── test_pong_with_no_symbols.bash
├── test_pong_with_symbols.bash
├── test_programs_with_no_symbols.bash
└── test_programs_with_symbols.bash
```

테스트 모두 실행하기

```sh
> cd 06
> ./test_all.sh
```

## 7장 가상 머신 I: 스택 산술

**목표** VM 번역기의 첫번째 부분을 먼저 만든다(두 번째 부분은 프로젝트 8에서 구현한다). 여기서는 *스택 산술* 명령과 *메모리 접근* 명령 구현에 초점을 맞춘다.

**과제** "VM 명세, 1부"(7.2절)과 "핵 플랫폼에서 표준 VM 매핑,1부"(7.3.1절)에 따라 VM-to-Hack 번역기를 작성하라.

**테스트 프로그램**

- 1단계: 스택 산술
  - [ ] `SimpleAdd`
  - [ ] `StackTest`
- 2단계: 메모리 접근
  - [ ] `BasicTest`
  - [ ] `PointerTest`
  - [ ] `StaticTest`

## History

- 2019년 11월 2일: 6장 과제 완료
- 2019년 9월 3일: 5장 과제 완료
- 2019년 7월 24일: 4장 과제 완료
- 2019년 6월 25일: 3장 과제 완료
- 2019년 6월 3일: 2장 과제 완료
- 2019년 5월 24일: 1장 과제 완료
- 2019년 5월 14일: [Nand2TetrisStudy](https://github.com/soharu/Nand2TetrisStudy) 저장소 생성
- 2019년 5월 7일: [TSG 멤버들](https://www.tuestudy.org/)과 스터디 시작
- 2019년 4월 14일: [밑바닥부터 만드는 컴퓨팅 시스템][nand2tetris_korean_book] 책 구입

[nand2tetris_official_website]: https://www.nand2tetris.org/
[nand2tetris_korean_book]: https://blog.insightbook.co.kr/2019/03/29/%EB%B0%91%EB%B0%94%EB%8B%A5%EB%B6%80%ED%84%B0-%EB%A7%8C%EB%93%9C%EB%8A%94-%EC%BB%B4%ED%93%A8%ED%8C%85-%EC%8B%9C%EC%8A%A4%ED%85%9C/
