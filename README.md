[![C++ build](https://github.com/hookSSi/hookssi_template/actions/workflows/main.yml/badge.svg)](https://github.com/hookSSi/hookssi_template/actions/workflows/main.yml)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

# 만든 목적

[Ashblue](https://github.com/ashblue) 라는 개발자분처럼 git 프로젝트를 예쁘게 관리해보려고 템플릿을 만들었습니다.

# 요구사항

* nodejs(nodejs안에 npm이 포함되어 있습니다.)
* git
* github

# 사용법
기본적으로 프로젝트를 한번 테스트 해보고 싶다고 생각합니다.

참고로 c++ 코드는 무시하고 commit만 테스트 해보시길 바랍니다.

방법은 다음과 같습니다.

1. git clone
1. package.json안에 git url과 같은 기본 정보를 수정합니다.
1. npm install
1. git add
1. npm run commit
1. git push

이렇게 하면 actions에 등록된 job이 실행되어 다시 한번 commit 내용을 commitlint를 통해 검사하며

빌드와 테스트 후 semantic-release를 통해 자동으로 versioning을 하여 git tag를 생성합니다.

customizing 하고 싶다면 건들여야하는 파일은 크게 .releaserc, package.json, github actions 정도가 있다고 생각합니다만

아직은 어떻게 정리해서 이야기해드려야 할지 모르겠습니다.

다만 궁금한 걸물어봐주신다면 최대한 대답해드리겠습니다.

# 환경 만드는 법(대략적인?)

## husky

git의 hook을 관리하는 툴

1. npx husky .husky/{hook의 이름} "{실행할 hook}" - 현재는 npm 버전이 7.x는 되어야합니다. (reddit인가에서 찾은 거 같은 데 출처는 기억안나지만 그렇습니다.)

## commitizen

커밋 메시지의 템플릿을 제공하는 것

1. npm install

1. package.json을 통해 필요한 패키지들이 설치됨 ex) commitizen, husky, commitlint 등

1. git cz를 통해 커밋 작성하는 방식입니다.

하지만 husky와 연동하면 commit 메시지를 commitizen으로만 작성하도록 유도할 수 있습니다.

1. npx husky add .husky/prepare-commit-msg "npx exec < /dev/tty && git cz --hook || true"

원래는 그렇지만 윈도우에서는 버그 때문인지 영 모양새가 안좋게 출력됩니다.

그래서 일반적인 git commit 대신 package.json > script 안에 정의를 하여 npm run commit으로 대신했습니다.

## commitlint

커밋 메시지의 템플릿을 강제하도록 검사하는 툴

이것을 husky와 연동하여 commit하기 전에 commit 메시지를 검사하도록 합니다.

hook 추가는 다음과 같이 했습니다.

1. npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"

그래서 최소 2번 commitlint의 검사가 일어납니다.

commit 하기 전에 1번 main에 push 되거나 merge 되어 github action에서 1번

## semantic-release (option)

커밋 메시지 포멧에 따라 버전을 매겨주는 툴

commitizen을 통해 작성하여 commitlint에 의해 검사 받은 commit 메시지의 포멧에 따라 예를 들면:

| Commit message                                                                                                                                                                                   | Release type               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `fix(pencil): stop graphite breaking when too much pressure applied`                                                                                                                             | Patch Release              |
| `feat(pencil): add 'graphiteWidth' option`                                                                                                                                                       | ~~Minor~~ Feature Release  |
| `perf(pencil): remove graphiteWidth option`<br><br>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br>`The default graphite width of 10mm is always used for performance reasons.` | ~~Major~~ Breaking Release |

이런식으로 구분되어 [표준](https://semver.org/lang/ko/)에 따라 매겨집니다.

## github action

travis-ci는 개인적으로 쓰기에 갱신해야하는 불편함이 생길 거 같아서

github action을 사용하기로 했습니다.

약간의 차이만 있을 뿐 거의 비슷하고 좋아서 추천드립니다.

# 정리하면서...

다른 어떤 저의 프로젝트보다 깔끔하게 만들려고 노력했습니다.

꼭 저만이 아니라도 동아리 후배들도 쉽게 쓸 수 있도록 많은 피드백 부탁드립니다.