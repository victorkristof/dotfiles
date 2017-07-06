source ~/.bashrc
##
# Your previous /Users/victorkristof/.bash_profile file was backed up as /Users/victorkristof/.bash_profile.macports-saved_2011-09-09_at_10:47:21
##

# Weka classpath
export CLASSPATH="/Applications/Weka.app/Contents/Java/weka.jar:/Applications/Weka.app/Contents/Java/libsvm.jar:/Applications/Weka.app/Contents/Java/liblinear.jar"

# MacPorts Installer addition on 2011-09-09_at_10:47:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

PATH="/usr/local/mysql/bin:${PATH}"
export PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export VERSIONER_PYTHON_PREFER_64_BIT=no
export VERSIONER_PYTHON_PREFER_32_BIT=yes

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# export PATH=/Users/victorkristof/.rvm/gems/ruby-1.9.3-p545/bin:/Users/victorkristof/.rvm/gems/ruby-1.9.3-p545@global/bin:/Users/victorkristof/.rvm/rubies/ruby-1.9.3-p545/bin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/heroku/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/victorkristof/.rvm/bin:/usr/local/mysql/bin:/usr/local/mysql/bin:/usr/local/mysql/bin

# RabbitMQ
# PATH=$PATH:/usr/local/sbin

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
# export PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
# export PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
