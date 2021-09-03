FROM ruby:2.7.4
ENV APP_NAME haraherhythm

RUN apt-get update -qq && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install --global yarn && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential imagemagick libpq-dev
RUN yarn install

ENV TZ='Asia/Tokyo'

RUN mkdir /${APP_NAME}
WORKDIR /${APP_NAME}

# Docker内部でGemfile、Gemfile.lockをどこに配置するかを決める記述
ADD Gemfile /${APP_NAME}/Gemfile
ADD Gemfile.lock /${APP_NAME}/Gemfile.lock

ENV BUNDLER_VERSION 2.2.3
RUN gem install bundler -v ${BUNDLER_VERSION}
RUN bundle install
COPY . /${APP_NAME}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 5000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
