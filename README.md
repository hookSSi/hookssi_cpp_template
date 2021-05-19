
# 만든 목적
Ashblue 라는 개발자분 처럼 git 프로젝트를 예쁘게 관리해보려고 시도하는 저장소

덤으로 쉽게 할 수 있다면 템플릿의 느낌으로 정리하고 싶다.

# 환경 만드는 법
## commitizen 

커밋 메시지의 템플릿을 제공하는 것

1. npm 설치
2. npm install commitizen -g
3. npm init --yes (다른 저장소의 package.json 가져와 작성하여 npm install을 이용해 4를 건너뛰는 방법도 있다.)
4. commitizen init cz-conventional-changelog --save-dev --save-exact
5. git cz를 통해 커밋 작성

## git action 

travis-ci는 개인적으로 쓰기에 갱신해야하는 불편함이 생길 거 같아서 

github에서 제공해주는 action을 통해 테스트와 빌드를 해볼려고 한다.
