[![Build Status](https://travis-ci.org/zhengzangw/njurepo.svg?branch=master)](https://travis-ci.org/zhengzangw/njurepo)
![Version](https://img.shields.io/badge/status-building.svg)

# WARNING
**It's still a toy!** 
**It's still a toy!**
**It's still a toy!**

This means you need to take risks if you use the under building project. You can turn to following document class if you want to have a nice essay:

* ThuThesis: https://github.com/xueruini/thuthesis

# What's NJUrepo?
NJUrepo stands for <b>N</b>an<b>j</b>ing <b>U</b>niversity versatile <b>Repo</b>rt.

此宏包旨在建立一个免于配置的作业、实验报告模板。

# Makefile的用法

```shell
make [{all|thesis|shuji|doc|clean|cleanall|distclean}] \
     [METHOD={latexmk|xelatex|pdflatex}]
```

## 目标
* `make all`       等于 `make thesis && make shuji && make doc`；
* `make cls`       生成模板文件；
* `make example`    生成实例 example.pdf；
* `make doc`       生成使用说明书 njurepo.pdf；
* `make clean`     删除示例文件的中间文件（不含 example.pdf）；
* `make cleanall`  删除示例文件的中间文件和 example.pdf；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDsF。

## 参数
* **METHOD**：指定生成 pdf 的方式，缺省采用 latexmk。
  * METHOD=latexmk  表示使用 latexmk 的方式生成 pdf（使用 xelatex）。
  * METHOD=xelatex  表示使用 xelatex 引擎编译生成 pdf；
  * METHOD=pdflatex 表示使用 pdflatex 引擎编译生成 pdf。