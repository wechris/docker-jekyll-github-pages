# A Docker image for Github's Jekyll

A Jekyll Docker image to build and view github-pages on my MacOS X.
:whale:

[Blogpost 'Docker Container for Github’s Jekyll'](https://wechris.github.io/tips-tutorials/docker/jekyll/2017/12/01/jekyll-docker-container/)

## Introduction

Build and run your Jekyll github-pages in a Docker container.

Checkout the project and build the Docker image:
```bash
docker build -t "wechris-jekyll" .
```

Checkout the Repo of your github-page to a subfolder and copy the Gemfile into the folder.
Run the Docker Jekyll image:
```
docker run -v $(pwd)/<path github-page-repo>:/home/mypage -w /home/mypage -p 4000:4000 wechris-jekyll bundle exec jekyll serve --host 0.0.0.0
```

If you want to run the Jekyll container with an interactive shell
```
docker run -it -v $(pwd)/<path github-page-repo>:/home/mypage -w /home/mypage -p 4000:4000 wechris-jekyll /bin/sh
```

Whenever you commit to the repository, GitHub Pages will run Jekyll to rebuild the pages in your site, from the content in your Markdown files.

![Docker](./img/jekyll-docker.jpg "Title is optional")
