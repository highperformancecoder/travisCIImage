FROM opensuse/leap:15.4
ADD . /root
#RUN zypper dup -y -l
RUN zypper addrepo https://download.opensuse.org/repositories/home:hpcoder1/15.4/home:hpcoder1.repo
RUN zypper --gpg-auto-import-keys refresh
RUN zypper --non-interactive install -y -l git make ccache gcc-c++ tcl-devel tk-devel libdb-4_8-devel gsl-devel cairo-devel pango-devel readline-devel gdbm-devel libXss-devel unittest++-devel libxml2-devel libtiff-devel libopenssl-devel
# Boost
RUN zypper --non-interactive install -y -l boost-devel libboost_date_time-devel libboost_filesystem-devel libboost_program_options-devel libboost_regex-devel libboost_system-devel libboost_thread-devel libboost_python3-devel python39-devel 

# Minsky specific packages here
RUN zypper --non-interactive install -y -l librsvg2-devel octave-cli blas-devel firefox xvfb-run xorg-x11-fonts xauth which csvprintf rsvg-convert libclipboard-devel
RUN zypper --non-interactive install -y -l npm nodejs14-devel
# update npm
RUN npm install -g npm@7

# SciDAVis specific packages
RUN zypper install -y -l libqwt-qt5-5-devel libqt5-qtsvg-devel  libqt5-qtwayland libtirpc-devel muparser-devel libboost_python3-devel python3-devel glu-devel python3-numpy liborigin-devel libqt5-linguist-devel

# LaTeX
RUN zypper --non-interactive install -y -l  texlive-collection-latex latex2html texlive-epstopdf-bin texlive-pstricks
# fix texlive bug: https://forums.opensuse.org/showthread.php/528778-mktexfmt-ERROR-user-mode-but-path-setup-is-sys-type-bailing-out
RUN mkdir /run/texlive
RUN touch /var/run/texlive/run-hyphen
RUN touch /var/run/texlive/run-fmtutil.language
RUN touch /var/run/texlive/run-fmtutil.refresh
RUN /usr/share/texmf/texconfig/update

# some additional debugging tools
RUN zypper --non-interactive install -y -l  emacs-nox gdb

# linkchecker
RUN zypper --non-interactive  install python39-base python39-pip
RUN pip3.9 install git+https://github.com/linkchecker/linkchecker.git

