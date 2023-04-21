# 원본 : https://github.com/sebo-b/warp
자리 예약 시스템(테스트 중)


## 구동 환경(파악 중)
- warp
- nginx
- flask
- postgres
- js 등등


## 빠른 실행 방법(ubuntu 20.04 기준)
### 1. docker 필수 유틸 설치
(우분투가 설치되어 있다고 가정함.)
```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install apt-transport-https
$ sudo apt install ca-certificates
$ sudo apt install curl
$ sudo apt install software-properties-common
```
### 2. docker 필수 유틸 설치

### 2.1 래포 접근을 위한 키 설정
```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
### 2.2 패키지 매니저가 docker 설치 시, 설치 위치를 알기 위한 repository 추가
```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
```

### 2.3 docker 설치
```
$ sudo apt update
$ sudo apt install docker-ce
```

### 2.4 docker 상태 확인
```
$ sudo systemctl status docker
```

### 3. 도커 컴포즈(docker compose) 설치
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/dockercompose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ docker-compose -v 

```

### 3. 래포지토리 복사 & 설치
```
$ git clone https://github.com/powerspt/warp.git
$ cd warp

$ docker compose -f demo_compose.yaml up
```

### 4. 기타 안내사항
1. 설치 후 http://127.0.0.1으로 접속가능함.
2. Admin 계정은 ID : `admin` password : `noneshallpass`
3. 사용자 계정은 직접 만들어서 DB 인젝션으로 추가하는 방식을 사용함.
4. Dbeaver 등 5432 포트로 바로 접속 가능.
Host : 서버 내/외부 IP, Database : postgres
Username : postgres, PW : postgres_password


### 5. 앞으로 할 일
1. nginx를 도커에서 빼내서 Https 연결 설정.
2. 리버스 프록시 구현
3. 

마개조 버전이니 꼭, 원본을 확인하고 작업할 필요가 있음.
https://github.com/sebo-b/warp

### without Docker - the old way

You need a working Python3 environment, Node.js, and PostgreSQL, and I won't cover it here. This is not a preferred way, use it only for debugging or development purposes. Things may change, and this section can be outdated - but I assume that you know what you are doing.

From the command line:

```
# clone repo
$ git clone https://github.com/sebo-b/warp.git
$ cd warp

# create virtual envirnoment and activate it
$ python3 -m venv --prompt warp .venv
$ source .venv/bin/activate

# install python requirements
# if this raises an error in psycopg2, either install its all build dependencies
# or change psycopg2 to psycopg2-binary in requirements.txt
$ pip install -r requirements.txt

# compile JavaScript files
$ pushd js
$ npm ci
$ npm run build
$ popd

# setup Flask and database URL
$ export FLASK_APP=warp
$ export FLASK_ENV=development
$ export WARP_DATABASE=postgresql://warp:warp@localhost:5432/warp

# run the app
$ flash run
```

After that, open http://127.0.0.1:5000 in your browser and log in as `admin` with password `noneshallpass`.

