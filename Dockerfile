FROM ruby:3.0.2
ENV APP_NAME haraherhythm

RUN apt-get update && apt-get install -y \
    build-essential \
    libgmp3-dev  \
    ruby-dev  \
    nodejs \
    npm \
    vim
RUN npm install --global yarn
RUN apt-get install libxml2-dev

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
EXPOSE 4869

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
