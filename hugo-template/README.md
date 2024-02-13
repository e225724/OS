# How to use hugo  in ie.u-ryukyu.ac.jp

first clone this project to your gitlab

# clone

login to some server (such as amane )

clone hugo-templte

```
    cd ~/src
    git clone https://gitlab.ie.u-ryukyu.ac.jp/ie-web/hugo-template/hugo-template.git
```

edit .git/config, remove remote origin line

# create your own hugo repositiry

First, create gitlab project under students group.

rm origin line in .git/config

    git remote add origin https://gitlab.ie.u-ryukyu.ac.jp/your_repository
    git branch -M main
    git push -uf origin main


# make-blog.pl
make-blog.pl is interactive blog setting script.

## Usage
```
    perl make-blog.pl 
```

this will create config.toml and theme/ananke as submodule

## contents

write md as

    content/post/2022/09/21/1.md

md should contains a header like this.

```
---
title: ほげほげ
author: kono
---

です
```


## publish

try

```
   export HUGO_CACHEDIR=$HOME/.local/share/hugo
   perl publish.pl 
```

（we should set HUGO_CAACHEDIR in publlish.pl. fix me)

if this is correct

```
   perl publish.pl  | sh -v
```

## url

some thing like this

```
  https://ie.u-ryukyu.ac.jp/~e245715/hugo
```

## NetlifyCMS and .gitlab_ci

  comming soon



