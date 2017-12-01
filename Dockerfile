FROM alpine:latest
# Docker image for Jekyll to build github-pages
#
# docker build -t "wechris-jekyll" .
# docker run -v $(pwd)/io:/home/mypage -w /home/mypage -p 4000:4000 wechris-jekyll bundle exec jekyll serve --host 0.0.0.0
# docker run -it -v $(pwd)/io:/home/mypage -w /home/mypage -p 4000:4000 wechris-jekyll /bin/sh
# 
#
MAINTAINER wechris

# Install base, Ruby, Headers, Jekyll, Bundler, github-pages Export Path
RUN apk update
RUN apk upgrade
RUN apk add curl wget bash cmake
RUN apk add ruby ruby-bundler ruby-dev ruby-irb ruby-rdoc libatomic readline readline-dev \
libxml2 libxml2-dev libxslt libxslt-dev zlib-dev zlib \
libffi-dev build-base git nodejs
RUN export PATH="/root/.rbenv/bin:$PATH"
RUN rm -rf /var/cache/apk/*
# Install Jekyll and required gems
RUN gem install bundler
RUN gem install jekyll
RUN gem install github-pages
RUN mkdir /home/mypage
