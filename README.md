![Version](https://img.shields.io/badge/version-1.1.2-blue.svg)

# What's NJUrepo

NJUrepo stands for **N**an**j**ing **U**niversity versatile **Repo**rt.

NJUrepo是为南京大学本科生设计的一个免于配置的作业、实验报告模板。希望它可以使你的作业/实验报告不会因形式上的缺陷导致评分的下降。

该文档格式基于 ctexbook, 主要完成了除了主体内容以外的几乎**全部**工作。同时，通过使用 Github 版本宏包，你还可以更好的管理自己的 $\LaTeX$ 文档。

## 安装方法

本宏包已被收纳于 CTAN 中，凡安装完整版 Texlive 用户可直接使用 `\usepackage{njurepo}`进行使用。若想获得最新版本的 NJUrepo 请前往github主页下载：https://github.com/zhengzangw/njurepo 

## 演示文档与帮助文档

* 问题求解作业 : ps
* ML/ICS/OS/数据通信 作业 : dc
* 数字电路/PA/OS Lab 实验报告 : ml
* 数学/物理 课程论文 : math
* 软件文档 : digital
* 帮助文档 : `make texdoc` 或 `texdoc njurepo` 以获得

## 使用方法

从 Github 上下载后使用命令 `make cls` 获得 .cls 宏包。可以仿照现成的文件 （`python util.py -g essay -n examples` 生成）直接使用该宏包，或者可以使用以下推荐方法。

Github 版本中同时包含了一个 Makefile 文件和 util.py 文件。这两个文件可以让你在一个文件夹内管理所有课程的作用和报告。具体方法为：

### 生成学科项目

parts 下每个文件夹代表着一个项目，每个项目由 cover.tex 配置文件和若干源文件组成。可以手动添加文件夹和配置文件，也可以使用命令 `python util.py -c project_name` 生成

生成完成后按提示配置 cover.tex。对于小作业而言，只需填需要的几个，其它全部留空即可

### 选择格式

Makefile 中内置了两个格式，可以通过 `python util.py -g single -n project-name -s one-single-file` 或 `make PROJECT=project-name NAME=one-single-file generate` 自动生成 single 格式，通过 `python util.py -g essay -n project-name` 或 `make PROJECT=project-name TYPE=essay generate` 自动生成 essay 格式

single: 默认格式

```tex
\documentclass[language=english]{njurepo}
\begin{document}
\frontmatter
\input{parts/math/cover}
\mainmatter
	\input{parts/math/one-single-file}
\backmatter
\end{document}
```

essay: 报告/论文格式

```tex
\documentclass[language=english]{njurepo}
\begin{document}
\frontmatter
\input{parts/examples/cover}
	\input{parts/examples/abstract}
	\maketitlepage % 封面
	\makeabstract % 摘要
	\tableofcontents % 目录
	\input{parts/examples/denotation} % 中英对照表
\mainmatter
	\input{parts/examples/chap01} % 主体内容
\backmatter
	\listoffigures % 图索引
	\listoftables % 表格索引
	\listofequations % 公式索引
	\bibliographystyle{ref/numeric} % 参考文献样式 ref/numeric,ref/author-year,plainnat,IEEEtran
	\bibliography{ref/refs} % 参考文献
	\include{parts/examples/ack} % 致谢
	\begin{appendix} % 附录
		\input{parts/examples/appendix01}
	\end{appendix}
\end{document}
```

### 生成文档

模板生成后，使用 `make PROJECT=project-name TYPE=essay` 及 `make PROJECT=project-name NAME=one-single-file` 来更新输出文档。

### 清理文件

`make all PROJECT=project-name NAME=one-single-file` 将在完成后自动清理过程文件，只留下 `.tex` 和 `.pdf` 文件    
`make distclean` 帮助删除主目录下所有 `.tex` 和 `.pdf` 文件

## 选项

* language: 目录(content)/章节(chapter)语言。无论选择哪个选择，中英均可输入。
  * chinese
  * english
* open: 正规出版物的章节出现在奇数页，也就是右手边的页面。选择 `open=any` 时，如果前一章的最后一页也是奇数，那么模板会自动生成一个纯粹的空白页。
  * any
  * right
* wide: 生成宽页面（可在作业时使用）
* draft: 生成 Draft 水印

## 默认加载的宏包

模板自动引入以下宏包，对于宏包功能，可使用 `texdoc` 或 STFW 获得帮助。

| 宏包名 | 用途 | 举例 |
| -- | -- | -- |
| etoolbox | 开发使用 ||
| ifxetex | 开发使用 ||
| xparse | 开发使用 ||
| kvoptions | 开发使用 ||
| ctexbook | 文档 ||
| unicode-math | 数学字体 ||
| xcolor | 颜色 ||
| fancyhdr | 页眉页脚 ||
| geometry | 页面设置 ||
| enumitem | 调整列表 ||
| environ | 定义环境 ||
| natbib | 参考文献 ||
| notoccite | 引用 ||
| watermark | 水印 ||
| hyperref | 超链接 ||
| tcolorbox | 边框 ||
| CJKfntef | 字体样式 | `\CJKunderdot{},\CJKunderline{}`|
| amsmath | 数学支持 ||
| ntheorem | 数学定理 ||
| physics | 物理符号 | `\grad{}` |
| stmaryrd | 更多数学符号 | `\trianglelefteqslant` |
| bbding | 符号 | `\FiveFlowerPetal` |
| graphicx | 插入图片 ||
| subcaption | 图片排版 | `subfigure` 环境 |
| pdfpages | pdf 插入 | `\includepdf{}`|
| tikz | tikz 绘图 ||
| dirtree | 绘制文件树 | `\dirtree{}`|
| array | 数学模式表格支持 | `array` 环境 |
| longtable | 表格支持 | `longtable` 环境 |
| booktabs | 表格支持 | `\toprule,\middlerule,\bottomrule` |
| multirow | 跨行 |`\multirow{2}{*}{content}`|
| tabularx | 表格支持 | X 选项 |
| diagbox | 斜线表格 | `\diagbox{}{}`|
| makecell | 单元格布局 | `\thead{},\rothead{},\diagbox{}{}` |
| float | 表格位置 | H 选项 |
| listings | 代码 | `lstinputlisting{}` |
| algorithm | 伪代码 | `algorithm` 环境 |
| algpseudocode | 伪代码 | `algorithmic` 环境 |
| verbatim | 无格式文本 | `verbatim` 环境 |

### 默认加载的 tikz library

* decorations
* pathmorphing
* graphs
* calc

## 自定义宏

* `\nchapter{}` 不带任何装饰的居中 chapter
* `nproblem` 无标号问题环境（适用于作业不抄题目）
* `nsolution` 无标号解答环境
* `cproblem` 好看的问题环境
* `csolution` 好看的解答环境
* `\sihao,\xiaosi` 字体大小调整
* `\songti,\heiti` 中文字体
* `\magenta{}, \red{}` 字体颜色
* 代码环境 `\begin{cplus} \end{cplus}`, 现支持：
  * code, cpseudo, cplus, shell, commandshell, verilog, python, latex
* `\blankpage` 空页
* `\figoptadd{option}{address}` 原地插入(H)图片
* `\figoptaddcap{option}{address}{caption}` 原地插入(H)图片
* `\tabncc{number-of-columns}{content}{caption}` 制作简易 n 列居中表格
* `\tabnc{number-of-columns}{content}` 制作简易 n 列居中表格
* `\inlinecite{}` 行内引用
* `\cite` 普通引用
* `\rom{2}` 罗马数字

## Contact

如果你使用时发现任何 bug 或得不到的格式，可以联系我或开 issue  
如果你有更好的作业/报告格式，欢迎添加或联系我帮忙添加  

## License

This file may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3c of this license or (at your option) any later version. The latest version of this license is in: http://www.latex-project.org/lppl.txt and version 1.3c or later is part of all distributions of LaTeX version 2005/12/01 or later.