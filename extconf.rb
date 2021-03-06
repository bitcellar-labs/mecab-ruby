require 'mkmf'

mecab_config = with_config('mecab-config', 'mecab-config')
use_mecab_config = enable_config('mecab-config')

`mecab-config --libs-only-l`.chomp.split.each { | lib |
  have_library(lib)
}

dir_config('mecab',
    `mecab-config --inc-dir`.strip,
    `mecab-config --libs-only-L`.strip)

$CFLAGS += ' ' + `#{mecab_config} --cflags`.chomp

have_header('mecab.h') && create_makefile('MeCab')
