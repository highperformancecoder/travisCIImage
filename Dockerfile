FROM opensuse/tumbleweed
ADD . /root
RUN zypper addrepo https://download.opensuse.org/repositories/home:hpcoder1/openSUSE_Tumbleweed/home:hpcoder1.repo
RUN zypper --gpg-auto-import-keys refresh
RUN zypper --non-interactive install -y -l git make ccache gcc-c++ tcl-devel tk-devel boost-devel json_spirit-devel librsvg2-devel gsl-devel cairo-devel pango-devel readline-devel gdbm-devel libXss-devel ccache
RUN cd /root && git clone https://github.com/highperformancecoder/ecolab.git
