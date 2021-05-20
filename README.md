[![C++ build](https://github.com/hookSSi/hookssi_template/actions/workflows/main.yml/badge.svg)](https://github.com/hookSSi/hookssi_template/actions/workflows/main.yml)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

# 만든 목적

Ashblue 라는 개발자분 처럼 git 프로젝트를 예쁘게 관리해보려고 시도하는 저장소

덤으로 쉽게 할 수 있다면 템플릿의 느낌으로 정리하고 싶다.

# 환경 만드는 법

## husky

git의 hook을 관리하는 툴

1. npx husky .husky/{hook의 이름} "{실행할 hook}" - npm 버전이 7.13은 되어야함

## commitizen

커밋 메시지의 템플릿을 제공하는 것

1. npm install

1. package.json을 통해 필요한 패키지들이 설치됨 ex) commitizen, husky, commitlint 등

1. git cz를 통해 커밋 작성하는 방식이다.

하지만 husky와 연동하면 commit 메시지를 commitizen으로만 작성하도록 유도할 수 있다.

1. npx husky add .husky/prepare-commit-msg "npx exec < /dev/tty && git cz --hook || true"

원래는 그렇지만 윈도우에서는 버그 때문인지 영 모양새가 안좋게 출력된다.

그래서 일반적인 git commit 대신 npm run commit으로 commit을 대신하길 바란다.

## commitlint

커밋 메시지의 템플릿을 강제하도록 검사하는 툴

이것을 husky와 연동하여 commit하기 전에 commit 메시지를 검사하도록 한다.

1. npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"

## semantic-release (option)

커밋 메시지 포멧에 따라 버전을 매겨주는 툴

즉 commitizen을 통해 작성하여 commitlint에 의해 검사 받은 commit 메시지의 포멧에 따라 예를 들면:

| Commit message                                                                                                                                                                                   | Release type               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `fix(pencil): stop graphite breaking when too much pressure applied`                                                                                                                             | Patch Release              |
| `feat(pencil): add 'graphiteWidth' option`                                                                                                                                                       | ~~Minor~~ Feature Release  |
| `perf(pencil): remove graphiteWidth option`<br><br>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br>`The default graphite width of 10mm is always used for performance reasons.` | ~~Major~~ Breaking Release |

이런식으로 구분되어 [표준](https://semver.org/lang/ko/)에 따라 매겨진다. 

# git action

travis-ci는 개인적으로 쓰기에 갱신해야하는 불편함이 생길 거 같아서

github에서 제공해주는 action을 통해 테스트와 빌드를 해볼려고 한다.
