ssa-book site page
===========

# Requirements

To run this, you need:

1. `ruby` (with `rubygems`)
2. [jekyll](https://jekyllrb.com/)

# How to run

Just execute `./run.sh`

# Как пересобрать

1. Скопировать директорию `examples` куда-нибудь в отдельное место
1. Надо взять директории с кодом `code_ch1`, `code_ch2d` и `code_chm`, положить в `examples\master`
1. Запустить из консоли `Rscript web_run_all.R`
1. Скопировать директории вида `fragments_*` и `sources_*` в `_includes` в корне репозитория
1. Скопировать директории вида `img_*` в `img` в корне репозитория
1. Из-за косяка в одном из файлов `fragments_ch1` останется пара строчек со служебной
командой `FragmentSkip`, её надо найти поиском по тексту внутри файлов и удалить любым текстовым
редактором.
1. Успех