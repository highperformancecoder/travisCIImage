FROM opensuse/leap:15.5
ADD . /root
#RUN zypper dup -y -l
RUN zypper addrepo https://download.opensuse.org/repositories/home:hpcoder1/15.5/home:hpcoder1.repo
RUN zypper --gpg-auto-import-keys refresh
RUN zypper --non-interactive install -y -l git make ccache gcc13-c++ clang tcl-devel tk-devel libdb-4_8-devel gsl-devel cairo-devel pango-devel readline-devel gdbm-devel libXss-devel unittest++-devel libxml2-devel libtiff-devel libopenssl-devel
# Boost
RUN zypper --non-interactive install -y -l libboost_headers1_75_0-devel libboost_thread1_75_0-devel libboost_date_time1_75_0-devel libboost_filesystem1_75_0-devel libboost_program_options1_75_0-devel libboost_regex1_75_0-devel libboost_system1_75_0-devel libboost_python-py3-1_75_0-devel 

# Minsky specific packages here
RUN zypper --non-interactive install -y -l tar librsvg2-devel octave-cli blas-devel firefox xvfb-run xorg-x11-fonts xauth which csvprintf rsvg-convert libclipboard-devel
RUN zypper --non-interactive install -y -l npm nodejs20-devel
RUN npm install -g jest
RUN npm install -g ts-node
RUN ln -sf /usr/local/lib/node_modules/jest/bin/jest.js /usr/local/bin/jest

# For EcoLab
#RUN zypper --non-interactive install unuran

# SciDAVis specific packages
RUN zypper install -y -l libqwt-qt5-5-devel libqt5-qtsvg-devel  libqt5-qtwayland libtirpc-devel muparser-devel python3-devel glu-devel python3-numpy liborigin-devel libqt5-linguist-devel

# LaTeX
RUN zypper --non-interactive install -y -l  texlive-collection-latex latex2html texlive-epstopdf-bin texlive-pstricks lyx
# fix texlive bug: https://forums.opensuse.org/showthread.php/528778-mktexfmt-ERROR-user-mode-but-path-setup-is-sys-type-bailing-out
RUN mkdir /run/texlive
RUN touch /var/run/texlive/run-hyphen
RUN touch /var/run/texlive/run-fmtutil.language
RUN touch /var/run/texlive/run-fmtutil.refresh
RUN /usr/share/texmf/texconfig/update

# some additional debugging tools
RUN zypper --non-interactive install -y -l  emacs-nox gdb

# linkchecker
RUN zypper --non-interactive  install python311-base python311-pip
RUN pip3.11 install git+https://github.com/linkchecker/linkchecker.git

