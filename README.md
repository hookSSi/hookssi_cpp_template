[![Build Status](https://travis-ci.org/hookSSi/sample.svg?branch=main)](https://travis-ci.org/hookSSi/sample)

# 만든 목적
Ashblue 라는 개발자분 처럼 git 프로젝트를 관리해보려고 시도하는 저장소

덤으로 쉽게 할 수 있다면 템플릿의 느낌으로 정리하고 싶다.

# 환경 만드는 법
## commitizen 

커밋 메시지의 템플릿을 제공하는 것

1. npm 설치
2. npm install commitizen -g
3. npm init --yes (다른 저장소의 package.json 가져와 작성하여 npm install을 이용해 4를 건너뛰는 방법도 있다.)
4. commitizen init cz-conventional-changelog --save-dev --save-exact
5. git cz를 통해 커밋 작성


## travis-ci

pull request 시 자동으로 테스트 -> 빌드 를 거쳐 검사 후 평가

1. [참고](https://luke7102.github.io/dev/2019/12/10/dev-create-blog-05.html)