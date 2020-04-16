FROM opensuse/tumbleweed
ADD . /root
RUN zypper addrepo https://download.opensuse.org/repositories/home:hpcoder1/openSUSE_Tumbleweed/home:hpcoder1.repo
RUN zypper --gpg-auto-import-keys refresh
RUN zypper --non-interactive install -y -l git make ccache gcc-c++ tcl-devel tk-devel json_spirit-devel gsl-devel cairo-devel pango-devel readline-devel gdbm-devel libXss-devel unittest++-devel libxml2-devel libtiff-devel libopenssl-devel
# Boost
RUN zypper --non-interactive install -y -l boost-devel libboost_date_time-devel libboost_filesystem-devel libboost_program_options-devel libboost_regex-devel libboost_system-devel libboost_thread-devel libboost_python3-devel python3-devel 
# Minsky specific packages here
#RUN zypper --non-interactive install -y -l librsvg2-devel octave-cli blas-devel firefox xvfb-run xorg-x11-fonts xauth which soci-devel  csvprintf texlive-latex-bin-bin texlive-epstopdf-bin latex2html
RUN zypper --non-interactive install -y -l librsvg2-devel octave-cli blas-devel firefox xvfb-run xorg-x11-fonts xauth which soci-devel  csvprintf
# SciDAVis specific packages
RUN zypper install -y -l libqwt-qt5-5-devel libqt5-qtsvg-devel  libqt5-qtwayland libqwtplot3d-qt5-0-devel libtirpc-devel muparser-devel libboost_python3-devel python3-devel glu-devel python3-numpy liborigin-devel libqt5-linguist-devel
# LaTeX
RUN zypper --non-interactive install -y -l  texlive-collection-latex latex2html
# fix texlive bug: https://forums.opensuse.org/showthread.php/528778-mktexfmt-ERROR-user-mode-but-path-setup-is-sys-type-bailing-out
RUN mkdir /run/texlive
RUN touch /var/run/texlive/run-hyphen
RUN touch /var/run/texlive/run-fmtutil.language
RUN touch /var/run/texlive/run-fmtutil.refresh
RUN /usr/share/texmf/texconfig/update
