# -*- coding:utf-8 -*-
import argparse
import os

COVER = "\\njusetup{\nctitle={中文标题},\n\tcsubtitle={},\n\tcdepartment={计算机科学与技术系},\n\tcmajor={计算机科学与技术},\n\tcauthor={姓名},\n\tstdid={12345678},\n\tcsupervisor={},\n\tcassosupervisor={},\n\tccosupervisor={},\n\teauthor={Name},\n\tetitle={English Title},\n\t esubtitle={},\n\tedegree={},\n\temajor={Computer Science and Technology},\n\tesupervisor={},\n\teassosupervisor={},\n\t%edate={December, 2005},\n\t%cdate={},\n\tckeywords={关键词1，关键词2},\n\tekeywords={Key1, Key2}\n}"

OPTION = "language=english,open=any,wide"
HEADER = "\\documentclass["+OPTION + \
    "]{njurepo}\n\\begin{document}\n\\frontmatter\n\\input{parts/examples/cover}\n"
FOOTER = "\n\\end{document}"
ESSAY = "\t\\input{parts/examples/abstract}\n\t\\maketitlepage % 封面\n\t\\makeabstract % 摘要\n\t\\tableofcontents % 目录\n\t\\input{parts/examples/denotation} % 中英对照表\n\\mainmatter\n\t\\input{parts/examples/chap01} % 主体内容\n\\backmatter\n\t\\listoffigures % 图索引\n\t\\listoftables % 表格索引\n\t\\listofequations % 公式索引\n\t\\bibliographystyle{ref/numeric} % 参考文献样式 ref/numeric,ref/author-year,plainnat,IEEEtran\n\t\\bibliography{ref/refs} % 参考文献\n\t\\include{parts/examples/ack} % 致谢\n\t\\begin{appendix} % 附录\n\t\t\\input{parts/examples/appendix01}\n\t\\end{appendix}"
SINGLE = "\\mainmatter\n\t\\input{parts/examples/specialname}\n\\backmatter"
EXAMPLE = "examples"

SINGLEFILE = "\\maketitle\n"


def parse():
    parser = argparse.ArgumentParser()
    parser.add_argument("-c", "--create", help="create a new module")
    parser.add_argument("-g", "--generate",
                        help="generate main.tex\n option: essay, single")
    parser.add_argument("-n", "--name", help="project name")
    parser.add_argument("-s", "--single", help="single file name")
    args = parser.parse_args()
    return args


if __name__ == "__main__":
    args = parse()
    if args.create != None:
        folder = os.path.exists("parts/"+args.create)
        if not folder:
            os.makedirs("parts/"+args.create)
            with open("parts/"+args.create+"/cover.tex", "w") as f:
                f.write(COVER)
            print("Succesfully build module {}".format(args.create))
        else:
            print("{} already exists".format(args.create))
    else:
        if args.generate != None:
            if args.name == None:
                print("You must specify project name by -n")
            else:
                if (args.generate == "essay"):
                    with open("main.tex", "w") as f:
                        f.write(HEADER.replace(EXAMPLE, args.name) +
                                ESSAY.replace(EXAMPLE, args.name)+FOOTER)
                elif (args.generate == "single"):
                    if args.single == None:
                        print("You must specify file name by -s")
                    else:
                        with open(args.single+".tex", "w") as f:
                            f.write(HEADER.replace(EXAMPLE, args.name)+SINGLE.replace(
                                EXAMPLE, args.name).replace("specialname", args.single)+FOOTER)
                        tmp = "parts/"+args.name+"/"+args.single+".tex"
                        if not os.path.exists(tmp):
                            f = open(tmp, "w")
                            f.write(SINGLEFILE)
                            f.close()
                else:
                    print("Option Error!")
