# A Docker image for Github's Jekyll

A Jekyll Docker image to build and view github-pages on my MacOS X.
:whale:

## Introduction

Build and run your Jekyll github-pages in a Docker container.

Checkout the project and build the Docker image:
```bash
docker build -t "wechris-jekyll" .
```
Checkout the Repo of your github-page to a subfolder 
Run the Docker Jekyll image:
```bash
docker run -v $(pwd)/<path github-page-repo>:/home/mypage -w /home/mypage -p 4000:4000 wechris-jekyll bundle exec jekyll serve --host 0.0.0.0
```

If you want to run the Jekyll container with an interactive shell
```bash
docker run -it -v $(pwd)/<path github-page-repo>:/home/mypage -w /home/mypage -p 4000:4000 wechris-jekyll /bin/sh
```
