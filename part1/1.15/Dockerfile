FROM openjdk:11

WORKDIR /miniproject

COPY ./miniprojekti/ .
RUN ./gradlew build

CMD ["./gradlew", "run"]