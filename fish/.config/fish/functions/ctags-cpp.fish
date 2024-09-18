function ctags-cpp
  ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ --exclude="build*"
end
