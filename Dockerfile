FROM alpine:3.9
MAINTAINER matthew.parlette@gmail.com

RUN apk update && apk --update add ruby ruby-irb ruby-json ruby-rake \
    ruby-bigdecimal ruby-io-console libstdc++ tzdata sqlite nodejs libxml2-dev

ADD Gemfile /app/
ADD Gemfile.lock /app/
ADD .gemrc /app/
WORKDIR /app

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    ca-certificates sqlite-dev libc-dev linux-headers && \
    cd /app && \
    gem install bundler --no-rdoc --no-ri && \
    gem update --no-rdoc --no-ri --system && \
    bundle install --without development test && \
    apk del build-dependencies

ADD . /app
RUN chown -R nobody:nogroup /app
USER nobody

ENV RAILS_ENV production

# CMD ["bundle", "exec", "unicorn", "-p", "8080", "-c", "./config/unicorn.rb"]
EXPOSE 3000
CMD rails db:create db:migrate && rails assets:precompile && rails server -b 0.0.0.0
