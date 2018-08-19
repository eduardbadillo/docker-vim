
FROM alpine:3.8 AS build

WORKDIR /vim

RUN apk add --no-cache git
RUN git clone https://github.com/eduardbadillo/vim.git .
RUN apk add --no-cache alpine-sdk ncurses-dev
RUN make
RUN make install

RUN mkdir -p /root/.vim/pack/dist/start
RUN git clone https://github.com/vim-jp/syntax-vim-ex.git /root/.vim/pack/dist/start/syntax-vim-ex
RUN git clone https://github.com/scrooloose/nerdcommenter.git /root/.vim/pack/dist/start/nerdcommenter
RUN git clone https://github.com/scrooloose/nerdtree.git /root/.vim/pack/dist/start/nerdtree
RUN git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git /root/.vim/pack/dist/start/nerdtree-git-plugin
RUN git clone https://github.com/airblade/vim-gitgutter.git /root/.vim/pack/dist/start/vim-gitgutter
RUN git clone https://github.com/vim-airline/vim-airline.git /root/.vim/pack/dist/start/vim-airline
RUN git clone https://github.com/vim-airline/vim-airline-themes.git /root/.vim/pack/dist/start/vim-airline-themes
RUN git clone https://github.com/tpope/vim-fugitive.git /root/.vim/pack/dist/start/vim-fugitive
RUN git clone https://github.com/jiangmiao/auto-pairs.git /root/.vim/pack/dist/start/auto-pairs

COPY vimrc /root/.vim/


WORKDIR /work

ENTRYPOINT [ "/usr/local/bin/vim" ]
# ENTRYPOINT [ "/bin/sh" ]
