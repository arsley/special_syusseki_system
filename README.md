# Special Syusseki System

## About

- 学校の授業にてチーム製作したタイムカード(遅刻罰則指導)管理システム

## Requirement

- Ruby 2.4.x
- bundler

## Specifications

- Rails 5.1.2


### Specific Library

- haml-rails
- webcamjs
- wicked_pdf

## Usage

### Prepare application

```
$ bundle install --without development test --path vendor/bundle
$ bundle exec rails db:migrate
```

### Run application

```
$ bundle exec rails s
```

