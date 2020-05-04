FROM ruby:2.6.0

WORKDIR /ruby

RUN apt update && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs

COPY ./rails-example-project/ ./

RUN bundle install
RUN rails db:migrate

CMD ["rails", "s"]