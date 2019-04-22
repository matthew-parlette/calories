FROM alpine:3.9
MAINTAINER matthew.parlette@gmail.com

RUN apk update && apk --update add ruby ruby-irb ruby-json ruby-rake \
    ruby-bigdecimal ruby-io-console ruby-etc libstdc++ tzdata \
    sqlite sqlite-libs nodejs libxml2-dev

ADD Gemfile /app/
ADD Gemfile.lock /app/
ADD .gemrc /app/
WORKDIR /app

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    ca-certificates sqlite-dev libc-dev linux-headers && \
    cd /app && \
    gem install bundler --no-rdoc --no-ri && \
    gem install etc --no-rdoc --no-ri && \
    gem update --no-rdoc --no-ri --system && \
    bundle install --without development test && \
    apk del build-dependencies



    # Copy app with gems from former build stage
    # COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
    # COPY --from=Builder --chown=app:app /app /app
    #
    # # Set Rails env
    # ENV RAILS_LOG_TO_STDOUT true
    # ENV RAILS_SERVE_STATIC_FILES true
    # ENV EXECJS_RUNTIME Disabled

RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app
USER app
ADD --chown=app:app . /app
# RUN chown -R 1000:1000 /app
# USER 1000:1000

ENV RAILS_ENV production

# CMD ["bundle", "exec", "unicorn", "-p", "8080", "-c", "./config/unicorn.rb"]
EXPOSE 3000
CMD bundle exec rails db:create db:migrate && bundle exec rails assets:precompile && bundle exec rails server -b 0.0.0.0
