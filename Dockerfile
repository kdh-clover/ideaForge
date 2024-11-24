# 빌드 스테이지: JDK 17 이미지를 사용하여 애플리케이션을 빌드
FROM eclipse-temurin:17-jdk as build
# 작업 디렉토리 설정
WORKDIR /workspace/app

# Gradle 관련 파일들을 먼저 복사 (레이어 캐싱 최적화)
COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
RUN chmod +x ./gradlew

# 소스 코드 복사
COPY src src

# Gradle을 사용하여 애플리케이션 빌드 (jar 파일 생성)
RUN ./gradlew bootJar

# 실행 스테이지: 더 가벼운 JRE 이미지를 사용하여 실행 환경 구성
FROM eclipse-temurin:17-jre

#WORKDIR /workspace/app2

# 임시 파일을 위한 볼륨 설정 (성능 향상)
VOLUME /tmp
# 빌드 스테이지에서 생성된 jar 파일을 실행 환경으로 복사
COPY --from=build /workspace/app/build/libs/*.jar app.jar
# 컨테이너 실행 시 실행될 명령어 설정
ENTRYPOINT ["java", "-jar", "/app.jar"] 

# docker build -t chatgpt-intro .
# docker run -d -p 8080:8080 --name chatgpt-intro chatgpt-intro
# docker exec -it 7b61b61d46be /bin/sh
