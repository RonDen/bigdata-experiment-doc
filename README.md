# 大数据平台搭建实验手册

本文档记录了本人暑期小学期大数据实验课程的相关内容，记录了
环境安装配置的过程，内容涵盖了Hadoop分布式配置及HA高可用、Spark、Storm等
大数据处理平台。
对于学习大数据技术入门可以起到一定的帮助作用。
全手册采用LaTeX编排完成。对于学习LaTeX排版也有一定的帮助，故此开源。

特点如下：

1. 使用了listings宏包，并添加了常见编程语言（C++、Java、Shell、XML，见code_format.sty文件）的配置，能够优雅地在文章显示代码片段。
2. 学习LaTeX插图，给出了subfig图片并排处理、图片表格浮动体的示例。
3. 有趣好看的章节标题和双排中文目录的设置。
4. 对于学习大数据技术等也有着基本的参考和借鉴价值。

关于目录的设置，可以参考CTex中文宏包的描述
```tex
\ctexset {
section = {
    name = {第,部分},
    number = \chinese{section},
},
subsection = {
    name = {第,节},
    number = \chinese{subsection},
}
}
```

4. `titlesec`宏包的示例，定制漂亮的章节标题样式，字体颜色等，还有标题前面的小象。

```tex
\titleformat{\section}
            {\LARGE\bfseries\sffamily\color{RoyalBlue}}
            {\includegraphics[height=2em]{hadoop/hadoop2.png} \thesection{}.}
            {1em}
            {\huge\scshape}
```

5. `multitoc`宏包，显示双栏目录。
6. `input`用法，减少单文件过大不方便编辑，大文档分步编译，方便Debug。
7. 实验报告封面的设计，可供参考和借鉴。如需使用，替换成自己的Logo即可。

## 版权问题

[LICENSE](./LICENSE)。封面Logo为[北京化工大学](www.buct.edu.cn)所有。若需使用本文档，替换成自己的Logo即可。

## 编译说明

本文档由[XeTeX](http://xetex.sourceforge.net/)编译，采用texlive2019发行版。
环境为VS Code，[LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)插件提供支持。

## 内容预览

文档基本内容如下：

![前言](img/readme/before.png)

![目录](img/readme/toc.png)

![yarn-site](img/readme/yarn-site.png)

![storm topo](img/readme/topo.png)

![spark](img/readme/spark.png)

![sqoop](img/readme/sqoop.png)

![storm](img/readme/storm-jar.png)

![hive](img/readme/hive.png)

![hbase](img/readme/hbase.png)

