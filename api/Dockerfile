FROM ruby:2.7.1

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \        
  nodejs \
  sudo \
  nginx \
  && rm -rf /var/lib/apt/lists/* 

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install

ADD . /app
RUN mkdir -p tmp/sockets
# RUN mkdir tmp/pids

# nginx
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]