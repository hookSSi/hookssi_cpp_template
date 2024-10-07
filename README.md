[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

# 개요

C++ 프로젝트를 위한 템플릿 프로젝트

# 요구사항

* nodejs(nodejs안에 npm이 포함되어 있습니다.)
* git
* github

# 사용법

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

# 환경 설정

## husky

git의 hook을 관리하는 툴

1. npx husky .husky/{hook의 이름} "{실행할 hook}"

## commitizen

Commit 메시지 작성 시 템플릿을 제공합니다.

1. npm install

1. package.json을 통해 필요한 패키지들이 설치됨 ex) commitizen, husky, commitlint 등

1. git cz를 통해 커밋 작성하는 방식입니다.

하지만 husky와 연동하면 commit 메시지를 commitizen으로만 작성하도록 유도할 수 있습니다.

1. npx husky add .husky/prepare-commit-msg "npx exec < /dev/tty && git cz --hook || true"

원래는 그렇지만 윈도우에서는 버그 때문인지 영 모양새가 안좋게 출력됩니다.

그래서 일반적인 git commit 대신 package.json > script 안에 정의를 하여 npm run commit으로 대신했습니다.

## commitlint

Commit 메시지를 검사하여 해당 메시지가 규칙에 유효한지 검사합니다.

이것을 husky와 연동하여 commit하기 전에 commit 메시지를 검사하도록 합니다.

hook 추가는 다음과 같이 했습니다.

1. npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"

그래서 최소 2번 commitlint의 검사가 일어납니다.

commit 하기 전에 1번 main에 push 되거나 merge 되어 github action에서 1번

## semantic-release (option)

semantic versioning 이라는 규칙에 따라 자동으로 버전을 갱신합니다.

commitizen을 통해 작성하여 commitlint에 의해 검사 받은 commit 메시지의 포멧에 따라 예를 들면:

| Commit message                                                                                                                                                                                   | Release type               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `fix(pencil): stop graphite breaking when too much pressure applied`                                                                                                                             | Patch Release              |
| `feat(pencil): add 'graphiteWidth' option`                                                                                                                                                       | ~~Minor~~ Feature Release  |
| `perf(pencil): remove graphiteWidth option`<br><br>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br>`The default graphite width of 10mm is always used for performance reasons.` | ~~Major~~ Breaking Release |

이런식으로 구분되어 [표준](https://semver.org/lang/ko/)에 따라 매겨집니다.