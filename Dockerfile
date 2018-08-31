
FROM alpine:3.8 AS build

ARG VIMDIR=/root/.vim
ARG VIMDIR_PLUGINS=${VIMDIR}/pack/dist/start

WORKDIR /work
RUN apk add --no-cache git alpine-sdk ncurses-dev && \
  mkdir -p ${VIMDIR_PLUGINS} && \
  git clone https://github.com/vim-jp/syntax-vim-ex.git ${VIMDIR_PLUGINS}/syntax-vim-ex && \
  git clone https://github.com/scrooloose/nerdcommenter.git ${VIMDIR_PLUGINS}/nerdcommenter && \
  git clone https://github.com/scrooloose/nerdtree.git ${VIMDIR_PLUGINS}/nerdtree && \
  git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ${VIMDIR_PLUGINS}/nerdtree-git-plugin && \
  git clone https://github.com/airblade/vim-gitgutter.git ${VIMDIR_PLUGINS}/vim-gitgutter && \
  git clone https://github.com/vim-airline/vim-airline.git ${VIMDIR_PLUGINS}/vim-airline && \
  git clone https://github.com/vim-airline/vim-airline-themes.git ${VIMDIR_PLUGINS}/vim-airline-themes && \
  git clone https://github.com/tpope/vim-fugitive.git ${VIMDIR_PLUGINS}/vim-fugitive && \
  git clone https://github.com/jiangmiao/auto-pairs.git ${VIMDIR_PLUGINS}/auto-pairs && \
  git clone https://github.com/eduardbadillo/vim.git /vim && \
  cd /vim && \
  make && \
  make install && \
  rm -rf /vim && \
  apk del alpine-sdk

COPY vimrc ${VIMDIR}

ENTRYPOINT [ "/usr/local/bin/vim", "-c", "helptags ALL" ]
