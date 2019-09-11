FROM opensuse/tumbleweed
ADD . /root
RUN zypper addrepo https://download.opensuse.org/repositories/home:hpcoder1/openSUSE_Tumbleweed/home:hpcoder1.repo
RUN zypper --gpg-auto-import-keys refresh
RUN zypper --non-interactive install -y -l git make ccache gcc-c++ tcl-devel tk-devel json_spirit-devel gsl-devel cairo-devel pango-devel readline-devel gdbm-devel libXss-devel unittest++-devel libxml2-devel libtiff-devel 
# Boost
RUN zypper --non-interactive install -y -l boost-devel libboost_date_time-devel libboost_filesystem-devel libboost_program_options-devel libboost_regex-devel libboost_system-devel libboost_thread-devel
# Minsky specific packages here
RUN zypper --non-interactive install -y -l librsvg2-devel octave-cli blas-devel firefox xvfb-run xorg-x11-fonts xauth which soci-devel 
RUN cd /root && git clone https://github.com/highperformancecoder/ecolab.git
